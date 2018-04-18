function loadDestination(data) {
  history.pushState({}, "", "/skinconcerns/" + data.id)
}

$(function(){
  $(".js-previous-skinconcern").on("click", function (e) {
    var id = $(".js-previous-skinconcern").attr("data-id")
    $.get("/skinconcerns/" + id + "/previous", function(data) {
      console.log(data)
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-next-skinconcern").on("click", function (e) {
    var id = $(".js-next-skinconcern").attr("data-id")
    $.get("/skinconcerns/" + id + "/next", function(data) {
      console.log(data)
    })
    event.preventDefault();
  })
})
