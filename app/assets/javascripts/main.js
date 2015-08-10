// $(function(){

// 	$("#autocomplete").blur(function(){
// 		console.log($(".pac-container"));
// 		$(".map-preview").remove()
// 		$(".new_game").after("<iframe class = 'map-preview' width='600' height='450' frameborder='0' style='border:0' src='https://www.google.com/maps/embed/v1/place?q=" + $("#autocomplete").val() + "&key=AIzaSyDbNOAeojdGmUSaW8f3vaIpHlvx_Hgerck' allowfullscreen></iframe>")
// 	});

// 	$(".pac-container").on("click", ".pac-item", function(){
// 		console.log($(".pac-container"));
// 		$(".map-preview").remove()
// 		debugger;
// 		$(".new_game").after("<iframe class = 'map-preview' width='600' height='450' frameborder='0' style='border:0' src='https://www.google.com/maps/embed/v1/place?q=" + $("#autocomplete").val() + "&key=AIzaSyDbNOAeojdGmUSaW8f3vaIpHlvx_Hgerck' allowfullscreen></iframe>")
// 	});
// });
var map;
function initialize() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: 8,
    center: {lat: -34.397, lng: 150.644}
  });
}

google.maps.event.addDomListener(window, 'load', initialize);