// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// sorts formula by date, most recent created_at date is sorted first.
function sortFormulaByDate(formulas) {
  //sort JS object array by date.
  formulas.sort(function(firstFormula, secondFormula) { 
    //Turn strings into dates
    firstDate = new Date(firstFormula.created_at); 
    secondDate = new Date(secondFormula.created_at);
    //dates arranged from the most recent to the oldest
    if (firstDate > secondDate) { 
      return -1;
    } else if (firstDate < secondDate) {
      return 1;
    } 
    return 0;
  });
}