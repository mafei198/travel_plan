var planid = 522518;
var current = 'scenic';

var tipx	 = new iTipx();
var activity = new iActivity(current);
var hotel = new iHotel();

showDayMenu = function(id)
{
  $('#day_menu_' + id ).toggle();
} 

addActivity = function(dayid)
{ var x;
  x = $('#iframe').detach();
  $('#add_journey_'+dayid).append(x);
  $('#iframe').toggle();
  activity.dayid(dayid);
  $(document).ready(function(){
    url = $('#planed_citys_menu .blue').attr('href');
    if(typeof(url) != 'undefined'){
      $.get(url);
    }
  });
} 

function closeThis(id)
{
  $('#iframe').toggle();
} 

$(document).ready(function(){
    var url = $('#planed_citys_menu [href]:first').attr("href")
    if(typeof(url) != 'undefined'){
      $.get(url)
    }
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

