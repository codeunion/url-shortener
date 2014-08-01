# This file defines Rails' routing table. In any web application, the
# "routing table" maps incoming to requests to code to call.
#
# In Rails, the routing table is all in one place (here) and the code to call
# lives in the instance methods of various controllers, e.g., LinksController#show.
# In Sinatra, the routing table is spread across all the various calls to get(),
# post(), and so on and the code to call lives right next to its associated
# route.
#
# !!!IMPORTANT!!!
# Run "rake routes" to see Rails' current picture of the routing table.
# !!!IMPORTANT!!!

Rails.application.routes.draw do
  # Often you'll see this:
  #
  #   resources :links
  #
  # This is short-hand for the following routes:
  #
  #   get    '/links',          to: 'links#index', as: 'links'
  #   post   '/links',          to: 'links#create'
  #   get    '/links/new',      to: 'links#new',   as: 'new_link'
  #   get    '/links/:id/edit', to: 'links#edit',  as: 'edit_link'
  #   get    '/links/:id',      to: 'links#show',  as: 'link'
  #   patch  '/links/:id',      to: 'links#update'
  #   put    '/links/:id',      to: 'links#update'
  #   delete '/links/:id',      to: 'links#destroy'
  #
  # For our first application, we can only create and view links,
  # so these will be our routes.

  root to: 'links#index'
  get  '/links/new',     to: 'links#new',    as: 'new_link'
  post '/links',         to: 'links#create', as: 'links'
  get  '/l/:short_name', to: 'links#show',   as: 'link'

  # "get" tells Rails the HTTP method to look for (GET, in this case)
  # "/l/:short_name" tells Rails the URL pattern(s) to look for
  # "to: 'links#show'" tells Rails to call the show method on links_controller
  # "as: 'link'" tells Rails to create a link_url/link_path URL helper for this
  # route.
end
