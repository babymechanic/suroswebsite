Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :clients do
    resources :clients, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :clients, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :clients, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
