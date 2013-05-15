# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

  content_for_technical_skill = '<ul>
                                    <li>Creating customised orthographic CAD.</li>
                                    <li>Rapid prototyping of modern/contemporary furniture.</li>
                                    <li>Operating digital video cameras like Sony DSR</li>
                                    <li>Offline editing in FCP & Avid.</li>
                                    <li>Handling image editing using Adobe Photoshop CS.</li>
                                  </ul>'

if Refinery::Page.where("slug = 'technical-skills' ").count == 0
  technical_skill_page = Refinery::Page.new(:title => 'Technical Skills',
                                            :slug => 'technical-skills')

  technical_skill_body = Refinery::PagePart.new(:title => 'Body',
                                                :body => content_for_technical_skill)

  technical_skill_page.parts.push technical_skill_body
  technical_skill_page.save
else
  technical_skill_page = Refinery::Page.where("slug = 'technical-skills'").first
  technical_skill_page.parts
                      .find{|x|x.title=='Body'}
                      .body = content_for_technical_skill
  technical_skill_page.save
end




# Added by Refinery CMS Clients extension
Refinery::Clients::Engine.load_seed

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed

# Added by Refinery CMS Artworks extension
Refinery::Artworks::Engine.load_seed

# Added by Refinery CMS Exhibitions extension
Refinery::Exhibitions::Engine.load_seed

# Added by Refinery CMS Videos extension
Refinery::Videos::Engine.load_seed

# Added by Refinery CMS Presses extension
Refinery::Presses::Engine.load_seed
