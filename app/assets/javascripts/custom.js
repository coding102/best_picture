$(document).ready(function(){


    $('#header').hover( 
        function() { $(this).data('bounce', true); bounce($(this));}, 
        function() { $(this).data('bounce', false);
    });

    function bounce($elem) {
        $elem.effect('bounce', { times: 1, distance: 15 }, 700, function() {
            if ($(this).data('bounce')) bounce($elem);
            else $elem.stop();
        });   
    }

});