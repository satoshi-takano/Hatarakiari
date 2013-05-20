var $image_fields = $("#image_selector");
$($image_fields.find("input")[0]).bind("change", chosen);

function chosen(e) {
    $(e.currentTarget).unbind("change", chosen);
    
    var $selectors = $image_fields.find("div");
    var selector = $selectors[0];
    
    var $clone = $(selector).clone();

    var input = $clone.find("input");
    var name = input.attr("name");
    var id = input.attr("id");

    var idx = $selectors.length;
    name = name.replace(/image_[0-9]/, "image_" + idx);
    id = id.replace(/image_[0-9]/, "image_" + idx);
    input.attr("name", name);
    input.attr("id", id);

    $clone.find("label").text("Image " + idx);
    $clone.find("input").bind("change", chosen);
    $image_fields.append($clone);
}

$("#submit_button").bind("click", function() {
    $("form").submit();
})
