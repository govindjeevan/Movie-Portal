json.set! :data do
  json.array! @permissions do |permission|
    json.partial! 'permissions/permission', permission: permission
    json.url  "
              #{link_to 'Show', permission }
              #{link_to 'Edit', edit_permission_path(permission)}
              #{link_to 'Destroy', permission, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end