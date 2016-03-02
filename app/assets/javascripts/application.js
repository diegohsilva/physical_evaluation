//= require jquery
//= require jquery_ujs
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require jquery.singlemask
//= require jquery.price_format
//= require toastr
//= require bootstrap
//= require theme
//= requere bootstrap-admin
//= require cocoon

$(function(){
    $(".input-search").keyup(function(){
        //pega o css da tabela
        var tabela = $(this).attr('alt');
        if( $(this).val() != ""){
            $("."+tabela+" tbody>tr").hide();
            $("."+tabela+" td:contains-ci('" + $(this).val() + "')").parent("tr").show();
        } else{
            $("."+tabela+" tbody>tr").show();
        }
    });
});
$.extend($.expr[":"], {
    "contains-ci": function(elem, i, match, array) {
        return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
});

$(function(){
  $("#txtBusca").keyup(function(){
    var texto = $(this).val(); $("#ulItens td").css("display", "block");
    $("#ulItens td").each(function()
    {
      if($(this).text().indexOf(texto) < 0) $(this).css("display", "none");
    });
  });
});

jQuery(function($){
  $("#event_type_event").on("change", function(e) {
    var selectedValue = $(this).val(),
        monitoringContainer = $('#div_monitoring');
    if (selectedValue == "1" || selectedValue == "2" || selectedValue == "3" || selectedValue == "4" || selectedValue == "5" || selectedValue == "6" || selectedValue == "7" || selectedValue == "8" || selectedValue == "9") {
      monitoringContainer.addClass("hidden");
      $("#event_teacher_id").val("");
      $("#event_student_id").val("");

      if (selectedValue == "1" ){
        $("#event_description").val("FESTA");
      }

      if (selectedValue == "2" ){
        $("#event_description").val("RECESSO");
      }

      if (selectedValue == "3" ){
        $("#event_description").val("FERIADO");
      }

      if (selectedValue == "4" ){
        $("#event_description").val("DIA DE PROVA");
      }

      if (selectedValue == "5" ){
        $("#event_description").val("IMPORTANTE");
      }

      if (selectedValue == "6" ){
        $("#event_description").val("PROVA MIDTERM");
      }

      if (selectedValue == "7" ){
        $("#event_description").val("PROVA FINAL");
      }

      if (selectedValue == "8" ){
        $("#event_description").val("PROVA ORAL");
      }
      if (selectedValue == "9" ){
        $("#event_description").val("SPEECH");
      }



    } else {
      monitoringContainer.removeClass("hidden");
      $("#event_description").val("MONITORIA");
    }
  });
});


var maskSetup = function (html) {
    html.find('input.date').inputmask("99/99/9999");
    html.find('input.phone').inputmask("(99)9999-9999");
    html.find('input.zipcode').inputmask("99.999-999");
    html.find('input.average').inputmask("99.99");

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

    var selector = "input, textarea";
    var beforeChange = function(event){
      $(this).data("value", this.value);
    };

    var afterChange = function(event){
      var input = $(this);
      if(this.value !== input.data("value")){
        input.trigger("change").removeData("value");
      }
    };

    $(document.body)
      .on("focus",     selector, beforeChange)
      .on("keydown",   selector, beforeChange)
      .on("mousedown", selector, beforeChange)
      .on("keyup",     selector, afterChange)
      .on("mouseup",   selector, afterChange);

});

