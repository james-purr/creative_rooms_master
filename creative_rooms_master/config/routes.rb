Rails.application.routes.draw do
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'application#angular'
	authenticated do
		root to: "application#angular", as: :authenticated_root
	end

	match '/' => 'application#angular', via: [:get]
	match '/login' => 'application#angular', via: [:get]
	match '/register' => 'application#angular', via: [:get]

	# routes to get property data

	match '/featured_properties' => 'properties#featured', via: [:get]
	match '/search_results/:search_term' => 'properties#search_results', via: [:get]


	
end
