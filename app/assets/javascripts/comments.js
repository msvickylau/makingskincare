// The below code is for comments on formulas show page, /formulas/#
// "Create Comment" button creates a new comment object, saves and appends back into the DOM

$(function(){
  // on submit of form class="new_comment"
  $("#new_comment").on("submit", function(event) {
  
    $.ajax({
      type: "POST",
      url: this.action, // this refers to whatever triggered the action === [object HTMLFormElement]
      data: $(this).serialize(), // takes our form data and serializes it
      success: function(response) {
        // on success, update the DOM with response in the form of data
        var comment = new Comment(response);
        comment.renderComments();
        $(".commentBox").val("");
      }
    });
    event.preventDefault();
  })
});

// a new comment's response is passed as data and attributes are set to 'this'.
function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
};

// this method appends html to the div id="submitted-comments"
Comment.prototype.renderComments = function() {
  var html = "" ;
  html += 
  "<br>" +
  "<div class=\'card' id=\'comment-" + this.id + "'>" +
    "<div class=\'card-body'>" +
      "<h6 class=\'card-subtitle mb-2 text-muted'>Posted by: "  + 
        "<a href='/users/" + this.user.id + "'>" + this.user.username + "</a>" + 
      "</h6>" + 
      "<p class=\'card-text'>" + this.content + "</p>"
    "</div>"
  "</div>";

  $("#submitted-comments").append(html);
};
