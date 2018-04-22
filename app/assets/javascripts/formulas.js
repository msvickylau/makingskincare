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