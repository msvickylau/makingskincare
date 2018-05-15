// The below code is for User's Show Page, /users
// "View Formulas" button appends the user's formulas to the page

$(function() {
  // when view formulas button is clicked
  $(".js-view-formulas").on("click", function(event) {
    // id is assigned to data-id of 'View Formulas' button, which is === to @user.id 
    let id = $(".js-view-formulas").attr("data-id"); 

    $.get("/users/" + id + ".json", function(data) {
      // pass data to loadUserFormula
      loadUserFormula(data);
    })
    event.preventDefault();
  })
});

function loadUserFormula(data) {
  // only gives the array of users formulas.
  let formulas = data["formulas"]; 

  //sorts formula by date, most recent created_at date is sorted first. (defined in applications.js)
  sortFormulaByDate(formulas)

  // set the div in DOM to variable usersFormulasDiv
  let usersFormulasDiv = $(".usersFormulas");

  // empty the div first
  usersFormulasDiv.empty();

  // set json to variables
  let userID = data["id"];
  let username = data["username"];

  // iterate over each formula in the formulas array
  $.each (formulas, function(index, formula) { 
    // this is the date as saved in DB, returned in JSON
    let savedDate = formula.created_at; 

    // here we create a new date object in JS
    let creationDate = new Date(savedDate);

    // options is needed by toLocaleDateString. This formats the created at date for each formula
    let options = {month: 'short', day: 'numeric', year: 'numeric',  hour:'numeric', minute:'numeric', second:'numeric'};

    // This returns date in the format of: Apr 19, 2018 07:50:31 PM
    let localDate = creationDate.toLocaleDateString('en-US', options); 

    // here we append the html with formulas info and the localDate which is a result of the new JS Date object
    usersFormulasDiv.append(
      `<div class='row'>
        <div class='col-sm-8'>
          <h5><a href='/formulas/${formula.id}'>${formula.title}</a></h5>
          <h6>By: <a href='/users/${userID}'>${username}</a>, Created on ${localDate}</h6>
          <p class='text-muted'>${formula.description}</p>
        </div>

        <div class='col-sm-4'>
          <a href='/formulas/${formula.id}'>
            <img src='${formula.image_url}' alt='${formula.image_file_name}'>
          </a>
        </div>
      </div>
      <hr>`
    )
  });
}