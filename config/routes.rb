Rails.application.routes.draw do
  root 'welcome#index'

  match ':trap_id' => 'trap#trap', via: [:all]
  match ':trap_id/requests' => 'requests#requests', via: [:all]

end
