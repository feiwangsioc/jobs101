Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  
  get 'welcome/index'
  get 'welcome/info'
  
   resources :jobs do
     resources :resumes
   end
  

  
  namespace :admin do
      resources :jobs do
        member do
          post :publish
          post :hide
        end
        
        resources :resumes
      end 
  end 
  
      resources :users do
        resource :profile, :controller => "user_profiles"
        resources :tickets, :controller => "user_tickets"
     end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
