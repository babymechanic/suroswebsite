module Refinery
  module Clients
    class Client < Refinery::Core::BaseModel
      self.table_name = 'refinery_clients'

      attr_accessible :name, :logo_id, :description, :position

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
