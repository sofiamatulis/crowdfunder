json.extract! project, :id, :name, :date, :goal, :user_id, :category_id, :description, :created_at, :updated_at
json.url project_url(project, format: :json)