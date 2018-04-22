function loadCategory(data) {
  // change the URL to the new route
  history.pushState({}, "", "/categories/" + data.id)

  // re-set the id to current on the link
  $(".js-next-category").attr("data-id", data["id"]);
  $(".js-previous-category").attr("data-id",data["id"]);

  $(".categoryName").text(data["name"]);


  ///// Formula page ///// 
  var formulas = (data["formula_list"])
  var categoryFormulaPage = $("#categoryFormulaPage")

  //empty the div first
  categoryFormulaPage.empty()

  //iterate over each formula in the formula_list JSON object, and then insert back into categoryFormulaPage div.
  $.each (formulas, function(formula) {
    
    categoryFormulaPage.append(
      "<div class='categoryFormula col-lg-3'>" +
        "<div class='card border-light' style='max-width: 15rem; min-width: 15rem;'>" +
          "<div class='card-body'>" +
          "<h5 class='formulaTitle'><a href='/formulas/" + (formulas[formula].id) + "'>" + (formulas[formula].title) + "</a> </h5>" +
          "<h6 class='formulaUserName'>By: " + (formulas[formula].user.username) + "</h6>" +

          "<span class='formulaImage'>" +
            "<a href='/formulas/" + (formulas[formula].id) +"'>" +
              "<img src='"+ (formulas[formula].image_url)+ "' alt='" +(formulas[formula].image_url)+"'>" +
            "</a>" +
          "</span>" +
        
          "</div>" +
        "</div><br>" +
      "</div>"
    )
  })
}

$(function(){
  $(".js-previous-category").on("click", function (e) {
    // get the id from the data-id attribute (current id and go to previous)
    var id = $(".js-previous-category").attr("data-id")
    $.get("/categories/" + id + "/previous", function(data) {
      loadCategory(data) //loads categories previous data
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-next-category").on("click", function (e) {
    var id = $(".js-next-category").attr("data-id")
    $.get("/categories/" + id + "/next", function(data) {
      loadCategory(data) //loads categories next data
    })
    event.preventDefault();
  })
})