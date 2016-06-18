fieldsManager =
  remove_fields: (link) ->
    $(link).prev("input[type=hidden]").val(1)
    $(link).closest(".fields").hide()

  add_fields: (link, association, content) ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id))

window.remove_fields = fieldsManager.remove_fields
window.add_fields = fieldsManager.add_fields