$(document).on('turbolinks:load', function() {
    $('.close-flash-button').click(function() {
        $(this).parent().remove()
    })

    setTimeout(fadeout_flash, 5000)
    setTimeout(delete_flash, 5000 + 1500)

    function fadeout_flash() {
        $('#flash-message').fadeOut('normal')
        $('#flash-alert').fadeOut('normal')
    }

    function delete_flash() {
        $('#flash-message').remove()
        $('#flash-alert').remove()
    }
})