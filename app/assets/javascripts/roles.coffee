# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $ ->
#   $('#aa').dataTable
#     processing: true
#     serverSide: true
#     ajax: $('#aa').data('source')
#     pagingType: 'full_numbers'

$ ->
  $('#roles').dataTable
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
              "targets": [1,2,3,4],
              "orderable": true
              },{
              "targets": [0,5],
              "orderable": false
              }],
    dom: '<"row"<"col-sm-12"C>><"row"<"col-sm-3"l><"container col-sm-9"<"row"<"col-sm-11"f><"col-sm-1"<"pull-right"T>>>>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
    "oTableTools": {
          "aButtons": [
                {
                    "sExtends": "print",
                    "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Üyeler",
                    "sButtonText": "Yazdır"
                }
            ]
    },
    "colVis": {
            "buttonText": "Sütunları Değiştir"
    }

  $('#club_users_index').dataTable
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
              "targets": [1,2,3,4],
              "orderable": true
              },{
              "targets": [0,5],
              "orderable": false
              }],
    dom: '<"row"<"col-sm-12"C>><"row"<"col-sm-3"l><"container col-sm-9"<"row"<"col-sm-11"f><"col-sm-1"<"pull-right"T>>>>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
    "oTableTools": {
          "aButtons": [
                {
                    "sExtends": "print",
                    "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Topluluk Üyeleri",
                    "sButtonText": "Yazdır"
                }
            ]
    },
    "colVis": {
            "buttonText": "Sütunları Değiştir"
    }


$ ->
	$('#users').select2
		theme: "bootstrap"
	
	$('#clubs').select2
		theme: "bootstrap"

	$('#role_types').select2
		theme: "bootstrap"

  $('.event').select2
    theme: "bootstrap"