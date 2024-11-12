<%-- 
    Document   : script
    Created on : Sep 18, 2024, 12:18:37 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="js/app.js"></script>

<script src="js/fullcalendar.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("fullcalendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem: "bootstrap",
            initialView: "dayGridMonth",
            initialDate: "2021-07-07",
            headerToolbar: {
                left: "prev,next today",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay"
            },
            events: [{
                    title: "All Day Event",
                    start: "2021-07-01"
                },
                {
                    title: "Long Event",
                    start: "2021-07-07",
                    end: "2021-07-10"
                },
                {
                    groupId: "999",
                    title: "Repeating Event",
                    start: "2021-07-09T16:00:00"
                },
                {
                    groupId: "999",
                    title: "Repeating Event",
                    start: "2021-07-16T16:00:00"
                },
                {
                    title: "Conference",
                    start: "2021-07-11",
                    end: "2021-07-13"
                },
                {
                    title: "Meeting",
                    start: "2021-07-12T10:30:00",
                    end: "2021-07-12T12:30:00"
                },
                {
                    title: "Lunch",
                    start: "2021-07-12T12:00:00"
                },
                {
                    title: "Meeting",
                    start: "2021-07-12T14:30:00"
                },
                {
                    title: "Birthday Party",
                    start: "2021-07-13T07:00:00"
                },
                {
                    title: "Click for Google",
                    url: "http://google.com/",
                    start: "2021-07-28"
                }
            ]
        });
        setTimeout(function () {
            calendar.render();
        }, 250)
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        setTimeout(function () {
            if (localStorage.getItem('popState') !== 'shown') {
                window.notyf.open({
                    type: "success",
                    message: "Get access to all 500+ components and 45+ pages with AdminKit PRO. <u><a class=\"text-white\" href=\"https://adminkit.io/pricing\" target=\"_blank\">More info</a></u> 🚀",
                    duration: 10000,
                    ripple: true,
                    dismissible: false,
                    position: {
                        x: "left",
                        y: "bottom"
                    }
                });

                localStorage.setItem('popState', 'shown');
            }
        }, 15000);
    });
</script>
