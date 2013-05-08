class StaticPagesController  < ActionController::Base

  def home
    @about = Refinery::Page.where("slug = 'about'")[0]
                           .parts
                           .find{|x|x.title.downcase == 'body'}
                           .body
    render :layout => 'application'
  end

end