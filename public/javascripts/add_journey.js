var planid = 522518;
var current = 'scenic';

var tipx	 = new iTipx();
var activity = new iActivity(current);
var hotel = new iHotel();

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
