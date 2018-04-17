(function ($) {
    "use strict";

    function getElementsByIdStartsWith(container, selectorTag, regex) {
        var items = [];
        var myPosts = document.getElementById(container).getElementsByTagName(selectorTag);
        for (var i = 0; i < myPosts.length; i++) {
            //omitting undefined null check for brevity
            if (regex.test(myPosts[i].id)) {
                items.push(myPosts[i].id);
            }
        }
        return items;
    }

    function inlineChange() {
        var home_club_id = $('#id_home_team').val();
        var away_club_id = $('#id_away_team').val();

        var  regex = /id_matchdetail_set-\d+-player/g;

        var matchIds = getElementsByIdStartsWith("content", "select", regex);

        if (home_club_id && away_club_id && matchIds.length > 0) {

            $.get("/core/players", { 'home_club_id' : home_club_id, 'away_club_id' : away_club_id } ,  function(players){
                for (var j=0; j < matchIds.length; j++) {

                    var currentSelected = $('#' + matchIds[j]).val();

                    var html = '<option value="">Choose Player</option>';
                    for (var i=0; i < players.length; i ++) {
                        if (players[i].pk == currentSelected) {
                            html += "<option value='"+players[i].pk+"' selected >"+players[i].fields.name+"</option>";
                        } else {
                            html += "<option value='"+players[i].pk+"' >"+players[i].fields.name+"</option>";
                        }

                    }
                    $('#' + matchIds[j]).empty().append(html)
                }

            });
        }
    }

    function initItem(item) {
        var empty_label, chainfield = "#id_" + $(item).attr("data-chainfield"),
            url = $(item).attr("data-url"),
            id = "#" + $(item).attr("id"),
            value = JSON.parse($(item).attr("data-value")),
            auto_choose = $(item).attr("data-auto_choose");
        if ($(item).hasClass("chained-fk")) {
            empty_label = $(item).attr("data-empty_label");
            chainedfk.init(chainfield, url, id, value, empty_label, auto_choose);
        } else if ($(item).hasClass("chained")) {
            chainedm2m.init(chainfield, url, id, value, auto_choose);
        } else if ($(item).hasClass("filtered")) {
            // For the ManyToMany using horizontal=True added after the page load
            // using javascript.
            id = id.replace('_from', ''); // we need to remove the _from part
            chainedm2m.init(chainfield, url, id, value, auto_choose);
        }
    }

    $(window).on('load', function () {
        $.each($(".chained"), function (index, item) {
            initItem(item);
        });
        inlineChange();
    });

    $(document).ready(function () {
        $.each($(".chained-fk"), function (index, item) {
            initItem(item);
        });
        inlineChange();

        $("tr.add-row a").on('click', function(e) {
            alert("You clicked a textarea field");
            inlineChange();
        });
    });

    function initFormset(chained) {
        var re = /\d+/g,
            prefix,
            match,
            chainfield = $(chained).attr("data-chainfield"),
            chainedId = $(chained).attr("id");
        if (chainfield.indexOf("__prefix__") > -1) {
            /*
             If we have several inlines with the same name, they will get an index, so we need to ignore that and get
             the last numeric value in the id
             */
            do {
                match = re.exec(chainedId);
                if (match) {
                    prefix = match[0];
                }
            } while (match);

            chainfield = chainfield.replace("__prefix__", prefix);
            $(chained).attr("data-chainfield", chainfield);
        }
        initItem(chained);
    }

    $(document).on('change', '#id_home_team, #id_away_team', function(e) {
        e.preventDefault();

        var chainedFK, chainedM2M, filteredM2M;

        // For the ForeingKey
        chainedFK = $(document).find(".chained-fk");
        $.each(chainedFK, function (index, chained) {
            initFormset(chained);
        });

        // For the ManyToMany
        chainedM2M = $(document).find(".chained");
        $.each(chainedM2M, function (index, chained) {
            initFormset(chained);
        });

        // For the ManyToMany using horizontal=True added after the page load
        // using javascript.
        filteredM2M = $(document).find(".filtered");
        $.each(filteredM2M, function (index, filtered) {
            if (filtered.hasAttribute('data-chainfield')) {
                initFormset(filtered);
            }
        });

        inlineChange();
    });




    }(jQuery || django.jQuery));