module Reek
  module Source
    #
    # Extensions to +Sexp+ to allow +CodeParser+ to navigate the abstract
    # syntax tree more easily.
    #
    module SexpNode
      def self.format(expr)
        case expr
        when Sexp then expr.format_ruby
        else expr.to_s
        end
      end

      def hash
        inspect.hash
      end

      def each_node(type, ignoring = [], &blk)
        if block_given?
          look_for(type, ignoring, &blk)
        else
          result = []
          look_for(type, ignoring) { |exp| result << exp }
          result
        end
      end

      def unnested_nodes(types)
        result = []
        if types.include? first
          result << self
        else
          each_sexp do |elem|
            result += elem.unnested_nodes(types)
          end
        end
        result
      end

      def each_sexp
        each { |elem| yield elem if elem.is_a? Sexp }
      end

      #
      # Carries out a depth-first traversal of this syntax tree, yielding
      # every Sexp of type +target_type+. The traversal ignores any node
      # whose type is listed in the Array +ignoring+.
      #
      def look_for(target_type, ignoring = [], &blk)
        each_sexp do |elem|
          elem.look_for(target_type, ignoring, &blk) unless ignoring.include?(elem.first)
        end
        blk.call(self) if first == target_type
      end

      def contains_nested_node?(target_type)
        look_for(target_type) { |_elem| return true }
        false
      end

      def format_ruby
        Ruby2Ruby.new.process(deep_copy)
      end

      def deep_copy
        Sexp.new(*map { |elem| elem.is_a?(Sexp) ? elem.deep_copy : elem })
      end
    end
  end
end
