json.extract! course, :id, :nombre, :cupo, :descripcion, :created_at, :updated_at
json.url course_url(course, format: :json)
