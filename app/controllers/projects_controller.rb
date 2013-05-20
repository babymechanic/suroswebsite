class ProjectsController < ActionController::Base

  def index
    if request.xhr?
      render :json => get_projects_as_json(params[:page].to_i)
    else
      @current_page = 1
      @total_pages = number_of_pages(Refinery::Projects::Project)
      @projects_json = get_projects_as_json(1)
      render :layout => 'application'
    end
  end

  def show
    @project = Refinery::Projects::Project.where("id = #{params[:project_id]}").first
    render :layout => 'application'
  end

  private
      def get_projects_as_json(page_number)
        projects_for = projects_for page_number
        projects_in_json = []
        projects_for.each do |project|
          projects_in_json.push({
                                    thumbnailUrl: project.thumbnail.present? ? project.thumbnail.url : '',
                                    name: project.name.html_safe,
                                    description: project.description.html_safe,
                                    url: "/projects/#{project.id}"
                                })
        end
        projects_in_json.to_json
      end

      def projects_for(page_number)
        Refinery::Projects::Project.offset((page_number - 1) * Constants::ITEMS_PER_PAGE)
                                   .limit(Constants::ITEMS_PER_PAGE)
      end

      def number_of_pages(active_record_class)
        pages = (active_record_class.count.to_f / Constants::ITEMS_PER_PAGE)
        pages > 0 ? pages.ceil : 0
      end


end