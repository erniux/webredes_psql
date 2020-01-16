//= require fullcalendar/lang/es

var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next',
        center: 'title',
        right: 'none'
      },
      columnFormat: {
        month: 'dddd',    // Monday, Wednesday, etc
        week: 'dddd, MMM dS', // Monday 9/7
        day: 'dddd, MMM dS'  // Monday 9/7
      },

      contentHeight: 550,
      fixedWeekCount: false,
      handleWindowResize: true,
      displayEventTime: false,
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',

      select: function(start, end) {
        $.getScript('/events/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, element, view) {
        $.getScript(event.edit_url, function() { });
      },

      eventdblClick: function(event, element, view) {
        $.getScript(event.show_url, function() { });
            //$("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
            //$("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
            //$("#eventInfo").html(event.detalle);
            //$("#eventLink").attr('href', event.show_url);
            //$("#image").html(event.foto);
            //$("#eventContent").dialog({ modal: true, title: event.title, width:350});
      }
      
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);

