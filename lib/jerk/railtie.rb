module Jerk
  class Railtie < Rails::Railtie
    initializer "jerk.insert_middleware" do |app|
      app.middleware.use "Jerk::Redirect"
    end
  end
end
