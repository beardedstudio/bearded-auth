require "bearded-auth/version"
require 'rubygems'
require 'rails'
require 'devise'
require 'oa-oauth'
require 'oa-openid'

module Bearded
  module Auth
    class Engine < Rails::Engine
    end
  end
end
