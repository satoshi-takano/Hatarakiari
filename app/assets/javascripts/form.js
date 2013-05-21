var $image_fields = $("#image_selector");
$($image_fields.find("input")[0]).bind("change", chosen)[0]._index = 0;


function chosen(e) {
    if (e.currentTarget._index == 4) return;
    
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
    $clone.find("input").bind("change", chosen)[0]._index = idx;
    $image_fields.append($clone);
}

$("#submit_button").bind("click", function() {
    if ($("#work_name")[0].value.length == 0) {
        alert("Name can't be blank");
        return;
    }
    $("form").submit();
})
