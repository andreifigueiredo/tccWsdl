json.set! :data do
  json.array! @projects do |project|
    json.partial! 'projects/project', project: project
    json.url  "
              #{link_to 'Show', project }
              #{link_to 'Edit', edit_project_path(project)}
              #{link_to 'Destroy', project, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end