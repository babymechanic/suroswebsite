class ProjectsController < ActionController::Base

  def index
    if request.xhr?
      projects_for = projects_for params[:page].to_i
      projects_in_json = []
      projects_for.each do |project|
        puts "******************************#{project.description.html_safe}"
        projects_in_json.push({
                                thumbnailUrl: project.thumbnail.present? ? project.thumbnail.url : '',
                                name: project.name.html_safe,
                                description: project.description.html_safe
                              })
      end
      render :json => projects_in_json.to_json
    else
      @projects = projects_for 1
      @current_page = 1
      @total_pages = number_of_pages(Refinery::Projects::Project)
      render :layout => 'application'
    end
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