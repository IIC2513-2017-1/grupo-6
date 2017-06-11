// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function show_answer_form(question_id) {
    $('#answer-for-' + question_id).removeClass('hidden')
    $('button.show-button[data-question-id=' + question_id + ']').addClass('hidden')
    $('button.hide-button[data-question-id=' + question_id + ']').removeClass('hidden')
}

function hide_answer_form(question_id) {
    $('#answer-for-' + question_id).addClass('hidden')
    $('button.show-button[data-question-id=' + question_id + ']').removeClass('hidden')
    $('button.hide-button[data-question-id=' + question_id + ']').addClass('hidden')
}