$(function() {
    var $roles = $("#roles li");
    $roles.on("click", function() {
        var text = $(this).text();
        var parsed = /([\w]+)\s([0-9]+)/.exec(text);
        var role = parsed[1];
        var count = parsed[2];
    });
})
