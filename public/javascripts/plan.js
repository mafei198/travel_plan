showDayMenu = function(id)
{
  $('#day_menu_' + id ).toggle();
} 

addActivity = function(dayid)
{ var x;
  x = $('#iframe').detach();
  $('#add_journey_'+dayid).append(x);
  $('#iframe').toggle();
} 

function closeThis(id)
{
  $('#iframe').toggle();
} 

