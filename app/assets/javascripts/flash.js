$(document).on('turbolinks:load', function() {
    var flash_message = $('#flash-message');
    var flash_alert = $('#flash-alert');
    $('.close-flash-button').click(function() {
        $(this).parent().remove()
    })

    setTimeout(fadeout_flash, 5000)
    setTimeout(delete_flash, 5000 + 1500)

    function fadeout_flash() {
        flash_message.fadeOut('normal')
        flash_alert.fadeOut('normal')
    }

    function delete_flash() {
        flash_message.remove()
        flash_alert.remove()
    }
})