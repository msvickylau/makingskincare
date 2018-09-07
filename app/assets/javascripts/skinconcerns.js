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

  // header
  if (data.id === 0) { // formulas without a skinconcern tag saves with id of 0
    skinconcernTitle.append("<h4 style='text-align: center;'>The below formulas don't have a skinconcern tag:</h4>")
  } else { // append header with the following skinconcern name
    skinconcernTitle.append(
      "<h2 style='text-align: center;'>All formulas for skin concern:</h2>"+
      "<h1 style='text-align: center;''><large class='skinconcernName text-primary'>"+ (data["name"]) + "</large></h1>"
    )
  }

  // div where formulas go
  let skinconcernFormulaPage = $("#skinconcernFormulaPage")

  // empty the div
  skinconcernFormulaPage.empty()

  // array of all formulas in the skinconcern
  let formulas = (data["formula_list"])
  
  // most recent created_at date is sorted first. (defined in applications.js)
  sortFormulaByDate(formulas)

  //iterate over each formula in the formula_list JSON object, and then insert back into skinconcernFormulaPage div.
  $.each (formulas, function(index, formula) {    
    skinconcernFormulaPage.append(
      `<div class='skinconcernFormula col-lg-3'>
        <div class='card border-light' style='max-width: 15rem; min-width: 15rem;'>
          <div class='card-body'>
          <h5 class='formulaTitle'><a href='/formulas/${formula.id}'>${formula.title}</a> </h5>
          <h6 class='formulaUserName'>By: ${formula.user.username}</h6>

          <span class='formulaImage'>
            <a href='/formulas/${formula.id}'>
              <img src='${formula.image_url}' alt='${formula.image_file_name}'>
            </a>
          </span>
        
          </div>
        </div><br>
      </div>`
    )
  })
}
