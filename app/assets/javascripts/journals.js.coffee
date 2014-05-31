jQuery ($) ->
  $('.pick_datetime_15').datetimepicker
    format: 'yyyy-mm-dd hh:ii',
    minuteStep: 15,
    autoclose: true,
    language: 'ja'

  get_events = (start, end, callback) ->
    events = []
    base_time = start.getTime() + 7 * 24 * 60 * 60 * 1000

    date = new Date(base_time)
    d = date.getDate()
    m = date.getMonth()
    y = date.getFullYear()

    $.get("/journals/#{y}/#{m+1}.json").done (response) ->
      for object in response
        do (object) ->
          [start_day, start_time]      = object.start_at.split('.')[0].split('T')
          [start_y, start_m, start_d]  = start_day.split('-')
          [start_h, start_mm, start_s] = start_time.split(':')
          [finish_day, finish_time]       = object.finish_at.split('.')[0].split('T')
          [finish_y, finish_m, finish_d]  = finish_day.split('-')
          [finish_h, finish_mm, finish_s] = finish_time.split(':')

          start_m_jq  = start_m - 1
          finish_m_jq = finish_m - 1
          event = {
            title: object.content + "(" + object.city + ")",
            start: new Date(start_y, start_m_jq, start_d, start_h, start_mm),
            end: new Date(finish_y, finish_m_jq, finish_d, finish_h, finish_mm),
            allDay: false,
            url: "/journals/#{object.id}"
          }
          events = events.concat(event)
      callback(events)

  $(document).ready ->
    $('#calendar').fullCalendar {
      monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
      dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
      dayNamesShort: ['日','月','火','水','木','金','土'],
      buttonText: {
        today: '今日',
        month: '月',
        week: '週',
        day: '日'
      },
      titleFormat: {
        month: 'yyyy年MMMM'
      },
      editable: true,
      events: get_events,
      eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
        $.post( "/journals.json", journal: {base_id: event.url.split('/')[2], day_delta: dayDelta})
          .done (res) ->
            start_m_jq  = res.start_m - 1
            finish_m_jq = res.finish_m - 1
            console.log res.id
            clone = {
              title: event.title
              start: new Date(res.start_y, start_m_jq, res.start_d, res.start_h, res.start_mm)
              end: new Date(res.finish_y, finish_m_jq, res.finish_d, res.finish_h, res.finish_mm)
              allDay: false,
              url: "/journals/#{res.id}"
              }
            $('#calendar').fullCalendar("renderEvent", clone)
            revertFunc()
      dayClick: (click_date, allDay, jsEvent, view) ->
        $(this).css('background-color', '#FEFAE1')
        c_d = click_date.getDate()
        c_m = click_date.getMonth()
        c_y = click_date.getFullYear()
        location.href = "/journals/new?date=#{c_y}-#{c_m + 1}-#{c_d}"
    }

  $('body').on "change", "#journal_customer_id", ->
    select = $('body').find('.invoice_id_selector')
    $.get("/invoices.json?ongoing=true&customer=#{@value}").done (response) ->
      select.empty()
      if response.length == 0
        console.log $('body').find('.invoice_id_area')
        $('body').find('.invoice_id_area').html("まだ請求書がないので新しく作成します。")
      else
        select.append($("<option>").val("").text("保留"))
        for object in response
          do (object) ->
            select.append($("<option>").val(object.id).text(object.ask_on))
