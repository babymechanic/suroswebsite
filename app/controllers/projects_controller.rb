class ProjectsController < ActionController::Base

  def index
    @projects = projects_for 1
    @current_page = 1
    @total_pages = number_of_pages(Refinery::Projects::Project)
    render :layout => 'application'
  end

  private

      def projects_for(page_number)
        Refinery::Projects::Project.offset((page_number - 1) * Constants::ITEMS_PER_PAGE)
                                   .limit(Constants::ITEMS_PER_PAGE)
                                   #.where("falls_under_#{pillar_name}_pillar")
      end

      def number_of_pages(active_record_class)
        pages = (active_record_class.count / Constants::ITEMS_PER_PAGE)
        pages > 0 ? pages.ceil : 0
      end


end