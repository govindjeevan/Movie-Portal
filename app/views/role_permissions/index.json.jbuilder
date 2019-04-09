json.set! :data do
  json.array! @role_permissions do |role_permission|
    json.partial! 'role_permissions/role_permission', role_permission: role_permission
    json.url  "
              #{link_to 'Show', role_permission }
              #{link_to 'Edit', edit_role_permission_path(role_permission)}
              #{link_to 'Destroy', role_permission, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end