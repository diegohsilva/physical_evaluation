var maskSetup = function (html) {
    html.find('input.date').inputmask("99/99/9999");
    html.find('input.time').inputmask("99:99");
    html.find("input.integer").singlemask(/\d/);
    html.find("input.decimal").priceFormat({
        prefix: '',
        centsSeparator: ',',
        thousandsSeparator: '.'
    });

    html.find("input[data-mask]").each(function () {
        var mask = $(this).data('mask').toString();
        $(this).inputmask(mask);
    });
}

$(function () {
    maskSetup($(document.body));

    $(document).bind('cocoon:after-insert', function(e, inserted_item) {
        maskSetup(inserted_item);
    });

});

(function () {
  $("<div class='pointer'><div class='arrow'></div><div class='arrow_border'></div></div>")
    .appendTo("#dashboard-menu > li.active");
}());
