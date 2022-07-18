Rails.application.routes.draw do
  mount_devise_token_auth_for '[USER_CLASS]', at: '[MOUNT_PATH]'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
end
