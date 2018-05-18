
(function ($) {


    function getElementsByIdStartsWith(container, selectorTag, regex) {
        let items = [];
        let myPosts = document.getElementById(container).getElementsByTagName(selectorTag);
        for (let i = 0; i < myPosts.length; i++) {
            //omitting undefined null check for brevity
            if (regex.test(myPosts[i].id)) {
                items.push(myPosts[i].id);
            }
        }
        return items;
    }

    function inlineChange() {
        let home_club_id = $('#id_home_team').val();
        let away_club_id = $('#id_away_team').val();

        let  regex = /id_matchdetail_set-\d+-player/g;

        let matchIds = getElementsByIdStartsWith("content", "select", regex);

        if (home_club_id && away_club_id && matchIds.length > 0) {

            $.get("/core/players", { 'home_club_id' : home_club_id, 'away_club_id' : away_club_id } ,  function(players){
                for (let j=0; j < matchIds.length; j++) {

                    let selector = $('#' + matchIds[j]);

                    let currentSelected = selector.val();

                    let html = '<option value="">Choose Player</option>';
                    for (let i=0; i < players.length; i ++) {
                        if (players[i].pk == currentSelected) {
                            html += "<option value='"+players[i].pk+"' selected >"+players[i].fields.name+"</option>";
                        } else {
                            html += "<option value='"+players[i].pk+"' >"+players[i].fields.name+"</option>";
                        }

                    }
                    selector.empty().append(html)
                }

            });
        }
    }
    $(document).ready(function () {
        inlineChange();
        $("tr.add-row a").on('click', function(e) {
            alert("You clicked a textarea field");
            inlineChange();
        });
    });

    $(document).on('change', '#id_home_team, #id_away_team', function(e) {
        e.preventDefault();
        inlineChange();
    });
}(jQuery || django.jQuery));