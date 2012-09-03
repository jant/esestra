var timer;

function start_blinking(button) {
    function blink() {
        button.fadeOut(400, function() {
            button.fadeIn(400);
        });
    }
    timer = setInterval(blink, 10);
}

function stop_blinking() {
    clearInterval(timer);
}

function set_submit_button(button, changed_elements) {
    button.attr('disabled', 'disabled');

    changed_elements.change(function() {
        button.removeAttr('disabled');
        start_blinking(button);
    });
    button.click(function() {
        stop_blinking();
    });
}
