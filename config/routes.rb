Rails.application.routes.draw do
  root 'welcome#index'

  match ':trap_id/requests' => 'statistic#visit', via: [:all]
  match ':trap_id(/*other)' => 'trap#visit', via: [:all]
  # TODO: ask about case: ':trap_id/requests/*other'

  mount ActionCable.server => '/cable'
end
