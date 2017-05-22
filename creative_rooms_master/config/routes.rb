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
	match '/search/:searchString' => 'application#angular', via: [:get]
	match '/room/:id' => 'application#angular', via: [:get]

	# routes to get property data

	match '/featured_properties' => 'properties#featured', via: [:get]
	match '/rooms/:id' => 'rooms#room_info', via: [:get]

	match '/search_results/:search_term' => 'properties#search_results', via: [:get]
	match '/geo_search_results/:north/:south/:east/:west' => 'properties#geo_search_results', via: [:get]
	get '/geo_search_results/:north/:south/:east/:west' => 'properties#geo_search_results', :constraints => {:north => /[^\/]+/, :south => /[^\/]+/, :east => /[^\/]+/, :west => /[^\/]+/ }
	match '/booking-request' => 'bookings#booking_request', via: [:get]

	

	
end
