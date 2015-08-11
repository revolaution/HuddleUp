$(document).ready(function(){
  $("#user_location_id").change(function(){
  	$(".edit_user").submit();
  });

  $("#sport_new_date").change(function(){
  	$(".edit_sport").submit();
  });

  $('.collapsible').collapsible({
      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
});
