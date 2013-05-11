module Refinery
  module Presses
    module Admin
      class PressesController < ::Refinery::AdminController

        crudify :'refinery/presses/press',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
