class StaticPagesController  < ActionController::Base

  def home
    @about = get_body_for_slug 'about'
    @technical_skills = get_body_for_slug 'technical-skills'
    render :layout => 'application'
  end

  def contact_details
    @contact_details = get_body_for_slug 'contact-details'
    render :layout => 'application'
  end

  private

  def get_body_for_slug(slug_name)
    Refinery::Page.where("slug in ('#{slug_name}','#{slug_name}-page' )")[0]
                  .parts
                  .find{|x|x.title.downcase == 'body'}
                  .body
                  .html_safe
  end

end