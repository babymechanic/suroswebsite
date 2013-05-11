module Refinery
  module Artworks
    module Admin
      class ArtworksController < ::Refinery::AdminController

        crudify :'refinery/artworks/artwork',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
