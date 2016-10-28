# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#clubs_for_director').select2
    theme: "bootstrap"

  $('.club_directors').select2
    theme: "bootstrap"

  $('#clubs_for_director').on 'select2:select', (e) ->
    clubPeriodId = $(this).val()
    url = "/club_periods/#{clubPeriodId}/member_list"
    console.log url
    if clubPeriodId != ""
      $.ajax
        url: url
        type: 'GET'
        dataType: 'json'
        success: (response) ->
          $('.club_directors').empty()
          html = ''
          $.each response, (key, value) ->
            html += "<option value='#{value.id}'>#{value.first_name} #{value.last_name}</option>"
            return
          $('.club_directors').append html
          return
        error: (xhr, ajaxOptions, thrownError) ->
          console.log(error)
          return

  $('#club_board_of_directors_table').dataTable
    language: {
          "sProcessing": "Yükleniyor...",
          "sLengthMenu": "Sayfada _MENU_ Kayıt Göster",
          "sZeroRecords": "Eşleşen Kayıt Bulunmadı",
          "sInfo": "  _TOTAL_ Kayıttan _START_ - _END_ Arası kayıtlar",
          "sInfoEmpty": "Kayıt Yok",
          "sInfoFiltered": "( _MAX_ Kayıt içerisinden Bulunan)",
          "sInfoPostFix": "",
          "sSearch": "Bul:",
          "sUrl": "",
          "oPaginate": {
          "sFirst": "İlk",
          "sPrevious": "Önceki",
          "sNext": "Sonraki",
          "sLast": "Son" }},
    "bPaginate": true,
    "pageLength": 10,
    "bProcessing": true,
    "order": [[ 2, 'asc' ]],
    "columnDefs": [{
              "targets": [0,1,2],
              "orderable": true
              },{
              "targets": [3],
              "orderable": false
              }],


