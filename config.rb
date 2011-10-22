google_analytics_account_number=26495302

### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Haml
###

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# require 'rack/codehighlighter'
# use Rack::Codehighlighter, 
#   :pygments_api,
#   :element => "pre>code",
#   :pattern => /\A:::([-_+\w]+)\s*\n/,
#   :markdown => true

# CoffeeScript filters in Haml
# First: gem install coffee-filter
require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

require 'redcloth'

###
# Page command
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout

# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end


#page "issues/interview/*.html", :layout => "layout-piece"
#page "/issues/*.html", :layout => "layout-issue"


# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

require 'urlify'
def urlify(name,replaceChar='-')
    URLify.urlify(name,replaceChar)
end 


def google_analytics(acct, options = {})
    url_prefix = options[:ssl] ? 'https://ssl' : 'http://www'
    "<script src=\"#{url_prefix}.google-analytics.com/urchin.js\" type=\"text/javascript\">\n" +
    "</script>\n" +
    "<script type=\"text/javascript\">\n" +
    "  _uacct = \"#{acct}\";\n" +
    "  urchinTracker();\n" +
    "</script>"
end


# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"


before do
 if request.path_info[-1]=='/'
     request.path_info+='index.html'
 else
    unless request.path_info =~ /\./ or request.path_info == '/'
        request.path_info += '.html'
    end
 end
end




require 'rack/google_analytics'
use Rack::GoogleAnalytics, :web_property_id => "UA-#{google_analytics_account_number}-1"


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  #activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
  
  #activate :directory_indexes
end