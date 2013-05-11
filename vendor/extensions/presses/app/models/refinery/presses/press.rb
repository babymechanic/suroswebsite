module Refinery
  module Presses
    class Press < Refinery::Core::BaseModel
      self.table_name = 'refinery_presses'

      attr_accessible :name, :thumbnail_id, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :thumbnail, :class_name => '::Refinery::Image'
    end
  end
end
