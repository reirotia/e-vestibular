$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.nextBtn');
    
    allWells.hide();
    isValid=false;

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);
        
        if (!$item.hasClass('disabled')) {
            
            
           $item.addClass('btn-success');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
            
        }
    });

    allNextBtn.click(function () {
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),

            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;
        
        $(".form-group").removeClass("has-error");
        for (var i = 0; i < curInputs.length; i++) {
            if (!curInputs[i].validity.valid) {
                isValid = false;

                $(curInputs[i]).closest(".form-group").addClass("has-error");
            } else {
                $('div.setup-panel div a[href="#' + curStepBtn + '"]').removeClass('btn-danger');

                $('div.setup-panel div a[href="#' + curStepBtn + '"]').addClass('btn-success');
                
            }
        }

        nextStepWizard.removeAttr('disabled').trigger('click');    
        if (!isValid) {
            
            $('div.setup-panel div a[href="#' + curStepBtn + '"]').addClass('btn-danger');
            
        } else {
            $('div.setup-panel div a[href="#' + curStepBtn + '"]').addClass('btn-success');

        }

    });

    $('div.setup-panel div a.btn-success').trigger('click');
});