<%-- 
    Document   : js
    Created on : Oct 19, 2024, 4:20:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script >
        function changeId() {
            var month_revenue = document.getElementById('month_revenue');
            var month_registration = document.getElementById('month_registration');
            var all_month_revenue = document.getElementById('all_month_revenue');
            var month_revenue_label = document.getElementById('month_revenue_label');
            var all_month_registration = document.getElementById('all_month_registration');
            var month_registration_label = document.getElementById('month_registration_label');
            var month_registration_status_label = document.getElementById('month_registration_status_label');
            var month_registration_status= document.getElementById('month_registration_status');

            var week_revenue = document.getElementById('week_revenue');
            var week_registration = document.getElementById('week_registration');
            var all_week_revenue = document.getElementById('all_week_revenue');
            var week_revenue_label = document.getElementById('week_revenue_label');
            var all_week_registration = document.getElementById('all_week_registration');
            var week_registration_label = document.getElementById('week_registration_label');
            var week_registration_status_label = document.getElementById('week_registration_status_label');
            var week_registration_status= document.getElementById('week_registration_status');
            if (month_revenue.style.display === 'none') {
                month_revenue.style.display = '';
                month_registration.style.display = '';
                all_month_revenue.style.display = '';
                month_revenue_label.style.display = '';
                all_month_registration.style.display = '';
                month_registration_label.style.display = '';
                month_registration_status_label.style.display='';
                month_registration_status.style.display='';

                week_revenue.style.display = 'none';
                week_registration.style.display = 'none';
                all_week_revenue.style.display = 'none';
                week_revenue_label.style.display = 'none';
                all_week_registration.style.display = 'none';
                week_registration_label.style.display = 'none';
                week_registration_status_label.style.display='none';
                week_registration_status.style.display='none';
            } else {
                month_revenue.style.display = 'none';
                month_registration.style.display = 'none';
                all_month_revenue.style.display = 'none';
                month_revenue_label.style.display = 'none';
                all_month_registration.style.display = 'none';
                month_registration_label.style.display = 'none';
                month_registration_status_label.style.display='none';
                month_registration_status.style.display='none';

                week_revenue.style.display = '';
                week_registration.style.display = '';
                all_week_revenue.style.display = '';
                week_revenue_label.style.display = '';
                all_week_registration.style.display = '';
                week_registration_label.style.display = '';
                     week_registration_status_label.style.display='';
                week_registration_status.style.display='';
            }
        }
    </script>
    <!--chart for month revenue-->
    <script>
        //chart for month revenues
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chartjs-dashboard-month-revenue").getContext("2d");
            var gradient = ctx.createLinearGradient(0, 0, 0, 2, 25);
            gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
            gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
            var list = [1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('et' + i).innerHTML);
            }

            new Chart(document.getElementById("chartjs-dashboard-month-revenue"), {
                type: "line",
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                            label: "Sales ($)",
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: window.theme.primary,
                            data: list
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    },
                    tooltips: {
                        intersect: false
                    },
                    hover: {
                        intersect: true
                    },
                    plugins: {
                        filler: {
                            propagate: false
                        }
                    },
                    scales: {
                        xAxes: [{
                                reverse: true,
                                gridLines: {
                                    color: "rgba(0,0,0,0.0.05)"
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    stepSize:1000
                                },
                                display: true,
                                borderDash: [3, 3],
                                gridLines: {
                                    color: "rgba(0,0,0,0.0)",
                                    fontColor: "#fff"
                                }
                            }]
                    }
                }
            });
        });
    </script>
    <!--chart for week revenue-->
    <script>
        //chart for week revenues
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chartjs-dashboard-week-revenue").getContext("2d");
            var gradient = ctx.createLinearGradient(0, 0, 0, 2, 25);
            gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
            gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
            var list = [1000, 1100, 1200, 1300, 1400, 1500, 1600];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('wr' + i).innerHTML);
            }

            new Chart(document.getElementById("chartjs-dashboard-week-revenue"), {
                type: "line",
                data: {
                    labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    datasets: [{
                            label: "Sales ($)",
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: window.theme.primary,
                            data: list
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    },
                    tooltips: {
                        intersect: false
                    },
                    hover: {
                        intersect: true
                    },
                    plugins: {
                        filler: {
                            propagate: false
                        }
                    },
                    scales: {
                        xAxes: [{
                                reverse: true,
                                gridLines: {
                                    color: "rgba(0,0,0,0.0.05)"
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    stepSize: 100
                                },
                                display: true,
                                borderDash: [3, 3],
                                gridLines: {
                                    color: "rgba(0,0,0,0.0)",
                                    fontColor: "#fff"
                                }
                            }]
                    }
                }
            });
        });
    </script>
    <!--chart for month registrations-->
    <script>
        //chart for month registrations
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chartjs-dashboard-month-registrations").getContext("2d");
            var gradient = ctx.createLinearGradient(0, 0, 0, 2, 25);
            gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
            gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
            var list = [1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('re' + i).innerHTML);
            }

            new Chart(document.getElementById("chartjs-dashboard-month-registrations"), {
                type: "line",
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                            label: "Registration",
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: window.theme.primary,
                            data: list
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    },
                    tooltips: {
                        intersect: false
                    },
                    hover: {
                        intersect: true
                    },
                    plugins: {
                        filler: {
                            propagate: false
                        }
                    },
                    scales: {
                        xAxes: [{
                                reverse: true,
                                gridLines: {
                                    color: "rgba(0,0,0,0.0.05)"
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    stepSize: 50
                                },
                                display: true,
                                borderDash: [3, 3],
                                gridLines: {
                                    color: "rgba(0,0,0,0.0)",
                                    fontColor: "#fff"
                                }
                            }]
                    }
                }
            });
        });
    </script>
    <!--chart for week registrations        -->
    <script>
//chart for week registrations
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chartjs-dashboard-week-registrations").getContext("2d");
            var gradient = ctx.createLinearGradient(0, 0, 0, 2, 25);
            gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
            gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
            var list = [1000, 1100, 1200, 1300, 1400, 1500, 1600];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('wre' + i).innerHTML);
            }

            new Chart(document.getElementById("chartjs-dashboard-week-registrations"), {
                type: "line",
                data: {
                    labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    datasets: [{
                            label: "Registration",
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: window.theme.primary,
                            data: list
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    },
                    tooltips: {
                        intersect: false
                    },
                    hover: {
                        intersect: true
                    },
                    plugins: {
                        filler: {
                            propagate: false
                        }
                    },
                    scales: {
                        xAxes: [{
                                reverse: true,
                                gridLines: {
                                    color: "rgba(0,0,0,0.0.05)"
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    stepSize: 10
                                },
                                display: true,
                                borderDash: [3, 3],
                                gridLines: {
                                    color: "rgba(0,0,0,0.0)",
                                    fontColor: "#fff"
                                }
                            }]
                    }
                }
            });
        });
    </script>


    <!--chart pie for month registration status-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var list = [1000, 1100, 1200];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('rs' + i).innerHTML);
            }
            // Pie chart
            new Chart(document.getElementById("chartjs-pie-month-registration-status"), {
                type: "pie",
                data: {
                    labels: ["Cancel", "Pending", "Paid"],
                    datasets: [{
                            data: list,
                            backgroundColor: [
                                "#FF0000", // Red
                                "#FFFF00",
                                "#008000", // Green
                                "#dee2e6"
                            ],
                            borderColor: "transparent"
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    }
                }
            });
        });

    </script>
 
<!--chart pie for week registration status    -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var list = [1000, 1100, 1200];
            for (var i = 0; i < list.length; i++) {
                list[i] = parseInt(document.getElementById('wrs' + i).innerHTML);
            }
            // Pie chart
            new Chart(document.getElementById("chartjs-pie-week-registration-status"), {
                type: "pie",
                data: {
                    labels: ["Cancel", "Pending", "Paid"],
                    datasets: [{
                            data: list,
                            backgroundColor: [
                                "#FF0000", // Red
                                "#FFFF00",
                                "#008000", // Green
                                "#dee2e6"
                            ],
                            borderColor: "transparent"
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    }
                }
            });
        });

    </script>
</html>
