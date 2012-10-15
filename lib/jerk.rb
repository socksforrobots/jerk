require "jerk/version"

require 'railtie' if defined?(Rails)

module Jerk
  module Base
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    end

    def each(&block); end
  end

  ### DEFAULT
  # Jerk::Redirect — issue a 301 redirect to the downcased version
  class Redirect
    include Base

    def call(env)
      path, query_string = env['PATH_INFO'].split('?')
      if path[/[A-Z]/]
        [301, { Location: [path.downcase, query_string].compact.join('?') }, self]
      else
        super
      end
    end
  end

  # Jerk::Ignore — Just downcase the URL for Rails without redirecting the user
  class Ignore
    include Base

    def call(env)
      env['PATH_INFO'].downcase!
      super
    end
  end
end


