Rails.application.routes.draw do
  resource :trap_id
  root 'welcome#index'

  match ':trap_id' => 'trap#visit', via: [:all]
  match ':trap_id/requests' => 'statistic#index', via: [:all]
  match ':trap_id/requests2' => 'requests#statistic', via: [:all]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end
