require 'rubygems'
require 'bundler'
Bundler.require      #make all the gems load locally with bundler
require 'middleman'
require 'redcloth'      #write markup in textile
require 'coffee-filter' #write javascript in coffee
require "rack/contrib/try_static"
use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html']
run Middleman.server