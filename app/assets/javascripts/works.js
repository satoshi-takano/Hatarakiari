

$(function() {
    var $roles = $("#roles li");
    $roles.on("click", function() {
        var text = $(this).text();
        var parsed = /([\w]+)\s([0-9]+)/.exec(text);
        var role = parsed[1];
        var count = parsed[2];
    });


    $.ajax({
        type: "GET",
        url: "/users/1.json",
        dataType:"json",
        success: function(_years) {
            $(_years).each(function(i) {
                var year = new Year(this[0].year, this);

                yearsViewModel.years.push(year);
            });
        }
    });

    function Year(year, works) {
        this.year = ko.observable(year);
        var _works = this.works = ko.observableArray([]);
        $(works).each(function() {
            console.log(this);
            this.roles = this.role.split(",");
            _works.push(this);
        })
    }
    
    function YearsViewModel() {
        var years = [];
        this.years = ko.observableArray(years);

        this.toggleTagFiltering = function(vm, e) {
            var role = /^([\w]+)\s[0-9]+/.exec($(e.currentTarget).text())[1];
        }

        this.filtering = function(role) {
            
        }
    }
    
    var yearsViewModel = new YearsViewModel();
    ko.applyBindings(yearsViewModel);
})
