require 'reek/cli/command'
require 'reek/examiner'

module Reek
  module Cli
    #
    # A command to collect smells from a set of sources and write them out in
    # text report format.
    #
    class ReekCommand < Command
      def execute(app)
        @parser.sources.each do |source|
          reporter.add_examiner(Examiner.new(source, config_files, smell_names))
        end
        reporter.smells? ? app.report_smells : app.report_success
        reporter.show
      end

      private

      def reporter
        @reporter ||= @parser.reporter
      end

      def smell_names
        @smell_names ||= @parser.smells_to_detect
      end

      def config_files
        @config_files ||= @parser.config_files
      end
    end
  end
end
