Rails.application.routes.draw do
  root 'welcome#index'

  match ':trap_id' => 'trap#visit', via: [:all]
  match ':trap_id/requests' => 'statistic#visit', via: [:all]

  mount ActionCable.server => '/cable'

end
