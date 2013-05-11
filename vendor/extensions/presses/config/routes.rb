Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :presses do
    resources :presses, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :presses, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :presses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
