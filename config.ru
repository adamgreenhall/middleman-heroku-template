require 'rubygems'
require 'bundler'
Bundler.require      #make all the gems load locally with bundler
#require 'middleman'
#require 'redcloth'      #write markup in textile
#require 'coffee-filter' #write javascript in coffee
#require "rack/contrib/try_static"
#use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html']
#run Middleman.server

use Rack::Static, 
  :urls => ["/stylesheets", "/images"],
  :root => "build"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'build, max-age=86400' 
    },
    File.open('build/index.html', File::RDONLY)
  ]
}
