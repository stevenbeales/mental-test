module FileUtils

  unless method_defined?(:ln_r)

    #
    # Options: noop verbose dereference_root remove_destination
    #
    # Hard link +src+ to +dest+. If +src+ is a directory, this method links
    # all its contents recursively. If +dest+ is a directory, links
    # +src+ to +dest/src+.
    #
    # +src+ can be a list of files.
    #
    #   # Installing ruby library "mylib" under the site_ruby
    #   FileUtils.rm_r site_ruby + '/mylib', :force
    #   FileUtils.ln_r 'lib/', site_ruby + '/mylib'
    #
    #   # Examples of copying several files to target directory.
    #   FileUtils.ln_r %w(mail.rb field.rb debug/), site_ruby + '/tmail'
    #   FileUtils.ln_r Dir.glob('*.rb'), '/home/aamine/lib/ruby', :noop => true, :verbose => true
    #
    #   # If you want to copy all contents of a directory instead of the
    #   # directory itself, c.f. src/x -> dest/x, src/y -> dest/y,
    #   # use following code.
    #   FileUtils.ln_r 'src/.', 'dest'     # cp_r('src', 'dest') makes src/dest,
    #                                      # but this doesn't.
    #
    # TODO: Why --remove-destination and not just --force?
    def ln_r(src, dest, options = {})
      fu_check_options options, OPT_TABLE['ln_r']
      fu_output_message "ln -r#{options[:remove_destination] ? ' --remove-destination' : ''} #{[src,dest].flatten.join ' '}" if options[:verbose]
      return if options[:noop]
      options = options.dup
      options[:dereference_root] = true unless options.key?(:dereference_root)
      fu_each_src_dest(src, dest) do |s, d|
        link_entry s, d, options[:dereference_root], options[:remove_destination]
      end
    end
    module_function :ln_r

    OPT_TABLE = {} unless const_defined?(:OPT_TABLE)
    OPT_TABLE['ln_r'] = [:noop, :verbose, :dereference_root, :remove_destination]

    #
    # Hard links a file system entry +src+ to +dest+.
    # If +src+ is a directory, this method links its contents recursively.
    #
    # Both of +src+ and +dest+ must be a path name.
    # +src+ must exist, +dest+ must not exist.
    #
    # If +dereference_root+ is true, this method dereference tree root.
    #
    # If +remove_destination+ is true, this method removes each destination file before copy.
    #
    def link_entry(src, dest, dereference_root = false, remove_destination = false)
      Entry_.new(src, nil, dereference_root).traverse do |ent|
        destent = Entry_.new(dest, ent.rel, false)
        File.unlink destent.path if remove_destination && File.file?(destent.path)
        ent.link destent.path
      end
    end
    module_function :link_entry

    class Entry_ #:nodoc:
      def link(dest)
        case
        when directory?
          if !File.exist?(dest) and descendant_diretory?(dest, path)
            raise ArgumentError, "cannot link directory %s to itself %s" % [path, dest]
          end
          begin
            Dir.mkdir dest
          rescue
            raise unless File.directory?(dest)
          end
        else file?
          File.link path(), dest
        end
      end

      unless const_defined?(:DIRECTORY_TERM)
        if File::ALT_SEPARATOR
          DIRECTORY_TERM = "(?=[/#{Regexp.quote(File::ALT_SEPARATOR)}]|\\z)".freeze
        else
          DIRECTORY_TERM = "(?=/|\\z)".freeze
        end
        SYSCASE = File::FNM_SYSCASE.nonzero? ? "-i" : ""
      end

      unless method_defined?(:descendant_diretory?)
        def descendant_diretory?(descendant, ascendant)
          /\A(?#{SYSCASE}:#{Regexp.quote(ascendant)})#{DIRECTORY_TERM}/ =~ File.dirname(descendant)
        end
      end
    end

  end

end
