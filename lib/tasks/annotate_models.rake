# frozen_string_literal: true

# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
require 'annotate'

desc 'set annotate model options'
task :set_annotation_options do
  # You can override any of these by setting an environment variable of the
  # same name.
  Annotate.set_defaults(
    'position_in_routes': 'before',
    'position_in_class': 'after',
    'position_in_test': 'before',
    'position_in_fixture': 'before',
    'position_in_factory': 'before',
    'show_indexes': 'true',
    'simple_indexes': 'false',
    'model_dir': 'app/models',
    'include_version': 'false',
    'require': '',
    'exclude_tests': 'true',
    'exclude_fixtures': 'true',
    'exclude_helpers': 'true',
    'exclude_factories': 'true',
    'exclude_serializers': 'true',
    'exclude_controllers': 'true',
    'ignore_model_sub_dir': 'false',
    'skip_on_db_migrate': 'true',
    'format_bare': 'true',
    'format_rdoc': 'false',
    'format_markdown': 'false',
    'sort': 'false',
    'force': 'false',
    'trace': 'false'
  )
end

annotate_lib = File.expand_path(File.dirname(File.dirname(__FILE__)))

unless ENV['is_cli']
  task :set_annotation_options
  task annotate_models: :set_annotation_options
end

desc 'Add schema information (as comments) to model and fixture files'
task :annotate_models do
  require 'annotate/annotate_models'
  require 'annotate/active_record_patch'

  options = { is_rake: true }
  ENV['position'] = options[:position] = Annotate.fallback(ENV['position'], 'before')
  options[:position_in_class] = Annotate.fallback(ENV['position_in_class'], ENV['position'])
  options[:position_in_fixture] = Annotate.fallback(ENV['position_in_fixture'], ENV['position'])
  options[:position_in_factory] = Annotate.fallback(ENV['position_in_factory'], ENV['position'])
  options[:position_in_test] = Annotate.fallback(ENV['position_in_test'], ENV['position'])
  options[:position_in_serializer] = Annotate.fallback(ENV['position_in_serializer'], ENV['position'])
  options[:show_foreign_keys] = Annotate.true?(ENV['show_foreign_keys'])
  options[:show_complete_foreign_keys] = Annotate.true?(ENV['show_complete_foreign_keys'])
  options[:show_indexes] = Annotate.true?(ENV['show_indexes'])
  options[:simple_indexes] = Annotate.true?(ENV['simple_indexes'])
  options[:model_dir] = ENV['model_dir'] ? ENV['model_dir'].split(',') : ['app/models']
  options[:root_dir] = ENV['root_dir']
  options[:include_version] = Annotate.true?(ENV['include_version'])
  options[:require] = ENV['require'] ? ENV['require'].split(',') : []
  options[:exclude_tests] = Annotate.true?(ENV['exclude_tests'])
  options[:exclude_factories] = Annotate.true?(ENV['exclude_factories'])
  options[:exclude_fixtures] = Annotate.true?(ENV['exclude_fixtures'])
  options[:exclude_serializers] = Annotate.true?(ENV['exclude_serializers'])
  options[:exclude_scaffolds] = Annotate.true?(ENV['exclude_scaffolds'])
  options[:exclude_controllers] = Annotate.true?(ENV.fetch('exclude_controllers', 'true'))
  options[:exclude_helpers] = Annotate.true?(ENV.fetch('exclude_helpers', 'true'))
  options[:exclude_sti_subclasses] = Annotate.true?(ENV['exclude_sti_subclasses'])
  options[:ignore_model_sub_dir] = Annotate.true?(ENV['ignore_model_sub_dir'])
  options[:format_bare] = Annotate.true?(ENV['format_bare'])
  options[:format_rdoc] = Annotate.true?(ENV['format_rdoc'])
  options[:format_markdown] = Annotate.true?(ENV['format_markdown'])
  options[:sort] = Annotate.true?(ENV['sort'])
  options[:force] = Annotate.true?(ENV['force'])
  options[:classified_sort] = Annotate.true?(ENV['classified_sort'])
  options[:trace] = Annotate.true?(ENV['trace'])
  options[:wrapper_open] = Annotate.fallback(ENV['wrapper_open'], ENV['wrapper'])
  options[:wrapper_close] = Annotate.fallback(ENV['wrapper_close'], ENV['wrapper'])
  options[:ignore_columns] = ENV.fetch('ignore_columns', nil)
  options[:ignore_routes] = ENV.fetch('ignore_routes', nil)
  options[:hide_limit_column_types] = Annotate.fallback(ENV['hide_limit_column_types'], '')
  options[:hide_default_column_types] = Annotate.fallback(ENV['hide_default_column_types'], '')

  AnnotateModels.do_annotations(options)
end

desc 'Remove schema information from model and fixture files'
task remove_annotation: :environment do
  require "#{annotate_lib}/annotate/annotate_models"
  require "#{annotate_lib}/annotate/active_record_patch"

  options = { is_rake: true }
  options[:model_dir] = ENV['model_dir']
  options[:root_dir] = ENV['root_dir']
  options[:require] = ENV['require'] ? ENV['require'].split(',') : []
  options[:trace] = Annotate.true?(ENV['trace'])
  AnnotateModels.remove_annotations(options)
end
