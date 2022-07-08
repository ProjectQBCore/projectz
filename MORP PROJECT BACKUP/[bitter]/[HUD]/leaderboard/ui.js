var j_data_master;
var j_data_kills;
var j_data_deaths;
var j_data_kdas;
var j_data_own_steam;
var j_data_playtimes;
var j_data;
var j_crewdata;
var j_crew_master;
var j_crew_kills;
var j_crew_members;
var j_crew_kda;
var j_crew_deaths;
$(document).ready(function() {
    window.addEventListener('message', function(event) {
        if (event.data.action == "showLeaderboard") {
            $(".l-wrapper").css("display", "block");
            $("body").addClass("opened");
            $(".leaderboard_players").css("display", "block");
            $(".leaderboard_crews").css("display", "none");
            $(".napoveda").css("display", "none");
            $(".rules").css("display", "none");
            $(".donate").css("display", "none")
            $(".x_players").addClass("active");
            $(".x_crews").removeClass("active");
            $(".x_help").removeClass("active");
            $(".x_rules").removeClass("active");
            $(".x_donate").removeClass("active");
        }
        if (event.data.action == "hideLeaderboard") {
            $(".l-wrapper").css("display", "none");
            $("body").removeClass("opened");
        }
        if (event.data.action == "updateLeaderboard") {
            j_data_master = event.data.j_data_master;
            j_data_kills = event.data.j_data_kills;
            j_data_deaths = event.data.j_data_deaths;
            j_data_kdas = event.data.j_data_kdas;
            j_data_playtimes = event.data.j_data_playtimes;
            j_data_own_steam = event.data.j_data_own_steam;
            j_data = event.data.j_data;
            refreshleaderboard();
        }
        if (event.data.action == "updateCrewLeaderboard") {
            j_crewdata = event.data.j_crewdata;
            j_crew_master = event.data.j_crew_master;
            j_crew_kills = event.data.j_crew_kills;
            j_crew_members = event.data.j_crew_members;
            refreshcrewboard();
        }
    })
})

function closekda() {
    $.post("http://leaderboard/kdaclose");
}

function show_players() {
    $(".leaderboard_players").css("display", "block");
    $(".leaderboard_crews").css("display", "none");
    $(".napoveda").css("display", "none");
    $(".rules").css("display", "none");
    $(".donate").css("display", "none")
    $(".x_players").addClass("active");
    $(".x_crews").removeClass("active");
    $(".x_help").removeClass("active");
    $(".x_rules").removeClass("active");
    $(".x_donate").removeClass("active");
}

function show_crews() {
    $(".leaderboard_players").css("display", "none");
    $(".leaderboard_crews").css("display", "block");
    $(".napoveda").css("display", "none");
    $(".rules").css("display", "none");
    $(".donate").css("display", "none")
    $(".x_players").removeClass("active");
    $(".x_crews").addClass("active");
    $(".x_help").removeClass("active");
    $(".x_rules").removeClass("active");
    $(".x_donate").removeClass("active");
}

function show_help() {
    $(".leaderboard_players").css("display", "none");
    $(".leaderboard_crews").css("display", "none");
    $(".napoveda").css("display", "block");
    $(".rules").css("display", "none");
    $(".donate").css("display", "none")
    $(".x_players").removeClass("active");
    $(".x_crews").removeClass("active");
    $(".x_help").addClass("active");
    $(".x_rules").removeClass("active");
    $(".x_donate").removeClass("active");
}

function show_rules() {
    $(".leaderboard_players").css("display", "none");
    $(".leaderboard_crews").css("display", "none");
    $(".napoveda").css("display", "none");
    $(".donate").css("display", "none")
    $(".rules").css("display", "block");
    $(".x_players").removeClass("active");
    $(".x_crews").removeClass("active");
    $(".x_help").removeClass("active");
    $(".x_donate").removeClass("active");
    $(".x_rules").addClass("active");
}

function show_shop() {
    window.invokeNative('openUrl', 'https://morpofficial.tebex.io');
    $.post("http://leaderboard/kdaclose");
}

function open_roulette() {
    $.post("http://leaderboard/open_roulette");
    $.post("http://leaderboard/kdaclose");
}

function open_discord() {
    window.invokeNative('openUrl', 'https://discord.gg/4ah3GGkUrx');
    $.post("http://leaderboard/kdaclose");
}

function refreshcrewboard() {
    var sorttype = $("#ranksort_crews").val();
    if (sorttype == "byrank") {
        var leader_data_master = jQuery.parseJSON(j_crew_master);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_crewdata);

        $("#crews_list").html("");

        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }



            var out = '\
				<tr>\
					<td style="width: 10%; text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td style="width: 30%; text-align: left;"><span style="color: #d20228; font-weight: bold;">' + obj.k + '</span></td>\
					<td style="width: 15%; text-align: center;">' + leader_data[obj.k].kills + '</td>\
					<td style="width: 15%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + leader_data[obj.k].members + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#crews_list").append(out);
        });
    }
}

function refreshleaderboard() {
    var sorttype = $("#ranksort").val();
    if (sorttype == "bydeaths") {
        var leader_data_master = jQuery.parseJSON(j_data_deaths);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_data);

        $("#list").html("");

        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }

            kdr = (leader_data[obj.k].kda).toFixed(1);

            if (obj.k == j_data_own_steam) {
                $(".nickname").html(leader_data[obj.k].name);
                $(".myrank").html(position);
                $(".mypoints").html(leader_data[obj.k].score);
                $(".guildname").html(leader_data[obj.k].crew);
                $(".killed_count").html(leader_data[obj.k].kill);
                $(".kda_count").html(kdr);
                $(".deaths_count").html(leader_data[obj.k].death);
                $(".suicide_count").html(leader_data[obj.k].suicide);
                $(".deaths_world_count").html(leader_data[obj.k].death_random);
            }
            var out = '\
				<tr>\
					<td style="text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td><span style="color: #d20228; font-weight: bold;">' + leader_data[obj.k].name + '</span><br />\
						<small><strong><i class="far fa-clock"></i></strong> ' + leader_data[obj.k].playtime + '</small>\
					</td>\
					<td style="width: 20%; text-align: center;">\
					';

            if (leader_data[obj.k].crew !== "--") {
                out = out + '<strong style="color: #d20228;">' + leader_data[obj.k].crew + '</strong>';
            } else {
                out = out + '--';
            }

            out = out + '\
					</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].level + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].kill + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].death + '</td>\
					<td style="width: 8%; text-align: center;">' + kdr + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].suicide + '</td>\
					<td style="width: 8%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + score + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#list").append(out);
        });
    }

    if (sorttype == "byplaytimes") {
        var leader_data_master = jQuery.parseJSON(j_data_playtimes);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_data);

        $("#list").html("");

        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }

            kdr = (leader_data[obj.k].kda).toFixed(1);

            if (obj.k == j_data_own_steam) {
                $(".nickname").html(leader_data[obj.k].name);
                $(".myrank").html(position);
                $(".mypoints").html(leader_data[obj.k].score);
                $(".guildname").html(leader_data[obj.k].crew);
                $(".killed_count").html(leader_data[obj.k].kill);
                $(".kda_count").html(kdr);
                $(".deaths_count").html(leader_data[obj.k].death);
                $(".suicide_count").html(leader_data[obj.k].suicide);
                $(".deaths_world_count").html(leader_data[obj.k].death_random);
            }
            var out = '\
				<tr>\
					<td style="text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td><span style="color: #d20228; font-weight: bold;">' + leader_data[obj.k].name + '</span><br />\
						<small><strong><i class="far fa-clock"></i></strong> ' + leader_data[obj.k].playtime + '</small>\
					</td>\
					<td style="width: 20%; text-align: center;">\
					';

            if (leader_data[obj.k].crew !== "--") {
                out = out + '<strong style="color: #d20228;">' + leader_data[obj.k].crew + '</strong>';
            } else {
                out = out + '--';
            }

            out = out + '\
					</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].level + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].kill + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].death + '</td>\
					<td style="width: 8%; text-align: center;">' + kdr + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].suicide + '</td>\
					<td style="width: 8%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + score + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#list").append(out);
        });
    }
    if (sorttype == "bykdas") {
        var leader_data_master = jQuery.parseJSON(j_data_kdas);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_data);

        $("#list").html("");

        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }

            kdr = (leader_data[obj.k].kda).toFixed(1);

            if (obj.k == j_data_own_steam) {
                $(".nickname").html(leader_data[obj.k].name);
                $(".myrank").html(position);
                $(".mypoints").html(leader_data[obj.k].score);
                $(".guildname").html(leader_data[obj.k].crew);
                $(".killed_count").html(leader_data[obj.k].kill);
                $(".kda_count").html((leader_data[obj.k].kill).toFixed(1));
                $(".deaths_count").html(leader_data[obj.k].death);
                $(".suicide_count").html(leader_data[obj.k].suicide);
                $(".deaths_world_count").html(leader_data[obj.k].death_random);
            }
            var out = '\
				<tr>\
					<td style="text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td><span style="color: #d20228; font-weight: bold;">' + leader_data[obj.k].name + '</span><br />\
						<small><strong><i class="far fa-clock"></i></strong> ' + leader_data[obj.k].playtime + '</small>\
					</td>\
					<td style="width: 20%; text-align: center;">\
					';

            if (leader_data[obj.k].crew !== "--") {
                out = out + '<strong style="color: #d20228;">' + leader_data[obj.k].crew + '</strong>';
            } else {
                out = out + '--';
            }

            out = out + '\
					</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].level + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].kill + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].death + '</td>\
					<td style="width: 8%; text-align: center;">' + kdr + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].suicide + '</td>\
					<td style="width: 8%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + score + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#list").append(out);
        });
    }
    if (sorttype == "bykills") {
        var leader_data_master = jQuery.parseJSON(j_data_kills);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_data);

        $("#list").html("");
        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }

            kdr = (leader_data[obj.k].kda).toFixed(1);

            if (obj.k == j_data_own_steam) {
                $(".nickname").html(leader_data[obj.k].name);
                $(".myrank").html(position);
                $(".mypoints").html(leader_data[obj.k].score);
                $(".guildname").html(leader_data[obj.k].crew);
                $(".killed_count").html(leader_data[obj.k].kill);
                $(".kda_count").html(kdr);
                $(".deaths_count").html(leader_data[obj.k].death);
                $(".suicide_count").html(leader_data[obj.k].suicide);
                $(".deaths_world_count").html(leader_data[obj.k].death_random);
            }
            var out = '\
				<tr>\
					<td style="text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td><span style="color: #d20228; font-weight: bold;">' + leader_data[obj.k].name + '</span><br />\
						<small><strong><i class="far fa-clock"></i></strong> ' + leader_data[obj.k].playtime + '</small>\
					</td>\
					<td style="width: 20%; text-align: center;">\
					';

            if (leader_data[obj.k].crew !== "--") {
                out = out + '<strong style="color: #d20228;">' + leader_data[obj.k].crew + '</strong>';
            } else {
                out = out + '--';
            }

            out = out + '\
					</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].level + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].kill + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].death + '</td>\
					<td style="width: 8%; text-align: center;">' + kdr + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].suicide + '</td>\
					<td style="width: 8%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + score + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#list").append(out);
        });
    }

    if (sorttype == "byrank") {
        var leader_data_master = jQuery.parseJSON(j_data_master);

        var master_data = [];
        $.each(leader_data_master, function(key, value) {
            master_data.push({ v: value, k: key });
        });
        master_data.sort(function(a, b) {
            if (a.v > b.v) { return -1 }
            if (a.v < b.v) { return 1 }
            return 0;
        });

        var leader_data = jQuery.parseJSON(j_data);

        $("#list").html("");

        $.each(master_data, function(key, obj) {
            var position = key + 1;

            if (leader_data[obj.k].score < 0) {
                score = 0;
            } else {
                score = leader_data[obj.k].score;
            }

            kdr = (leader_data[obj.k].kda).toFixed(1);

            if (obj.k == j_data_own_steam) {
                $(".nickname").html(leader_data[obj.k].name);
                $(".myrank").html(position);
                $(".mypoints").html(leader_data[obj.k].score);
                $(".guildname").html(leader_data[obj.k].crew);
                $(".killed_count").html(leader_data[obj.k].kill);
                $(".kda_count").html(kdr);
                $(".deaths_count").html(leader_data[obj.k].death);
                $(".suicide_count").html(leader_data[obj.k].suicide);
                $(".deaths_world_count").html(leader_data[obj.k].death_random);
            }
            var out = '\
				<tr>\
					<td style="text-align: center;">\
						<div class="c-flag c-place u-bg--transparent u-text--dark  ';
            if (position == 1) { out = out + 'u-bg--yellow'; }
            if (position == 2) { out = out + 'u-bg--teal'; }
            if (position == 3) { out = out + 'u-bg--orange'; }
            out = out + '" ';
            if (position > 3) { out = out + ' style="color: #fff !important; "'; }
            out = out + '>' + position + '</div>\
					</td>\
					<td><span style="color: #d20228; font-weight: bold;">' + leader_data[obj.k].name + '</span><br />\
						<small><strong><i class="far fa-clock"></i></strong> ' + leader_data[obj.k].playtime + '</small>\
					</td>\
					<td style="width: 20%; text-align: center;">\
					';

            if (leader_data[obj.k].crew !== "--") {
                out = out + '<strong style="color: #d20228;">' + leader_data[obj.k].crew + '</strong>';
            } else {
                out = out + '--';
            }

            out = out + '\
					</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].level + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].kill + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].death + '</td>\
					<td style="width: 8%; text-align: center;">' + kdr + '</td>\
					<td style="width: 8%; text-align: center;">' + leader_data[obj.k].suicide + '</td>\
					<td style="width: 8%; text-align: center;">\
						<span class="';
            if (position == 1) { out = out + 'u-text--yellow'; }
            if (position == 2) { out = out + 'u-text--teal'; }
            if (position == 3) { out = out + 'u-text--orange'; }
            out = out + '">\
							<strong>' + score + '</strong>\
						</span>\
					</td>\
				</tr>\
			';
            $("#list").append(out);
        });
    }
}

document.onkeydown = function(evt) {
    evt = evt || window.event;
    var isEscape = false;
    if ("key" in evt) {
        isEscape = (evt.key === "Escape" || evt.key === "Esc");
    } else {
        isEscape = (evt.keyCode === 27);
    }
    if (isEscape) {
        $.post("http://leaderboard/kdaclose");
    }
};