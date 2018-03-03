# dry-config
[![Gem Version](https://badge.fury.io/rb/dry-config.svg)](https://rubygems.org/gems/dry-config)
[![Build Status](https://travis-ci.org/alienfast/dry-config.svg)](https://travis-ci.org/alienfast/dry-config)
[![Code Climate](https://codeclimate.com/github/alienfast/dry-config/badges/gpa.svg)](https://codeclimate.com/github/alienfast/dry-config)


Simple base class for DRY inheritable configurations that can be loaded from multiple overriding yml files.
  
Sample uses include environment based e.g. `development, test, production` and multi-domain white label configurations.  

A programmatic seed configuration may be specified, as well as the ability to load one to many overriding configuration files.

Results may be re-written to an output file, useful for compiling static files for other processes such as `docker-compose.yml`.
 
The [elastic-beanstalk gem](https://github.com/alienfast/elastic-beanstalk) is a real world example that utilized `Dry::Config::Base`.

## Installation

Add this line to your application's Gemfile:

    gem 'dry-config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dry-config

## Example 1: environment inheritance
The following example shows a single file where environments will override base level settings.  `dry-config` is useful for simple, to multi-file, multi-environmet settings.

### Step 1.  Write a config class
Note this sample uses the `Singleton` pattern, which is useful but not required.

```ruby    
require 'singleton'
require 'dry/config'

class AcmeConfig < Dry::Config::Base
    
    # (optional) make this the only instance 
    include Singleton
    
    def initialize(options = {})
      options = {
          # seed the sensible defaults here (overridable)
          default_configuration: {
              environment: nil,
              strategy: :blue_green,
              package: {
                  verbose: false
              },
              options: {}
          }}.merge(options)

      super(options)
    end
end
```
    
### Step 2.  Write a yml config file
    
```yaml
# sample config demonstrating multi-environment override
---
app: acme
title: Acme Holdings, LLC
#---
options:
  aws:elasticbeanstalk:application:environment:
    RAILS_ENV: foobar

  aws:autoscaling:launchconfiguration:
    InstanceType: foo

#---
development:
  strategy: inplace-update
  package:
    verbose: true
  options:
    aws:autoscaling:launchconfiguration:
      InstanceType: t1.micro
    aws:elasticbeanstalk:application:environment:
      RAILS_ENV: development

#---
production:
  options:
    aws:autoscaling:launchconfiguration:
      InstanceType: t1.large
    aws:elasticbeanstalk:application:environment:
      RAILS_ENV: production    
```

### Step 3. Load your config
 Note that multiple files can be loaded and overriden.  A nil environment is also possible.
 
```ruby
AcmeConfig.instance.load!(:production, 'path_to/acme.yml')
```

### Step 4. Use the values
 Note that all keys are symbolized upon loading.

```ruby
config = Acme.config.instance
config.load!(:production, 'path_to/acme.yml')

config.app          # acme
config.title        # Acme Holdings, LLC    
config.strategy     # :blue_green,
config.options[:'aws:autoscaling:launchconfiguration'][:InstanceType] # t1.large
```   
## Example 2: Multi-file White Label sample

```ruby
    class WhiteLabelConfig < Dry::Config::Base
    end

    config = WhiteLabelConfig.new
    config.load!(nil, 'base.yml', 'acme.com.yml', 'scheduling.acme.com.yml')
```       
## ENV Interpolation/substitution/expansion

ENV variable substitution is supported and enabled by default.  It may be disabled by initializing with `{interpolation: false}`. 

The following formats are acceptable:

```yaml
interpolations:
  - ~/foo
  - $HOME/foo
  - ${HOME}/foo
  - #{HOME}/foo
  # mixed example
  - ~/docker/mysql/${PROJECT_NAME}-${BUILD}:/var/lib/mysql:rw
```
      
## Options

The default configuration is provided below, override any of these values on construction:
```ruby
{
    env: ENV,                  # default to ENV for interpolation
    interpolation: true,       # interpolate contents on read with env (above defaults to the current process's ENV)
    symbolize: true,           # provide symbol based key access for everything i.e. access :development instead of 'development' as a rule
    unsymbolize_to_yaml: true, # on to_yaml or write_yaml_file unsymbolize keys (several external tools do not do well with symbolized keys i.e. write `development:` instead of `:development:`
    default_configuration: {}, # seed configuration (file contents overlay this)
    prune: 
        [:development, :test, :staging, :production] # used for pruning final configuration (optional - nice to have cleanup)
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
