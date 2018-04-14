$(function(){
   $("#new_comment").on("submit", function(e){
     $.ajax({
       type: "POST",
       url: this.action,
       data: $(this).serialize(), // either JSON or querystring serializing
       success: function(response){
        //update the DOM
        var comment = new Comment(response);
        comment.renderComments();
        $(".commentBox").val("");
       }
     });

     e.preventDefault();
   })
 });




function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
}

Comment.prototype.renderComments = function() {
  var html = "" ;
  html += 
  "<div class=\'card' id=\'comment-\' + comment.id + '\'>" +
    "<div class=\'card-body'>" +
      "<h6 class=\'card-subtitle mb-2 text-muted'>Posted by: "  + this.user.username + "</h6>" + 
      "<p class=\'card-text'>" + this.content + "</p>"
    "</div>"
  "</div><br>";
  $("#submitted-comments").append(html);
}