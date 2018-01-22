$(document).ready(function() {
   attachListeners();

});


function attachListeners() {
  //
  // $('td').on("click",function(){
  //   doTurn(this)
  // })

  $('button#getCourses').on("click",() => showCourses());

}

function showCourses() {

    $.get('/courses').done(function(data) {
      // let gamesLinks = $("#games")[0].innerHTML;
      let games = data["data"];
      if (games.length > 0)
      {$("#games")[0].innerHTML = "";
      games.forEach(function(element) {$("#games")[0].innerHTML += `<button id="game-${element["id"]}">Game ${element["id"]}</button></br>`})};
      $('button[id^="game"]').on("click", function() {showGame(this)});
}
