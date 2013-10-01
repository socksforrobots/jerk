require "jerk/version"

require 'jerk/railtie' if defined?(Rails)

module Jerk
  module Base
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    end

    def each(&block); end

    def url_without_query_string(env)
      req = Rack::Request.new(env)
      req.base_url + req.script_name + req.path_info
    end

    def downcased_url(env)
      if env['QUERY_STRING'].empty?
        url_without_query_string(env).downcase
      else
        url_without_query_string(env).downcase + "?#{env['QUERY_STRING']}"
      end
    end
  end

  ### DEFAULT
  # Jerk::Redirect — issue a 301 redirect to the downcased version
  class Redirect
    include Base

    def call(env)
      if url_without_query_string(env)[/[A-Z]/]
        [301, { 'Location' => downcased_url(env), 'Content-Type' => 'text/plain' }, self]
      else
        super
      end
    end
  end

  # Jerk::Ignore — Just downcase the URL for Rails without redirecting the user
  class Ignore
    include Base

    def call(env)
      env['HOST'].to_s.downcase!
      env['SCRIPT_NAME'].to_s.downcase!
      env['PATH_INFO'].to_s.downcase!
      super
    end
  end
end


