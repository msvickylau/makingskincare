// Submit Comments via AJAX

function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
}



$(function(){
  $("form#new_comment").on("submit", function(e){
    // 1. we need the URL to submit the POST request to
    // 2. we need the form data.

    url = this.action
    console.log(url)
 
debugger

    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize(),
      success: function(response){
        debugger
      }
    })

    
    

    // Send a POST request to the correct plaec that form would have gone to...
    //along with the actual form data.
    e.preventDefault();
    
  })
});

