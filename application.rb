# encoding: utf-8
require 'rubygems'
require 'mechanize'
require 'mongo'
require 'oauth'
require 'twitter'
require 'yaml'

app_dif_path = File.expand_path(File.dirname(__FILE__))
%w(controllers models conf).each do |dir|
  Dir.glob(File.join(app_dif_path, dir, '*.rb')).each do |file|
    file = File.expand_path(file)
    require file
  end
end
