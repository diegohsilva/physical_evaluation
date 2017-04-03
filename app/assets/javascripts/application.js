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
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap-datepicker
//= require bootstrap-datepicker.min
//= require bootstrap-datepicker.pt-BR.min
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require jquery-ui


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



var maskSetup = function (html) {
    html.find('input.date').inputmask("99/99/9999");
    html.find('input.phone').inputmask("(99)9999-9999");
    html.find('input.zipcode').inputmask("99.999-999");
    html.find('input.cel_phone').inputmask("(99)9 9999-9999");
    html.find('input.cpf').inputmask("999.999.999-99");
    html.find('input.average').inputmask("99.99");
    html.find('input.time').inputmask("99:99");
   	html.find('input.float').inputmask("999.99");
   	html.find('input.float_altura').inputmask("9.99");
  	html.find('input.float_peso').inputmask("999.99");
 
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

jQuery(function($){
	$( "#evaluation_amn_limitacao" ).click(function() {
		selectedValue = $( "#evaluation_amn_limitacao").prop( "checked" );
		monitoringContainer = $('.div_dor_limitacao');
		if (selectedValue){
			monitoringContainer.removeClass( "hidden" )
		}else{
			$( "#evaluation_amn_dor" ).val("");			
			monitoringContainer.addClass( "hidden" )
		}		
	});
	
});

jQuery(function($){
	$( "#evaluation_cirugia" ).click(function() {
		selectedValue = $( "#evaluation_cirugia").prop( "checked" );
		monitoringContainer1 = $('.div_data_cirugia');
		monitoringContainer2 = $('.div_info_cirugia');
		
		if (selectedValue){
			monitoringContainer1.removeClass( "hidden" );
			monitoringContainer2.removeClass( "hidden" );			
		}else{
			$( "#evaluation_info_cirugia" ).val("");			
			$( "#evaluation_data_cirugia" ).val("");						
			monitoringContainer1.addClass( "hidden" );
			monitoringContainer2.addClass( "hidden" );
		}		
	});
	
});

