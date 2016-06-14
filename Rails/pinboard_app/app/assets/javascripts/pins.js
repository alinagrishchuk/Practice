$(document).ready(function () {
    $('#pins').infinitescroll({
        navSelector  : "nav.pagination",
        // selector for the paged navigation (it will be hidden)
        nextSelector : "nav.pagination a[rel=next]",
        // selector for the NEXT link (to page 2)
        itemSelector : "li.pin",
        // selector for all items you'll retrieve
        debug        : true
    }, function (arrayOfNewElements) {
        console.log(arrayOfNewElements);
    });
});

function setWookmark(){
    var wookmark1 = new Wookmark('#pins', {
        outerOffset: 10, // Optional, the distance to the containers border
        itemWidth: 210 // Optional, the width of a grid item
    });
}
