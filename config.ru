require 'bundler'
Bundler.setup
Bundler.require
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "_site",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}

# #require 'rubygems'
# #require 'bundler'
# #Bundler.require      #make all the gems load locally with bundler
# #require 'middleman'
# #require 'redcloth'      #write markup in textile
# #require 'coffee-filter' #write javascript in coffee
# #require "rack"
# require "rack/contrib/try_static"
# #run Middleman.server
# 
# use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html']
# 
# # use Rack::Static, 
# #   :urls => ["/stylesheets", "/images"],
# #   :root => "build"
# # 
# # run lambda { |env|
# #   [
# #     200, 
# #     {
# #       'Content-Type'  => 'text/html', 
# #       'Cache-Control' => 'build, max-age=86400' 
# #     },
# #     File.open('build/index.html', File::RDONLY)
# #   ]
# # }
