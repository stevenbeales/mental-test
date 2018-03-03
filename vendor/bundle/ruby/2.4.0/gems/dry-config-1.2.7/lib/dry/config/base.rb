require 'dry/config/deep_symbolizable'
require 'yaml'

module Dry
  module Config
#
# Dry::Config::Base allows for default settings and mounting a specific environment with
# overriding hash values and merging of array values.
#
#   NOTE: Anything can be overridden and merged into top-level settings (hashes) including
#   anything that is an array value.  Array values are merged *not* replaced.  If you think
#   something is screwy, see the defaults in the #initialize as those add some default array values.
#   If this behavior of merging arrays or the defaults are somehow un-sensible, file an issue and we'll revisit it.
#
    class Base
      attr_reader :configuration
      attr_reader :environment
      attr_reader :filenames

      extend Forwardable
      def_delegators :@configuration, :each_key, :each_value, :each_pair, :each, :keys, :values


      def initialize(options = {})
        @options = {
            env: ENV,                  # default to ENV for interpolation
            interpolation: true,       # interpolate string contents on read with given ENV
            symbolize: true,           # provide symbol based key access for everything
            unsymbolize_to_yaml: true, # on to_yaml or write_yaml_file unsymbolize keys
            default_configuration: {}, # seed configuration
            prune: [:development, :test, :staging, :production] # used for pruning (optional)
        }.merge options

        @default_configuration = @options[:default_configuration]

        # (optional) used for pruning initial base set.  See #resolve_config
        @prune = @options[:prune]

        # setup a default configuration
        clear
      end

      # Load the configuration and save state.
      #
      # We call #load! and provide a name of the file to read as it's argument. We can also pass in some
      # options, but at the moment it's being used to allow per-environment
      # overrides in Rails
      def load!(environment, *filenames)

        # save these in case we #reload
        @environment = environment
        @filenames = filenames

        # load the configuration
        @configuration = load_unpruned(environment, *filenames)

        # Prune all known environments so that we end up with the top-level configuration.
        @prune.each do |env|
          @configuration.delete(env)
        end
      end

      # Load the configuration without saving state.  Useful for validation of complex configuration resolution without
      #   altering the existing state.
      def load_unpruned(environment, *filenames)

        # raise 'Unspecified environment' if environment.nil?
        raise 'Unspecified filename' if filenames.nil?

        # ensure symbol if symbolize?
        environment = environment.to_sym if symbolize? && !environment.nil?

        # get a clone of the current configuration
        config = {}.merge @configuration

        filenames.each do |filename|
          # merge all top level settings with the defaults set in the #init
          config.deeper_merge! resolve_config(environment, filename)
        end

        config
      end

      def resolve_config(environment, filename)
        config = load_yaml_file(filename)

        should_overlay_environment = environment && config[environment]

        # overlay the specific environment if provided
        if should_overlay_environment
          # re-read the file
          environment_settings = load_yaml_file(filename)

          # snag the requested environment
          environment_settings = environment_settings[environment.to_sym]

          # finally overlay what was provided the settings from the specific environment
          config.deeper_merge! environment_settings
        end

        config
      end

      def load_yaml_file(filename)

        # without interpolation
        # config = Psych.load_file(filename)

        # get file contents as string
        file = File.open(filename, 'r:bom|utf-8')
        contents = file.read

        env = @options[:env]
        if interpolate?
          # interpolate/substitute/expand ENV variables with the string contents before parsing
          # bash - $VAR
          contents = contents.gsub(/\$(\w+)/) { env[$1] }
          # bash - ${VAR}
          contents = contents.gsub(/\${(\w+)}/) { env[$1] }
          # bash - ~ is env['HOME']
          contents = contents.gsub(/(~)/) { env['HOME'] }
          # ruby - #{VAR}
          contents = contents.gsub(/\#{(\w+)}/) { env[$1] }
        end
        # now parse
        config = Psych.load(contents, filename)

        raise "Failed to load #{filename}" if config.nil?
        config = config.deep_symbolize if symbolize?
        config
      end

      def to_yaml(config = @configuration)
        if unsymbolize_to_yaml?
          config = config.dup.deep_symbolize(true)
        else
          config = @configuration
        end

        Psych.dump(config)
      end

      def write_yaml_file(filename, config = @configuration)
        File.open(filename, 'w') do |file|
          file.write(to_yaml(config))
        end
      end

      def reload!
        clear
        load! @environment, @filenames
      end

      def clear
        # clone a copy of the default
        @configuration = {}.merge @default_configuration
        @configuration.deep_symbolize if symbolize?
      end

      def method_missing(name, *args, &block)
        @configuration[name.to_sym] ||
            #fail(NoMethodError, "Unknown settings root \'#{name}\'", caller)
            nil
      end

      # configuration hash delegation with option based symbolization
      def [] key
        key = key.to_sym if symbolize?
        @configuration[key]
      end

      # configuration hash delegation with option based symbolization
      def []=(key, value)
        key = key.to_sym if symbolize?
        @configuration[key] = value
      end

      # configuration hash delegation with option based symbolization
      def include?(key)
        key = key.to_sym if symbolize?
        @configuration.include? key
      end

      def symbolize?
        @options[:symbolize]
      end

      def unsymbolize_to_yaml?
        @options[:unsymbolize_to_yaml]
      end

      def interpolate?
        @options[:interpolation]
      end
    end
  end
end