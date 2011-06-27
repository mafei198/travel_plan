var planid = 522518;
var current = 'scenic';

var tipx	 = new iTipx();
var activity = new iActivity(current);
var hotel = new iHotel();
var plan = new iPlan()

showDayMenu = function(id)
{
  $('#day_menu_' + id ).toggle();
} 

addActivity = function(schedule_id)
{ var x;
  x = $('#iframe').detach();
  $('#add_journey_'+schedule_id).append(x);
  $('#iframe').toggle();
  activity.schedule_id(schedule_id);
  $(document).ready(function(){
    var url = $('#planed_citys_menu [href]:first').attr("href");
    if(typeof(url) != 'undefined'){
      $.get(url);
    }
  });
} 

function closeThis(id)
{
  $('#iframe').toggle();
} 
$(function(){
  $("#navPlanMenu li").click(function(){
    var one = $("#navPlanMenu .current").attr('key');

    $("#navPlanMenu li").removeClass('current');
    $(this).addClass('current');
    var type = $(this).attr('key');

    $('#'+one).hide();
    $('#'+type).show();
  });
});

$(function(){

  $("#navMenu li").click(function(){

    $("#navMenu li").removeClass('current');
    $(this).addClass('current');

    $("div.box").hide();

    var type = $(this).attr('key');
    var box = '#box_' + type;

    current = type;

    activity.clear();
    activity.type(type);

    $(box).show();

    switch(type)
  {
    case 'restaurant':
    case 'ent':
    case 'other':
      activity.addex();
      break;
    default:
      activity.cancel();
      break;
  }

  });

  $('#menu_scenic').click();


});

