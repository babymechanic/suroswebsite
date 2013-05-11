module Refinery
  module Clients
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Clients

      engine_name :refinery_clients

      initializer "register refinerycms_clients plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "clients"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.clients_admin_clients_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/clients/client',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Clients)
      end
    end
  end
end
