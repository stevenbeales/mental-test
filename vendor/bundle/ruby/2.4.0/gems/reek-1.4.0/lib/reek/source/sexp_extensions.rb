require 'reek/source/sexp_node'

module Reek
  module Source
    module SexpExtensions
      class MethodParameter
        attr_reader :name

        def initialize(name)
          @name = name
        end

        def ==(other)
          @name == other
        end

        def block?
          @name.to_s =~ /^&/
        end

        def anonymous_splat?
          @name == :*
        end

        def marked_unused?
          plain_name.start_with?('_')
        end

        def plain_name
          @plain_name ||= @name.to_s.sub(/^[*&]+/, '')
        end
      end

      module AndNode
        def condition() self[1] end

        def body
          self[2]
        end
      end

      # Utility methods for :or nodes
      module OrNode
        def condition() self[1] end

        def body
          self[2]
        end
      end

      module AttrasgnNode
        def args() self[3] end
      end

      # Utility methods for :case nodes
      module CaseNode
        def condition() self[1] end

        def body
          self[2..-1].extend SexpNode
        end
      end

      # Utility methods for :when nodes
      module WhenNode
        def condition_list
          self[1][1..-1]
        end
      end

      # Utility methods for :call nodes
      module CallNode
        def receiver() self[1] end
        def method_name() self[2] end
        def args() self[3..-1] end

        def participants
          ([receiver] + args).compact
        end

        def arg_names
          args.map { |arg| arg[1] }
        end
      end

      module CvarNode
        def name() self[1] end
      end

      CvasgnNode = CvarNode
      CvdeclNode = CvarNode

      module LvarNode
        def var_name() self[1] end
      end

      module MethodNode
        def arguments
          @arguments ||= parameters.reject(&:block?)
        end

        def arg_names
          @arg_names ||= arguments.map(&:name)
        end

        def parameters
          @parameters ||= argslist[1..-1].map do |param|
            MethodParameter.new(param.is_a?(Sexp) ? param[1] : param)
          end
        end

        def parameter_names
          @parameter_names ||= parameters.map(&:name)
        end

        def name_without_bang
          name.to_s.chop
        end

        def ends_with_bang?
          name[-1] == '!'
        end
      end

      module DefnNode
        def name() self[1] end
        def argslist() self[2] end

        def body
          self[3..-1].extend SexpNode
        end
        include MethodNode
        def full_name(outer)
          prefix = outer == '' ? '' : "#{outer}#"
          "#{prefix}#{name}"
        end
      end

      module DefsNode
        def receiver() self[1] end
        def name() self[2] end
        def argslist() self[3] end

        def body
          self[4..-1].extend SexpNode
        end
        include MethodNode
        def full_name(outer)
          prefix = outer == '' ? '' : "#{outer}#"
          "#{prefix}#{SexpNode.format(receiver)}.#{name}"
        end
      end

      # Utility methods for :if nodes
      module IfNode
        def condition() self[1] end

        def body
          self[2..-1].extend SexpNode
        end
      end

      module IterNode
        def call() self[1] end
        def args() self[2] end
        def block() self[3] end
        def parameters() self[2] || [] end

        def parameter_names
          parameters[1..-1].to_a
        end
      end

      # Utility methods for :nil nodes
      module NilNode
        def nil_node?
          true
        end
      end

      module LitNode
        def value() self[1] end
      end

      module Colon2Node
        def name
          self[2]
        end

        def simple_name
          if name.is_a? Colon2Node
            name.simple_name
          else
            name
          end
        end
      end

      module ModuleNode
        def name() self[1] end

        def simple_name
          name.is_a?(Sexp) ? name.simple_name : name
        end

        def full_name(outer)
          prefix = outer == '' ? '' : "#{outer}::"
          "#{prefix}#{text_name}"
        end

        def text_name
          SexpNode.format(name)
        end
      end

      module ClassNode
        include ModuleNode
        def superclass() self[2] end
      end

      module YieldNode
        def args() self[1..-1] end

        def arg_names
          args.map { |arg| arg[1] }
        end
      end
    end
  end
end
