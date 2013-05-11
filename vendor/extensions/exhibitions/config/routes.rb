Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :exhibitions do
    resources :exhibitions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :exhibitions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :exhibitions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
