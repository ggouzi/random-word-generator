###########
# config.ru
#

require 'rubygems'
require 'bundler'

Bundler.require

require_relative "server"

ExifApi.run!