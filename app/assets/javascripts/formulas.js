//Formula Index Page, show description link is replaced with formulas descripion on click.
$(function() {
  $(".formula").on('click', '.js-more', function(event) {
    var id = this.dataset.id;
    $.get("/formulas/" + id + ".json", function(data) {
      // replace "see descriptions" link with description in div formula-card-body
      $("#description-" + id).text(data.description);
    })
    event.preventDefault();
  })
});

//Formula Form
function addIngredientField() {
  //create date object
  var date = new Date();

  //get number of milliseconds since midnight Jan 1, 1970  
  //and use it for address key 
  var mSec = date.getTime();

  //Replace 0 with milliseconds 
  idAttributeIngredient = 
   "formula_ingredients_attributes_0_name".replace("0", mSec);
  nameAttributeIngredient = 
    "formula[ingredients_attributes][0][name]".replace("0", mSec);
           
  //create <li> tag  
  var li = document.createElement("li");

  var inputIngredient = document.createElement("input");
  inputIngredient.setAttribute("size", "47");
  inputIngredient.setAttribute("type", "text");
  inputIngredient.setAttribute("name", nameAttributeIngredient);
  inputIngredient.setAttribute("id", idAttributeIngredient);

  li.appendChild(inputIngredient);

  //add created <li> element with its child elements 
  //(label and input) to myList (<ul>) element
  document.getElementById("ingredientsList").appendChild(li);

}