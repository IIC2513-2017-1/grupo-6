// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
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

    $navDots.on('click', function(e) {
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


    // add to cart counter

    (function() {

        window.inputNumber = function(el) {

            var min = el.attr('min') || false;
            var max = el.attr('max') || false;

            var els = {};

            els.dec = el.prev();
            els.inc = el.next();

            el.each(function() {
                init($(this));
            });

            function init(el) {

                els.dec.on('click', decrement);
                els.inc.on('click', increment);

                function decrement() {
                    var value = el[0].value;
                    value--;
                    if (!min || value >= min) {
                        el[0].value = value;
                    }
                }

                function increment() {
                    var value = el[0].value;
                    value++;
                    if (!max || value <= max) {
                        el[0].value = value++;
                    }
                }
            }
        }
    })();

    inputNumber($('.input-number'));


    // tabs js

    $('.tablinks').on('click', function() {
        var link = $(this);
        var tab = $('.' + link.data('tab'));

        // Get all elements with class="tabcontent" and hide them
        $('.tabcontent').each(function() {
            $(this).hide();
        });

        // Get all elements with class="tablinks" and remove the class "active"
        $('.tablinks').each(function() {
            $(this).removeClass('active');
        });

        // Show the current tab, and add an "active" class to the button that opened the tab
        tab.show();
        link.addClass('active');
    });
    $('.defaultOpen').click();

    // set category tree width on load
    $('#category_tree').mouseover(function() {
            $(this).addClass('hovered-on-load');
        })
        .mouseout(function() {
            $(this).removeClass('hovered-on-load');

        });




    $("#high").val(maxPrice());
    $("#low").val(0);

});

function filter() {
    nameFilter()
    priceFilter()
}

function maxPrice() {
    var max;
    max = 0;
    div = document.getElementById("productCards");

    if (div) {
        cards = div.getElementsByTagName('figure');
        for (i = 0; i < cards.length; i++) {
            price = cards[i].getElementsByTagName("span")[0];
            price = +price.innerHTML.slice(2, )
            if (price > max) {
                max = price;
            }
        }
        return max;

    }



}


function nameFilter() {
    console.log("filter")
    var input, filter, div, name, i, tags;
    input = document.getElementById('filterInput');
    filter = input.value.toUpperCase();
    div = document.getElementById("productCards");
    cards = div.getElementsByTagName('figure');

    // Loop through all cards, and hide those who don't match the search query
    for (i = 0; i < cards.length; i++) {
        name = cards[i].getElementsByTagName("figcaption")[0];
        tags = cards[i].dataset.tags
        if (name.innerHTML.toUpperCase().indexOf(filter) > -1 || tags.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }


    }
}

function priceFilter() {
    console.log("pricefilter")
    var low, high, filter, div, price, i, tags;
    low = +document.getElementById('low').value;
    high = +document.getElementById('high').value;

    if (high === 0) {
        $("#high").val(maxPrice());
        high = maxPrice();

    }

    if (low === 0) {
        $("#low").val(0);
    }

    if (low > high) {
        $("#high").val(low);
    }


    div = document.getElementById("productCards");
    cards = div.getElementsByTagName('figure');



    // Loop through all cards, and hide those who don't match the search query
    for (i = 0; i < cards.length; i++) {
        price = cards[i].getElementsByTagName("span")[0];
        price = +price.innerHTML.slice(2, )
        if (price < low || price > high) {
            if (cards[i].style.display !== "none") {
                cards[i].style.display = "none";
            }
        }
    }
}