module ApplicationHelper

  def page_on_named_route?(route_symbol)
    get_route_by_name(route_symbol.to_s).path.match("#{request.fullpath}".split('?').first)
  end

  def page_on_any_named_route(named_routes)
    named_routes.any?{|x| page_on_named_route? x}
  end

  def get_route_by_name(route_name)
    Rails.application.routes.routes.find{|x|x.name=="#{route_name}"}
  end

end
