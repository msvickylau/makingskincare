$(function(){
  $("#new_comment").on("submit", function(e) {
    $.ajax({
      type: "POST",
      url: this.action, // this refers to whatever triggered the action
      data: $(this).serialize(), // takes our form data and serializes it
      success: function(response) {
        //update the DOM
        var comment = new Comment(response);
        comment.renderComments();
        $(".commentBox").val("");
      };
    });
    e.preventDefault();
  })
});

function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
};

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
