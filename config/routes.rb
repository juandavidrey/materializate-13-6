Rails.application.routes.draw do
  
devise_for :users
#resources :tests
#resources :courses
resources :courses do
	resources :tests do
		resources :questions do
			resources :answer_ones

end 
	end
end


get '/courses/:id/inscribir', to: 'courses#inscribir'
get '/courses/:id/inscritos', to: 'courses#inscritos' , as: 'inscritos'



devise_scope :user do
  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
