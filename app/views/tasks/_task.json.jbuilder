json.extract! task, :id, :title, :created_at, :updated_at
json.html render(partial: 'task.html.haml', locals: { task: task })
