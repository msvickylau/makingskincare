// The below code is for Skinconcerns Show Page, /skinconcerns/1
// show pages have next and previous buttons that append with formulas for each skinconcern.

$(function(){
  $(".js-previous-skinconcern").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    const id = $(".js-previous-skinconcern").attr("data-id")
    // get previous skinconcern
    $.get("/skinconcerns/" + id + "/previous", function(data) {
      // pass data to loadSkinconcern
      loadSkinconcern(data)
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-next-skinconcern").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    const id = $(".js-next-skinconcern").attr("data-id")
    // get next skinconcern
    $.get("/skinconcerns/" + id + "/next", function(data) {
      // pass data to loadSkinconcern
      loadSkinconcern(data)
    })
    event.preventDefault();
  })
})

function loadSkinconcern(data) {
  // change the URL to the new route
  history.pushState({}, "", "/skinconcerns/" + data.id)

  // re-set the id to current on the buttons
  $(".js-next-skinconcern").attr("data-id", data["id"]);
  $(".js-previous-skinconcern").attr("data-id",data["id"]);

  // set skinconcernTitle to its div and then empty current on page.
  let skinconcernTitle = $("#skinconcernTitle")
  skinconcernTitle.empty()

  // div where formulas go
  let skinconcernFormulaPage = $("#skinconcernFormulaPage")
  skinconcernFormulaPage.empty()

  // array of all formulas in the skinconcern
  let formulas = (data["formula_list"])

  let formulaWithoutTag = []
  let formulaWithTag = []

  //iterate though each formula, if skinconcern_ids === 1, it has no tags. We meed this because checkboxes always saves an empty "".
  $.each (formulas, function(index, formula) {
    if (formula.skinconcern_ids.length === 1) {
      formulaWithoutTag.push(formula);
    } else {
      formulaWithTag.push(formula);
    }
  })

  if (data.id === 1) { // id 1 for formulas with no skinconcern tags
    skinconcernTitle.append("<h4 style='text-align: center;'>All formulas without a skinconcern tag:</h4>")
    for (i=0; i<formulaWithoutTag.length; i++){
      let formula = formulaWithoutTag[i]
      appendSkinconern(formula)
    }
  } else { // append header with the skinconcern name and formulas
    skinconcernTitle.append("<h2 style='text-align: center;'>All formulas for skin concern:</h2><h1 style='text-align: center;''><large class='skinconcernName text-primary'>"+ (data["name"]) + "</large></h1>")
    for (i=0; i<formulaWithTag.length; i++){
      let formula = formulaWithTag[i]
      appendSkinconern(formula)
    }
  }

  function appendSkinconern(formula){
    skinconcernFormulaPage.append(
      `<div class='card border-light' style='max-width: 15rem; min-width: 15rem;  margin: 1rem;'>
        <div class='skinconcernFormula card-body'>
        <h5 class='formulaTitle'><a href='/formulas/${formula.id}'>${formula.title}</a> </h5>
        <h6 class='formulaUserName'>By: ${formula.user.username}</h6>
        <span class='formulaImage'>
          <a href='/formulas/${formula.id}'>
            <img src='${formula.image_url}' alt='${formula.image_file_name}'>
          </a>
        </span>
        </div>
      </div>`
    )
  }
}
