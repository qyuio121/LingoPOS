/*1:1 문의 리스트 테이블 솔팅 js*/


// Avoid `console` errors in browsers that lack a console.
//1:1문의 리스트 테이블 솔팅 JS
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeline', 'timelineEnd', 'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());
$(document).ready(function() {
    $("table.example1").tablesorter({
      tablesorterColumns: [{col: 0, order: 'desc'}, {col: 7, order: 'asc'}]
    });

    $("table.example2").tablesorter({
      tablesorterColumns: [{col: 0, order: 'desc'}, {col: 3, order: 'asc'}]
    });
});
