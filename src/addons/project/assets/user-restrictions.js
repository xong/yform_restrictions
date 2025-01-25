$(document).on('rex:ready', function (event, container) {

    if (rex.userRestrictions['rex_yf_location'] && rex.userRestrictions['rex_yf_location'].length) {

        $('#yform-data_edit-rex_yf_location select option').each(function (i, elem) {
            if (rex.userRestrictions['rex_yf_location'].indexOf($(elem).attr('value')) === -1) {
                $(elem).remove();
            }
        });
    }
});