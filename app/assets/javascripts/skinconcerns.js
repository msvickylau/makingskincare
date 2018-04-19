function loadSkinconcern(data) {
  // change the URL to the new route
  history.pushState({}, "", "/skinconcerns/" + data.id)

  // re-set the id to current on the link
  $(".js-next-skinconcern").attr("data-id", data["id"]);
  $(".js-previous-skinconcern").attr("data-id",data["id"]);

  ///// TITLE ///// 
  ///// set skinconcernTitle to it's div and then empty current on page.
  var skinconcernTitle = $("#skinconcernTitle")
  skinconcernTitle.empty()
  // formulas without a skinconcern tag save with id of 0
  if (data.id === 0) {
    skinconcernTitle.append("<h4 style='text-align: center;'>The below formulas don't have a skinconcern tag:</h4>")
  } else {
    skinconcernTitle.append(
      "<h2 style='text-align: center;'>All formulas for skin concern:</h2>"+
      "<h1 style='text-align: center;''><large class='skinconcernName text-primary'>"+ (data["name"]) + "</large></h1>"
    )
  }

  ///// Formula page ///// 
  var formulas = (data["formula_list"])
  var skinconcernFormulaPage = $("#skinconcernFormulaPage")

  //empty the div first
  skinconcernFormulaPage.empty()

  //iterate over each formula in the formula_list JSON object, and then insert back into skinconcernFormulaPage div.
  $.each (formulas, function(formula) {
    // console.log(formula);   //prints the index of the formula in the formula_list
    // console.log(formulas[formula].id);
    // console.log(formulas[formula].title);
    // console.log(formulas[formula].user.username);
    // console.log(formulas[formula].image_file_name);
    // console.log(formulas[formula].image_url);
    
    skinconcernFormulaPage.append(
      "<div class='skinconcernFormula col-lg-3'>" +
        "<div class='card border-light' style='max-width: 16rem; min-width: 15rem;'>" +
          "<div class='skinconcernFormula card-body'>" +
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
  $(".js-previous-skinconcern").on("click", function (e) {
    // get the id from the data-id attribute (current id and go to previous)
    var id = $(".js-previous-skinconcern").attr("data-id")
    $.get("/skinconcerns/" + id + "/previous", function(data) {
      loadSkinconcern(data) //loads skinconcerns previous data
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-next-skinconcern").on("click", function (e) {
    var id = $(".js-next-skinconcern").attr("data-id")
    $.get("/skinconcerns/" + id + "/next", function(data) {
      loadSkinconcern(data) //loads skinconcerns next data
    })
    event.preventDefault();
  })
})