require "bearded-auth/version"
require 'rubygems'
require 'rails'
require 'devise'
require 'oa-oauth'
require 'oa-openid'

module Bearded
  module Auth

    mattr_reader :devise_controllers
    @@devise_controllers = { :omniauth_callbacks => "omniauth_callbacks"}

    class Engine < Rails::Engine
    end
    
    def self.setup
      yield self
    end
    
    def self.override_devise_controllers(options)
      raise Exception.new("The argument to override_devise_controllers must be a hash in the same format as accepted by devise_for") unless options.is_a?(Hash) 
      @@devise_controllers = @@devise_controllers.merge(options)
    end
  end
end
