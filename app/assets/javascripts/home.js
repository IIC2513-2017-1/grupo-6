// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// offer carrousel

$(document).on('turbolinks:load', function () {
    var $sliderWrap = $('#slider-wrap'),
        $slider = $sliderWrap.find('.slides'),
        $firstSlide = $slider.find('li:first'),
        $lastSlide = $slider.find('li:last'),
        $sliderSlides = $sliderWrap.find('.slides > li'),
        $navDots = $sliderWrap.find('.nav-dots li'),
        sliderWidth = $sliderWrap.width(),
        // dynamic variables
        sliderPos = 0,
        s_index = 0,
        currentSlide = $sliderSlides[s_index];

    function changeSlide() {
        $slider.css('left', sliderPos);

        $navDots.removeClass('active');
        $($navDots[s_index]).addClass('active');
    }


    function setSliderWidth() {
        /* -----------------------------------------
         * set slider width
         * slider container * number of slides
         * ----------------------------------------- */
        $slider.css('width', sliderWidth * $sliderSlides.length);
    }

    function nextSlide() {
        /* -----------------------------------------
         * IF: slide index >= total slides
         * THEN:
         *      slide index = 0 
         *      slide pos = 0
         * ELSE:
         *      slide index + 1
         *      move slider position one slide
         * ---------------------------------------- */
        s_index >= ($sliderSlides.length - 1) ? (
            // s_index = 0,
            // sliderPos = 0,
            false
        ) : (
            s_index++,
            sliderPos -= sliderWidth
        );

        // change slide
        changeSlide();
    }

    function prevSlide() {
        /* -----------------------------------------
         * IF: slide index <= 0
         * THEN:
         *      slide index = $slides.length
         *      move slider position to last slide
         * ELSE:
         *      slide index - 1
         *      move slider position back one slide
         * ---------------------------------------- */
        s_index <= 0 ? (
            // s_index = ($sliderSlides.length - 1),
            // sliderPos = -$sliderWrap.width()
            false
        ) : (
            s_index--,
            sliderPos += sliderWidth
        );

        // change slide
        changeSlide();
    }

    // set slider width
    setSliderWidth();

    $navDots.on('click', function (e) {
        var oldIndex = s_index,
            curIndex = $navDots.index(this);
            
        if (curIndex === oldIndex) {
            return false
        } else if (oldIndex < curIndex) {
            for (var i = curIndex - oldIndex - 1; i > 0; i--) {
                nextSlide()
            }
        } else {
            for (var i = oldIndex - curIndex - 1; i > 0; i--) {
                prevSlide()
            }
        }

        curIndex === oldIndex ? false : (oldIndex < curIndex) ? nextSlide() : prevSlide();  
    });



    function auto_slide() {
        var oldIndex = s_index
        var curIndex = $navDots.index(this);
        if ($slider.selector=== "#slider-wrap .slides") {
            if (oldIndex === $sliderSlides.length-1){
                for (var i = oldIndex; i >= 0; i--) {
                prevSlide()
            }
                
            } else {
            console.log(oldIndex)

            console.log($sliderSlides.length)
            nextSlide()
            }
        }
    }


if ($slider.selector === "#slider-wrap .slides") {
setInterval(function(){
 auto_slide()
}, 5000);
}



});