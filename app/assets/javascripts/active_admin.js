//= require active_admin/base
//= require activeadmin_addons/all
//= require chartkick
//= require Chart.bundle

$(document).ready(function() {
  //Start of the Dynamic forms for (Coats, Vests, Pants/Skirts, Shirts)
  const itemTypeSelector = $('#item-type-selector');
  
  if (itemTypeSelector.length) {
    const coatsSection = $('#coats-section');
    const pantsSkirtSection = $('#pants-skirt-section');
    const vestsSection = $('#vests-section');
    const shirtsSection = $('#shirts-section');

    const toggleSections = (selectedType) => {
      coatsSection.hide();
      pantsSkirtSection.hide();
      vestsSection.hide();
      shirtsSection.hide();

      if (selectedType === 'Coats') {
        coatsSection.show();
      } else if (selectedType === 'Pants/Skirt') {
        pantsSkirtSection.show();
      } else if (selectedType === 'Vests') {
        vestsSection.show();
      } else if (selectedType === 'Shirts') {
        shirtsSection.show();
      }
    };

    toggleSections(itemTypeSelector.val());

    itemTypeSelector.on('change', function() {
      toggleSections($(this).val());
    });
  }

   // Start of the Fields for brand name that must be hidden.
   // Handling brand name select and fittings
   const $brandNameSelect = $('#type_of_brand');
   const $secondFittingInput = $('#second_fitting');
   const $thirdFittingInput = $('#third_fitting');
   const $fourthFittingInput = $('#fourth_fitting');

   if ($brandNameSelect.length && $secondFittingInput.length && $thirdFittingInput.length && $fourthFittingInput.length) {
       // Create indicator messages
       const $secondFittingMessage = $('<span>')
           .text('Second fitting is not applicable for St. James.')
           .css('color', 'red')
           .hide();
       $secondFittingInput.parent().append($secondFittingMessage);

       const $thirdFittingMessage = $('<span>')
           .text('Third fitting is not applicable for St. James.')
           .css('color', 'red')
           .hide();
       $thirdFittingInput.parent().append($thirdFittingMessage);

       const $fourthFittingMessage = $('<span>')
           .text('Fourth fitting is not applicable for St. James.')
           .css('color', 'red')
           .hide();
       $fourthFittingInput.parent().append($fourthFittingMessage);

       function updateFittings() {
           if ($brandNameSelect.val() === 'St. James') {
               $secondFittingInput.prop('disabled', true).attr('placeholder', 'N/A').val('');
               $secondFittingMessage.show();
              
               $thirdFittingInput.prop('disabled', true).attr('placeholder', 'N/A').val('');
               $thirdFittingMessage.show();

               $fourthFittingInput.prop('disabled', true).attr('placeholder', 'N/A').val('');
               $fourthFittingMessage.show();
           } else {
               $secondFittingInput.prop('disabled', false).attr('placeholder', '');
               $secondFittingMessage.hide();

               $thirdFittingInput.prop('disabled', false).attr('placeholder', '');
               $thirdFittingMessage.hide();

               $fourthFittingInput.prop('disabled', false).attr('placeholder', '');
               $fourthFittingMessage.hide();
           }
       }

       // Initial check when page loads
       updateFittings();

       // Periodic check with setInterval
       const intervalId = setInterval(() => {
           if (document.readyState === 'complete') {
               updateFittings();
           }
       }, 500);

       // Listen for changes in the brand name select field
       $brandNameSelect.change(updateFittings);

       // Clear interval on page unload
       $(window).on('beforeunload', function() {
           clearInterval(intervalId);
       });
   }
   // End of the Fields for brand name that must be hidden.
});


  
