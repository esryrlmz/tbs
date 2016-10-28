# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#clubs_for_club_contact').select2
    theme: "bootstrap"

  $('#club_contact_table').dataTable
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
    "fnDrawCallback": (oSettings) ->
      if oSettings.bSorted or oSettings.bFiltered
        i = 0
        iLen = oSettings.aiDisplay.length
        while i < iLen
          $('td:eq(0)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html i + 1
          i++
      return
    "pageLength": 10,
    "bProcessing": true,
    "order": [[ 1, 'asc' ]],
    "columnDefs": [{
              "targets": [1,2,3],
              "orderable": true
              },{
              "targets": [0,4],
              "orderable": false
              }],