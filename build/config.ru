#\ -p 4000

require 'rubygems'
require 'bundler'

# bootstrap 4
#require 'bootstrap'

# prettify markup
# require 'nokogiri'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'serve'
require 'serve/rack'

# The project root directory
root = ::File.dirname(__FILE__)

# add extra MIME_TYPES
Rack::Mime::MIME_TYPES.merge!({
  ".ogg"     => "application/ogg",
  ".ogx"     => "application/ogg",
  ".ogv"     => "video/ogg",
  ".oga"     => "audio/ogg",
  ".mp4"     => "video/mp4",
  ".m4v"     => "video/mp4",
  ".mp3"     => "audio/mpeg",
  ".m4a"     => "audio/mpeg",
  ".htc"     => "text/x-component",
  ".json"    => "application/json"
})

# Compile Sass on the fly with the Sass plugin. Some production environments
# don't allow you to write to the file system on the fly (like Heroku).
# Remove this conditional if you want to compile Sass in production.
if ENV['RACK_ENV'] != 'production'
  require 'sass'
  require 'sass/plugin/rack'
  require 'compass'

  Compass.add_project_configuration(root + '/compass.config')
  Compass.configure_sass_plugin!

  module Compass::SassExtensions::Functions::Sprites
    def sprite_url(map)
      verify_map(map, "sprite-url")
      map.generate
      generated_image_url(Sass::Script::String.new(map.name_and_hash))
    end
  end

  module Compass::SassExtensions::Sprites::SpriteMethods
    def name_and_hash
      "#{path}.png"
    end

    def cleanup_old_sprites
      Dir[File.join(::Compass.configuration.generated_images_path, "#{path}.png")].each do |file|
        log :remove, file
        FileUtils.rm file
        ::Compass.configuration.run_sprite_removed(file)
      end
    end
  end

  module Compass
    class << SpriteImporter
      def find_all_sprite_map_files(path)
        glob = "*{#{self::VALID_EXTENSIONS.join(",")}}"
        Dir.glob(File.join(path, "**", glob))
      end
    end
  end

  use Sass::Plugin::Rack  # Sass Middleware
end

# Other Rack Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors
use Rack::ContentLength   # Make sure ContentLength header is added
use Rack::Lint            # Validation
use Rack::Deflater        # Compress response

# inject response header
class AddHeader
  def initialize app, pat
    @app = app
    @pat = pat
  end

  def call env
    res = @app.call(env)
    path = env["REQUEST_PATH"]
    @pat.each do |pattern,data|
      if path =~ pattern
        res[1]["Transfer-Encoding"] = data[:transfer_encoding] if data.has_key?(:transfer_encoding)
        res[1]["Cache-Controle"] = data[:cache_controle] if data.has_key?(:cache_controle)
        res[1]["X-Injected-pattern"] = pattern.to_s
        res[1]["X-Injected-data"] = data.to_s
        return res
      end
    end
    res
  end
end
# transfer_encoding !== junked fix bug in safari and browserSync
use AddHeader, {
  /^(?!\/static\/)/ =>
  {
    :transfer_encoding => "gzip",
    :cache_controle => "private, max-age=0",
  },
  /\/static\// =>
  {
     :transfer_encoding => "gzip",
     :cache_controle => "private, max-age=0"
  }
}

# Rack Application
if ENV['SERVER_SOFTWARE'] =~ /passenger/i
  # Passenger only needs the adapter
  run Serve::RackAdapter.new(root + '/views')
else
  # Use Rack::TryStatic to attempt to load files from public first
  require 'rack/contrib/try_static'
  use Rack::TryStatic, :root => (root + '/public'), :urls => %w(/), :try => %w(.html index.html /index.html)
  use Rack::TryStatic, :root => (root + '/bower_components'), :urls => %w(/), :try => %w(.js)
  # use Rack::TryStatic, :root => (root + '/html'), :urls => %w(/html/), :try => %w(.html index.html /index.html)
  # Use Rack::Cascade and Rack::Directory on other platforms for static assets
  run Rack::Cascade.new([
    Serve::RackAdapter.new(root + '/views'),
    Rack::Directory.new(root + '/public'),
    Rack::Directory.new(root + '/bower_components')
    # Rack::Directory.new(root + '/html')
  ])
end
