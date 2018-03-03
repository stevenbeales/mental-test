require 'dry/config/version'

module Dry
  module Config
    require 'deep_merge/rails_compat' # need to require an explicit rails compatibility https://github.com/danielsdeleo/deep_merge#using-deep_merge-in-rails
    require 'dry/config/deep_symbolizable'
    require 'dry/config/base'
  end
end
