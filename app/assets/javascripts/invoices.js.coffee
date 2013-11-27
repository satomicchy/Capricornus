jQuery ($) ->
  $('.pick_date').datetimepicker
    format: 'yyyy-mm-dd',
    autoclose: true,
    minView: 3,
    language: 'ja'

  $('#open_journal_add_area').click ->
    $("#journal_add_area").show()
    $("#open_journal_add_area").hide()
    $("#close_journal_add_area").show()
    $("#journal_view_area").hide()
    $("#invoice_edit_title").show()

  $('#close_journal_add_area').click ->
    $("#journal_add_area").hide()
    $("#open_journal_add_area").show()
    $("#close_journal_add_area").hide()
    $("#journal_view_area").show()
    $("#invoice_edit_title").hide()
