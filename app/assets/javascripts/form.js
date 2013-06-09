var $image_fields = $("#image_selector");
var inputs = $image_fields.find("input");
$(inputs[inputs.length - 1]).bind("change", chosen)[0]._index = 0;


function chosen(e) {
    if ($image_fields.find("input").length == 5) return;
    
    $(e.currentTarget).unbind("change", chosen);
    
    var $selectors = $image_fields.find(".cloneable");
    var selector = $selectors[0];
    
    var $clone = $(selector).clone();
    $clone.removeClass("has_image");

    var input = $clone.find("input");
    var name = input.attr("name");
    var id = input.attr("id");

    var idx = $image_fields.find("input").length;
    name = name.replace(/image_[0-9]/, "image_" + idx);
    id = id.replace(/image_[0-9]/, "image_" + idx);
    input.attr("name", name);
    input.attr("id", id);

    $clone.find("h3").text(idx + 1);
    $clone.find("input").bind("change", chosen)[0]._index = idx;
    $image_fields.append($clone);
}
