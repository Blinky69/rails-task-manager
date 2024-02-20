Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for the root path of the application
  # This route directs requests to the /tasks URL to the index action of the TasksController,
  # which typically displays a list of tasks.
  get "/tasks", to: "tasks#index"

  # Route for displaying a form to create a new task.
  # This route maps the /tasks/new URL to the new action of the TasksController,
  # which renders a form for creating a new task.
  get "/tasks/new", to: "tasks#new"

  # Route for handling the creation of a new task.
  # This route handles form submissions from the new task form.
  # It directs POST requests to /tasks to the create action of the TasksController,
  # which processes the form data and creates a new task.
  post "/tasks", to: "tasks#create"

  # Route for displaying details of a specific task.
  # This route uses a dynamic segment :id to match any numeric ID and directs requests to URLs like /tasks/1, /tasks/2,
  # etc., to the show action of the TasksController, which displays details of the task with the corresponding ID.
  get "/tasks/:id", to: "tasks#show", as: :task

  # Route for displaying a form to edit an existing task.
  # This route allows users to access a form for editing a specific task.
  # It maps URLs like /tasks/1/edit, /tasks/2/edit, etc., to the edit action of the TasksController.
  get "/tasks/:id/edit", to: "tasks#edit", as: :tasks_edit

  # Route for updating an existing task.
  # This route handles form submissions for updating existing tasks.
  # It directs PATCH requests to URLs like /tasks/1, /tasks/2, etc., to the update action of the TasksController,
  # which processes the form data and updates the corresponding task.
  patch "/tasks/:id", to: "tasks#update"

  # Route for deleting an existing task.
  # This route handles requests to delete existing tasks.
  # It directs DELETE requests to URLs like /tasks/1, /tasks/2, etc., to the destroy action of the TasksController,
  # which deletes the corresponding task.
  delete "/tasks/:id", to: "tasks#destroy"
end
