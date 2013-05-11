module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel
      self.table_name = 'refinery_videos'

      attr_accessible :name, :thumbnail_id, :description, :yourtube_id, :position

      acts_as_indexed :fields => [:name, :description, :yourtube_id]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :thumbnail, :class_name => '::Refinery::Image'
    end
  end
end
