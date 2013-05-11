module Refinery
  module Artworks
    class Artwork < Refinery::Core::BaseModel
      self.table_name = 'refinery_artworks'

      attr_accessible :name, :thumbnail_id, :description, :position

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :thumbnail, :class_name => '::Refinery::Image'
    end
  end
end
