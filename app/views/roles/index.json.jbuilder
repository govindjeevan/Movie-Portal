json.set! :data do
  json.array! @roles do |role|
    json.partial! 'roles/role', role: role
    json.url  "
              #{link_to 'Show', role }
              #{link_to 'Edit', edit_role_path(role)}
              #{link_to 'Destroy', role, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end