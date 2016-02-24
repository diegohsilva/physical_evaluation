$(function() {
  // Side Bar Toggle
  $('.nav-toggle-sidebar .toggle').click(function(event) {
    var button = $(this)
      , sidebarContent = $('#sidebar')
      , content = $('#content')
      , isHidden = button.hasClass("right");

      if (isHidden) {
        sidebarContent.removeClass('span1').addClass('span3');
        content.removeClass('span11').addClass('span9');
        button.removeClass('right').addClass('left');
      } else {
        sidebarContent.removeClass('span3').addClass('span1');
        content.removeClass('span9').addClass('span11');
        button.removeClass('left').addClass('right');
      }

      event.preventDefault();
  });

  $('.show-sidebar').click(function(event) {
    var sidebarContent = $('#sidebar')
      , content = $('#content')
      , hideButton = $('.hide-sidebar')
      , showButton = $('.show-sidebar');

    sidebarContent.removeClass('span1').addClass('span3');
    sidebarContent.find(".sidebar-text").removeClass("hidden");
    content.removeClass('span11').addClass('span9');
    hideButton.removeClass('hidden');
    showButton.addClass('hidden');

    event.preventDefault();
  });
});
