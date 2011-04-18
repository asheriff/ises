////////////////////////////////////////////////////////////////////////////////
// Config
////////////////////////////////////////////////////////////////////////////////
(function($){
  "use strict";
  
  //
  // Modal popin
  //
  $.modal.defaults.opacity = 30;
  $.modal.defaults.overlayId = "ModalOverlay";
  $.modal.defaults.containerId = "Modal";
  $.modal.defaults.minHeight = "300px";
  $.modal.defaults.closeClass = "close_modal";
})(jQuery);

////////////////////////////////////////////////////////////////////////////////
// Initialization
////////////////////////////////////////////////////////////////////////////////
(function($){
  "use strict";
  
  // TODO: use ajax for image gallery
  $("A[rel~=modal][href^=#]").live("click", function(){
    var html = $($(this).attr("href")).html();
    $('#ModalContent .bd').html( html );
    var modal = $('#ModalContent').modal();
    
    return false
  });
})(jQuery);