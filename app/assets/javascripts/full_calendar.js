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

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() { });
      },

      eventMouseover: function(event, jsEvent, view) {
           alert(event.title);
           $("tooltip").append($("<h2>HOLA MUNDO</h2>"))
      }
 

      
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);

