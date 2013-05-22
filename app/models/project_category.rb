class ProjectCategory

  attr_reader :id, :display_name

  def self.all_categories
    [
        ProjectCategory.new(1000,'Furniture Design'),
        ProjectCategory.new(1001,'Sketches'),
        ProjectCategory.new(1002,'Photography'),
        ProjectCategory.new(1003,'Spatial design'),
        ProjectCategory.new(1004,'Others'),
        ProjectCategory.new(1005,'Client Commissioned'),
        ProjectCategory.new(1006,'Non Commissioned')
    ]
  end

  def self.all_categories_as_json
    all_categories.map{|x|
      {id:x.id,displayName:x.display_name}
    }.to_json
  end

  private

  def initialize(id,display_name)
    @id = id
    @display_name = display_name
  end

end