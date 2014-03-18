require "required/version"

module Required
  module Rails
    class Engine < ::Rails::Engine
      initializer "required.assets.precompile" do |app|
        app.config.assets.precompile += %w(required.js)
      end
    end
  end
end
