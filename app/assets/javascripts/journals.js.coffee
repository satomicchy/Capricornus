jQuery ($) ->
  $('.pick_datetime_15').datetimepicker
    format: 'yyyy-mm-dd hh:ii',
    minuteStep: 15,
    autoclose: true,
    language: 'ja'

  get_events = (start, end, callback) ->
    events = []
    date = new Date()
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

          event = {
            title: object.content + "(" + object.city + ")",
            start: new Date(start_y, start_m, start_d, start_h, start_mm),
            end: new Date(finish_y, finish_m, finish_d, finish_h, finish_mm),
            allDay: false,
            url: "/journals/#{object.id}"
          }
          events = events.concat(event)
          console.log events
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

      editable: true,
      events: get_events
    }
