// The below code is for Categories Show Page, /categories/1
// show pages have next and previous buttons that append with formulas for each category.

$(function(){
  $(".js-previous-category").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let id = $(".js-previous-category").attr("data-id")
    // get previous category
    $.get("/categories/" + id + "/previous", function(data) {
      // pass data to loadCategory
      loadCategory(data) 
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-next-category").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let id = $(".js-next-category").attr("data-id")
    // get next category
    $.get("/categories/" + id + "/next", function(data) {
      // pass data to loadCategory
      loadCategory(data)
    })
    event.preventDefault();
  })
})

function loadCategory(data) {
  // change the URL to the new route
  history.pushState({}, "", "/categories/" + data.id)

  // re-set the id to current on the buttons
  $(".js-next-category").attr("data-id", data["id"]);
  $(".js-previous-category").attr("data-id",data["id"]);

  // replace header with following category name
  $(".categoryName").text(data["name"]);

  // div where formulas go
  let categoryFormulaPage = $("#categoryFormulaPage") 

  // empty the div
  categoryFormulaPage.empty()

  // array of all formulas in the category
  let formulas = (data["formula_list"]) 

  // most recent created_at date is sorted first. (defined in applications.js)
  sortFormulaByDate(formulas)

  // iterate over each formula in the formula_list JSON object, and then insert back into categoryFormulaPage div.
  $.each (formulas, function(index, formula) {
    categoryFormulaPage.append(
      `<div class='categoryFormula col-lg-3'>
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

