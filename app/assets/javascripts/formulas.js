// The below code is for Formulas Index Page, /formulas
// "show description" link is replaced with formulas descripion on click.

$(function() {
  // in the formula div, when you click on .js-more ("see description" link)
  $(".formula").on('click', '.js-more', function(event) {
    // this.dataset.id; grabs data-id of 'see descriptions' link, which is === formula.id
    var id = this.dataset.id;

    $.get("/formulas/" + id + ".json", function(data) {
      // replace div of id="description-#", "see descriptions" link with formula's description
      $("#description-" + id).text(data.description);
    })
    event.preventDefault();
  })
});

// The below code is for Formulas Form Page, /formulas/#/new and /formulas/#/edit
// 'Add Ingredient' button adds a new ingredient input feild
// 'x' button removes ingredient input field
$(document).ready(function(){
  // when 'Add Ingredient' button is clicked:
  $('#addNewIngredient').click(function(){

    // create date object
    var date = new Date();

    // get number of milliseconds since midnight Jan 1, 1970, and use it for ingredients key 
    var mSec = date.getTime();

    // Replace 0 with milliseconds 
    idAttributeIngredient = "formula_ingredients_attributes_0_name".replace("0", mSec);
    nameAttributeIngredient = "formula[ingredients_attributes][0][name]".replace("0", mSec);

    // append input feild with unique ingredient attributes in div ingredientsSet
    $('div#ingredientsSet').append(
      "<div class='ingredientsForm input-group mb-3'>" +
        "<input class='form-control' type='text' name='"+ nameAttributeIngredient+"' id='"+idAttributeIngredient+"'>" +
        "<div class='input-group-append'>" +
          "<span class='input-group-text'>" +
            "<button type='button' class='removeIngredient close'> ×</button>" +
          "</span>" +
        "</div>" +
      "</div>"
    );
  });
  
  // when button class of .removeIngredient 'x' button is clicked in div of ingredientSet
  $("div#ingredientsSet").on('click', '.removeIngredient', function(){
    // 'this' is the 'x' button
    // 'closest' goes up thru the DOM, looking for the first ancestor with the div of class ingredientsForm
    // .remove() takes removes it from the DOM
    $(this).closest('.ingredientsForm').remove(); 
  });
});
