Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :artworks do
    resources :artworks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :artworks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :artworks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
