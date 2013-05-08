class StaticPagesController  < ActionController::Base

  def home
    render :layout => 'application'
  end

end