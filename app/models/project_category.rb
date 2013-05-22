class ProjectCategory

  attr_reader :id, :display_name

  def self.all_categories
    [
        ProjectCategory.new(1,'Furniture Design'),
        ProjectCategory.new(2,'Sketches'),
        ProjectCategory.new(3,'Photography'),
        ProjectCategory.new(4,'Spatial design'),
        ProjectCategory.new(5,'Others'),
        ProjectCategory.new(6,'Client Funded'),
        ProjectCategory.new(7,'Non Client Funded')
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