# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#event_locations').dataTable
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
    "order": [[ 0, 'asc' ]],
    "columnDefs": [{
              "targets": [0],
              "orderable": true
              },{
              "targets": [1],
              "orderable": false
              }],
    dom: '<"row"<"col-sm-12"C>><"row"<"col-sm-3"l><"container col-sm-9"<"row"<"col-sm-11"f><"col-sm-1"<"pull-right"T>>>>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
    "oTableTools": {
          "aButtons": [
                {
                    "sExtends": "print",
                    "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Etkinlik Yerleri",
                    "sButtonText": "Yazdır"
                }
            ]
    },
    "colVis": {
            "buttonText": "Sütunları Değiştir"
    }
