json.extract! employee, :id, :no, :name, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
