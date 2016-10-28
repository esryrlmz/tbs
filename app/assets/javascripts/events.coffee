# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# pad = (n) ->
#   if n < 10 then '0' + n else n

dateFormat = (d) ->
  pad = (n) ->
    if n < 10 then '0' + n else n
  pad(d.getDate()) + '.' + pad(d.getMonth() + 1) + '.' + d.getFullYear() + ' - ' + pad(d.getHours()) + ':' + pad(d.getMinutes())

printDiv = (divName) ->
  printContents = document.getElementById(divName).innerHTML
  originalContents = document.body.innerHTML
  document.body.innerHTML = printContents
  window.print()
  document.body.innerHTML = originalContents

$ ->

  $('.form-response-button').click ->
    if $(this).hasClass('admin-confirm')
      $('#event-status-id-modal').val(2)
    else if $(this).hasClass('admin-reject')
      $('#event-status-id-modal').val(3)
    else if $(this).hasClass('advisor-confirm')
      $('#event-status-id-modal').val(5)
    else if $(this).hasClass('advisor-reject')
      $('#event-status-id-modal').val(6)
    else if $(this).hasClass('president-resend')
      $('#event-status-id-modal').val(4)
    $('#event-response-form').submit()

  $('#event_locations_list').append("<option value='Diğer'>Diğer</option>")
  $('#event_locations_list').on 'select2:select', (e) ->
    selectedValue = $(this).val()
    if selectedValue != "Diğer"
      $('#event_location').prop('readonly', true);
      $('#event_location').val(selectedValue)
    else
      $('#event_location').prop('readonly', false);
      $('#event_location').val('')

  $('.show-event-responses').click ->
    tr = $(this).closest('tr')
    eventId = tr.data('id')
    eventTitle = tr.data('title')
    showFooter = tr.data('show-footer')

    $('#event-modal-title').text(eventTitle)
    $('#event-responses-table-body').empty()
    if(!showFooter)
      $('#event-responses-table-footer').empty()

    url = "/events/#{eventId}/event_responses"
    if eventId != ""
      $.ajax
        url: url
        type: 'GET'
        dataType: 'json'
        success: (response) ->
          $.each response, (key, eventReponse) ->
            explanation
            if eventReponse.explanation == null
              explanation = ""
            else
              explanation = eventReponse.explanation

            date = new Date(eventReponse.created_at);
            $('#event-responses-table-body').append "<tr><td>#{eventReponse.event_status.status}</td><td>#{explanation}</td><td>#{dateFormat(date)}</td></tr>"
            $('.event-id-modal').val(eventId)
            # $('#event-status-id-admin-accept-modal').val(2)
            # $('#event-status-id-admin-reject-modal').val(3)
            $('#event-status-id-advisor-accept-modal').val(5)
            $('#event-status-id-advisor-reject-modal').val(6)
            $('#event-status-id-president-reject-modal').val(4)
        error: (xhr, ajaxOptions, thrownError) ->
          console.log(error)

  $('#print-event').click ->
    console.log(123)
    printDiv("print-place")

  $('.events').dataTable
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
                    "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Etkinlikler",
                    "sButtonText": "Yazdır"
                }
            ]
    },
    "colVis": {
            "buttonText": "Sütunları Değiştir"
    }

  $('.other_events').dataTable
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
              "targets": [1,2,3,4,5],
              "orderable": true
              },{
              "targets": [0],
              "orderable": false
              }],
    dom: '<"row"<"col-sm-12"C>><"row"<"col-sm-3"l><"container col-sm-9"<"row"<"col-sm-11"f><"col-sm-1"<"pull-right"T>>>>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
    "oTableTools": {
          "aButtons": [
                {
                    "sExtends": "print",
                    "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Etkinlikler",
                    "sButtonText": "Yazdır"
                }
            ]
    },
    "colVis": {
            "buttonText": "Sütunları Değiştir"
    }

    $('#all_events').dataTable
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
                      "sMessage": "&nbsp;&nbsp;&nbsp;&nbsp;Etkinlikler",
                      "sButtonText": "Yazdır"
                  }
              ]
      },
      "colVis": {
              "buttonText": "Sütunları Değiştir"
      }
