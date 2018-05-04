json.extract! task, :id, :title, :description, :project_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
