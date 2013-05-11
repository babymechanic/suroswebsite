module Refinery
  module Clients
    module Admin
      class ClientsController < ::Refinery::AdminController

        crudify :'refinery/clients/client',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
