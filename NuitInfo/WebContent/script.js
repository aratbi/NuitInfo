/**
 * Created by Redouane on 27/11/2015.
 */
$(document).ready(function() {

    $('.nav-item a').click( function() { // Au clic sur un élément
        var tabs = $('.nav-item a');
        tabs.removeClass("active");
        $(this).addClass("active");

    });
});