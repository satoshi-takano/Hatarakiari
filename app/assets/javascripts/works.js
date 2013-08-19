$(function() {
    
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
        this.hasWorks = ko.observable(works.length ? true : false);
        
        $(works).each(function() {
            this.enabled = ko.observable(true);
            this.roles = this.role.split(",");
            _works.push(this);
        })
    }
    Year.prototype = {
        filtering: function(role) {
            this.hasWorks(true);
            var works = this.works();
            var filtered = works.length;
            
            ko.utils.arrayForEach(works, function(work) {
                work.enabled(false);
                var roles = work.roles;
                
                for (var i = 0, l = roles.length; i < l; i++) {
                    if (roles[i] == role || role == "All") {
                        work.enabled(true);
                        filtered--;
                    }
                }
            })

            this.hasWorks(filtered < works.length);
        }
    }
    
    function YearsViewModel() {
        var $roles = $("#roles li");
        var $current = $($roles[0]);

        var years = [];
        this.years = ko.observableArray(years);

        this.toggleTagFiltering = function(vm, e) {
            var $target = $(e.currentTarget);
            var role = /^([\w]+)\s*?[0-9]*?/.exec($target.text())[1];
            $current.removeClass("active");
            $target.addClass("active");
            $current = $target;
            this.filtering(role);
        }

        this.filtering = function(role) {
            ko.utils.arrayForEach(this.years(), function(year) {
                year.filtering(role);
            })
        }
    }
    
    var yearsViewModel = new YearsViewModel();
    ko.applyBindings(yearsViewModel);
})
