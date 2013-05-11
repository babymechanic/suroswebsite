module Refinery
  module Artworks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Artworks

      engine_name :refinery_artworks

      initializer "register refinerycms_artworks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "artworks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.artworks_admin_artworks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/artworks/artwork',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Artworks)
      end
    end
  end
end
