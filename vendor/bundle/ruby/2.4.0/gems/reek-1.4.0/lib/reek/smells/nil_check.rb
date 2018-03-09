require 'reek/smells/smell_detector'
require 'reek/smell_warning'

module Reek
  module Smells
    # Checking for nil is a special kind of type check, and therefore a case of
    # SimulatedPolymorphism.
    class NilCheck < SmellDetector
      SMELL_CLASS = 'SimulatedPolymorphism'
      SMELL_SUBCLASS = name.split(/::/)[-1]

      def examine_context(ctx)
        call_node_finder = NodeFinder.new(ctx, :call, NilCallNodeDetector)
        case_node_finder = NodeFinder.new(ctx, :when, NilWhenNodeDetector)
        smelly_nodes = call_node_finder.smelly_nodes + case_node_finder.smelly_nodes

        smelly_nodes.map do |node|
          SmellWarning.new(SMELL_CLASS, ctx.full_name, Array(node.line),
                           'performs a nil-check.',
                           @source, SMELL_SUBCLASS)
        end
      end

      #
      # A base class that allows to work on all nodes of a certain type.
      #
      class NodeFinder
        def initialize(ctx, type, detector = nil)
          @nodes = ctx.local_nodes(type)
          @detector = detector
        end

        def smelly_nodes
          @nodes.select do |when_node|
            @detector.detect(when_node)
          end
        end
      end

      # Detect 'call' nodes which perform a nil check.
      module NilCallNodeDetector
        module_function

        def detect(node)
          nil_query?(node) || nil_comparison?(node)
        end

        def nil_query?(call)
          call.method_name == :nil?
        end

        def nil_comparison?(call)
          is_comparison_call?(call) && involves_nil?(call)
        end

        def is_comparison_call?(call)
          comparison_methods.include? call.method_name
        end

        def involves_nil?(call)
          call.receiver.nil_node? || call.args.any?(&:nil_node?)
        end

        def comparison_methods
          [:==, :===]
        end
      end

      # Detect 'when' statements that perform a nil check.
      module NilWhenNodeDetector
        module_function

        def detect(node)
          node.condition_list.any?(&:nil_node?)
        end
      end
    end
  end
end
