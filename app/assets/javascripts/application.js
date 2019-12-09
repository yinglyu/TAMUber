// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree . 
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require gmaps/google
//= require jquery
//= require js-routes
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar-columns
//= require daterangepicker

// For pop up confirmation:
// require jquery3 => is conflict with jquery, will diable calendar
//= require bootstrap
//= require data-confirm-modal


function clearCalendar() {
    $('#calendar').fullCalendar('delete');
    $('#calendar').html('');
};
$(document).on('turbolinks:before-cache', clearCalendar);

var initialize_calendar;
initialize_calendar = function () {
    $('#calendar').each(function () {
        var calendar = $(this);
        calendar.fullCalendar({
            header: {
                left: 'prev,next today multiColAgendaDay',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            selectable: true,
            selectHelper: true,
            selectConstraint:{
                start: '00:01',
                end: '23:59',
            },
            editable: true,
            eventLimit: true,
            allDaySlot: false,
            displayEventTime:false,
            //eventColor: '#378006',
            eventColor: '#a0e3e8',
            // Below is the multiCol for Drivers display,
            // The implementation works by tricking FullCalendar into displaying columns as separate days.
            // For example: A Friday with two columns is rendered behind the scenes by asking FullCalendar to draw two days,
            // Friday and the coming Monday, where Monday corresponds to Friday's second column.
            // Care is taken to make this trick transparent to the user (you) but in some cases this is not 100% possible.
            // For example, some View Object properties such as end do not contain the "correct" value.
            defaultView: 'month',
            events: '/events.json',
            views: {
                multiColAgendaDay:
                {
                    type: 'multiColAgenda',
                    duration: { days: 1 },
                    numColumns: gon.driver_num,
                    columnHeaders: gon.drivers_name,
                    buttonText: 'drivers',
                    selectable: false,
                    editable: false
                    // ,
                }
            },
            dayClick: function (date, jsEvent, view) {
                $('#calendar').fullCalendar('changeView', 'agendaDay');
                $('#calendar').fullCalendar('gotoDate', date);
            },
            
            select: function (start, end, jsEvent, view) {
                if (view.name === 'multiColAgendaDay'){
                    calendar.fullCalendar('unselect');
                    alert("You can create event in week and day view.");
                    return;
                }
                $.getScript('/events/new', function () {
                    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
                });

                calendar.fullCalendar('unselect');
            },

            eventDrop: changeEvent,
            eventResize: changeEvent,
            eventClick: function (event, jsEvent, view) {
                $.getScript(event.edit_url, function () {
                    $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
                });
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);

function changeEvent ( event, delta, revertFunc, jsEvent, ui, view) {
    if (moment(event.start).format('l') !== moment(event.end).format('l')){
        revertFunc();
        alert("Invalid change. Start and end should on the same day.");
        return;
    }
    if(!confirm("Are you sure about this change?")) {
        revertFunc();
        return;
    }
    event_data = {
        single_event: {
            driver_id: event.driver_id,
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
        }
    };
    $.ajax({
        url: event.update_url,
        data: event_data,
        type: 'PATCH',
        success: AjaxSucceeded,
        error: AjaxFailed
    });
    function AjaxSucceeded(result) {
        alert("Update success for " +  event.title  +  "\n" + moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("HH:mm") );
    }
    function AjaxFailed(result) {
        alert("Update fail.");
        revertFunc();
    }
}

$(function () {
    require([
        "esri/Map",
        "esri/views/MapView",
        "esri/layers/TileLayer",
        "esri/Graphic",
        "esri/symbols/PictureMarkerSymbol",
        "esri/layers/GraphicsLayer",
        "dojo/domReady!"
    ], function (Map, MapView, TileLayer, Graphic, PictureMarkerSymbol) {
        var map = new Map();
        var point = {
            type: "point",
            longitude: -96.35539,
            latitude: 30.61348
        };

        // Create symbol for cars
        var carSymbol = {
            type: "picture-marker",
            url: "https://i.imgur.com/6ZZyFuO.png",
            width: "180px",
            height: "130px"
        };

        // Create the underlying map view
        var view = new MapView({
            container: "amap",
            scale: 8000,
            center: [-96.34696, 30.61364],
            map: map
        });

        // Aggie Map layer
        var layer = null,
            layerUrl = "https://gis.tamu.edu/arcgis/rest/services/FCOR/BaseMap_20191008/MapServer",
            layer = new TileLayer(layerUrl, null);
        map.layers.add(layer);
        
        //fake car, need to read from database
        var popInfo = {
            Driver: "Dongwei Qi ",
            Vehicle: "Bicycle",
            Status: "Available",
            Hungry: "yes"
        };


        var pointGraphic = new Graphic({
            geometry: point,
            symbol: carSymbol,
            attributes: popInfo,
            // Create pop-up template, this template shows when a car icon is clicked
            popupTemplate: {
                title: "{Info}",
                content: [
                    {
                        type: "fields",
                        fieldInfos: [
                            {
                                fieldName: "Driver"
                            },
                            {
                                fieldName: "Vehicle"
                            },
                            {
                                fieldName: "Status"
                            }
                        ]
                    }
                ]
            }
        });

        setInterval(function () {
            // We change the latitude a little bit a time to create animation of car
            // By Quickly remove and add the icon, we make the car moves
           // point.latitude += 0.00001;
            //view.graphics.remove(pointGraphic);
            pointGraphic.geometry = point;
            view.graphics.add(pointGraphic);
            //graphicsLayer.add(pointGraphic);
        }, 75);
    });
    
})
$('a[data-popup]').live('click', function(e) { 
  window.open( $(this).attr('href'), "Popup", "height=600, width=600" ); 
  e.preventDefault(); 
});

