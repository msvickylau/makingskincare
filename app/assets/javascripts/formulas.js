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
$(document).ready(function(){
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

  $('#addNewIngredient').click(function(){
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
    
$("div#ingredientsSet").on('click', '.removeIngredient', function(){
  //closest goes up thru the DOM, looking for the first ancestor with the class ingredientsForm
  $(this).closest('.ingredientsForm').remove(); 
  console.log(this)
});
});
