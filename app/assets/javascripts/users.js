$(function() {
  $(".js-view-formulas").on("click", function(event) {
    var id = $(".js-view-formulas").attr("data-id"); //grab the user.id
    $.get("/users/" + id + ".json", function(data) {
      loadUserFormula(data); //load user.formulas
    })
    event.preventDefault();
  })
});

function loadUserFormula(data) {

  // console.log(data); 

  /// USERS FORMULAS DIV ///// 
  var formulas = data["formulas"]; //only gives the array of users formulas.
  
  formulas.sort(function(firstFormula, secondFormula) { //sort JS obkect array by date.
    firstDate = new Date(firstFormula.created_at); //Turn strings into dates
    secondDate = new Date(secondFormula.created_at);
    if (firstDate > secondDate) { //dates arranged from the most recent to the oldest
      return -1;
    } else if (firstDate < secondDate) {
      return 1;
    } 
    return 0;
  });

  // console.log((data["formulas"]))
  var usersFormulasDiv = $(".usersFormulas");

  //empty the div first
  usersFormulasDiv.empty();

  var userID = data["id"];
  var username = data["username"];


  //iterate over each formula in the formulas array JSON object, and then insert back into skinconcernFormulaPage div.
  $.each (formulas, function(formula) {
    // console.log(formula);   //prints the index of the users formula
    // console.log(username);
    // console.log(formula);   //prints the index of the formula in the formula_list
    // console.log(formulas[formula].id);
    // console.log(formulas[formula].title);
    // console.log(formulas[formula].description);
    // console.log(formulas[formula].image_file_name);
    // console.log(formulas[formula].image_url);
    // console.log(formulas[formula].updated_at);


    var savedDate = formulas[formula].created_at; //date as saved in DB
    var creationDate = new Date(savedDate); //created a new date object in JS
    var options = {month: 'short', day: 'numeric', year: 'numeric',  hour:'numeric', minute:'numeric', second:'numeric'}; //needed by toLocaleDateString, organizing date format
    var localDate = creationDate.toLocaleDateString('en-US', options); // returns: Apr 19, 2018 07:50:31 PM

    usersFormulasDiv.append(
      "<div class='row'>" +
        "<div class='col-sm-8'>" +
          "<h5><a href='/formulas/"+ formulas[formula].id + "'>" + formulas[formula].title + "</a></h5>" + 
            "<h6>By: <a href='/users/" + userID + "'>" + username +"</a>, Created on "+ localDate +"</h6>" +
          "<p class='text-muted'>"+formulas[formula].description+"</p>" +
        "</div>" +

        "<div class='col-sm-4'>" +
            "<a href='/formulas/"+ formulas[formula].id + "'>" +
              "<img src='"+formulas[formula].image_url+ "'>" +
            "</a>" +
        "</div>" +
      "</div><hr>"
    )
  });
}


