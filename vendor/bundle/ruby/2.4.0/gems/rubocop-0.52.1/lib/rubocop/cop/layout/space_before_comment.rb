# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # This cop checks for missing space between a token and a comment on the
      # same line.
      #
      # @example
      #   # bad
      #   1 + 1# this operation does ...
      #
      #   # good
      #   1 + 1 # this operation does ...
      class SpaceBeforeComment < Cop
        MSG = 'Put a space before an end-of-line comment.'.freeze

        def investigate(processed_source)
          processed_source.tokens.each_cons(2) do |t1, t2|
            next unless t2.comment?
            next unless t1.line == t2.line
            add_offense(t2.pos, location: t2.pos) if t1.pos.end == t2.pos.begin
          end
        end

        def autocorrect(range)
          ->(corrector) { corrector.insert_before(range, ' ') }
        end
      end
    end
  end
end
