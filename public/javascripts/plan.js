showDayMenu = function(id)
{
  $('#day_menu_' + id ).toggle();
} 

addActivity = function(dayid)
{ var x;
  x = $('#iframe').detach();
  $('#add_journey_'+dayid).append(x);
  $('#iframe').toggle();
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

