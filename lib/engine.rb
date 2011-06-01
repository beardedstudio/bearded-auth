require 'bearded-auth'
require 'rails'
require 'devise'
require 'oa-oauth'
require 'oa-openid'

module Bearded
  module Auth
    class Engine < Rails::Engine
      config.generators do |g|
        g.template_engine :haml
      end
    end
  end
end