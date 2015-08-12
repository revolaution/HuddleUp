$(document).ready(function(){

  $("#sport_new_date").change(function(){
  	$(".edit_sport").submit();
  });

  $('.collapsible').collapsible({
      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
});
