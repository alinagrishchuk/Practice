dataTableConfig =
  configWithGenerator: ->
    $("#products").dataTable
      processing: true
      serverSide: true
      ajax: $('#products').data('source')

  config: ->
    $('#products').dataTable()

  configWithAjax: ->
    $('#products').dataTable
      bProcessing: true
      bServerSide: true
      sAjaxSource: $('#products').data('source')

$(document).on 'ready page:load', ->
  console.log "products fire"
  $("#product_category_name").autocomplete { source: $("#product_category_name").data("autocomplete-source") }

  dataTableConfig.configWithAjax()




