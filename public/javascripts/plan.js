// JavaScript Document
function copyUrl(text)
{
  if(!$.browser.msie)
  {
    alert('此功能仅支持IE浏览器');
    return false;
  }
  window.clipboardData.setData("Text", text);
  alert("已复制到剪贴板！使用Ctrl+V贴到你需要的地方！");
}
function printDay(id)
{
  window.location.href = '/plan/iprint_day/' + id + '/';
}
function duplicatePlan(id)
{
  if(confirm('确定要复制这份旅行计划吗？（此操作需要10颗绿豆！）')){
    $.getJSON("/index.php?act=plan.duplicate_json&id=" + id,function(data){
      if(data.error)
    {
      alert(data.error);
    }
      else
    {
      alert('复制成功!');
      window.location.href = '/myplan/' + data.planid + '/';
    }
    });
  }
}
function delPlan(id)
{
  if(confirm('确定删除这个旅行计划吗？')){
    $.getJSON("/index.php?act=plan.del_json&id=" + id,function(data){
      if(data.error)
    {
      alert(data.error);
    }
      else
    {
      alert('删除成功!');
      window.location.href = '/home/';
    }
    });
  }
}
function recyclePlan(id)
{
  if(confirm('确定把这个旅行计划放入回收站吗？')){
    $.getJSON("/index.php?act=plan.recycle_json&id=" + id,function(data){
      if(data.error)
    {
      alert(data.error);
    }
      else
    {
      alert('操作成功!');
      window.location.href = '/home/';
    }
    });
  }
}
function iPlan()
{
  this.addDay = function(id)
  {
    $('iframe.iframe_add_activity').hide();
    $.getJSON("/index.php?act=plan.day_save&planid=" + id,function(data){
      if(data.success)
    {
      //$(data.content).appendTo('#days');
      window.location.reload();
    }
      else
    {
      alert(data.error);
    }
    });
  }
  this.delDay = function(schedule_id)
  {
    $('#day_menu_' + schedule_id ).toggle();
    if(confirm('您确定要删除这天的日程吗？（请谨慎操作）')){
      $.getJSON("/index.php?act=plan.day_del&schedule_id=" + schedule_id,function(data){
        if(data.success)
      {
        window.location.reload();
      }
        else
      {
        alert(data.error);
      }
      });
    }
  }
  this.delActivity = function(id)
  {
    $('#activity_menu_' + id ).hide();
    if(confirm('确定删除这条日程吗？')){
      $.getJSON("/journeys/destroy?id=" + id,function(data){
        if(data.success)
      {
        //$('#activity_' + id ).slideUp();
        window.location.reload();
      }
        else
      {
        alert(data.error);
      }
      });
    }
  }
  this.showActivityEdit = function(id)
  {
    $('#activity_menu_' + id ).hide();
    $('#activity_act_' + id ).hide();
    $('#activity_status_' + id ).show();
    var url = '/index.php?act=plan.activity_edit_in&id=' + id;
    var s = $('#activity_show_' + id);
    var e = $('#activity_edit_' + id);
    $(e).load(url,function(data){
      $(s).slideUp(300,function(){
        $(e).slideDown(300);
      });
    });
  }
  this.saveActivity = function(id)
  {
    url = '/index.php?act=plan.activity_update_json';
    $('#_edit_buttons').hide();
    $('#_edit_saveing').show();
    $.post(url, $("#frmEdit_" + id).serialize(),function(data){
      if(data.error)
    {
      $('#_edit_buttons').show();
      $('#_edit_saveing').hide();
      alert(data.error);
      return false;
    }
      else
    {
      var s = $('#activity_show_' + id);
      var e = $('#activity_edit_' + id);
      $(s).html(data.content);
      $('#day_costs_' + data.schedule_id,parent.document).html(data.costs);
      $('#day_costs_header_' + data.schedule_id,parent.document).html(data.costs);
      $('#activity_status_' + id ).hide();
      $('#activity_act_' + id ).show();
      $(e).slideUp(300,function(){
        $(e).html('')
        $(s).slideDown(300);
      });
    }
    }, "json");
  }
  this.cancelActivityEdit = function(id)
  {
    var s = $('#activity_show_' + id);
    var e = $('#activity_edit_' + id);
    $('#activity_status_' + id ).hide();
    $('#activity_act_' + id ).show();
    $(e).slideUp(300,function(){
      $(e).html('')
      $(s).slideDown(300);
    });
  }
  this.uploadImage = function(id)
  {
    $('#activity_menu_' + id ).hide();
    alert('此功能即将推出...');
  }
  this.showDayMenu = function(id)
  {
    $('#day_menu_' + id ).toggle();
  }
  this.showActivityMenu = function(id)
  {
    $('#activity_menu_' + id ).toggle();
  }
  //移动到第几天目录 BY QINIAO
  this.showMoveMenu = function(id)
  {
    $('#move_menu_' + id ).toggle();
  }
  //移动到第几天 BY QINIAO
  this.moveSelectDay = function(fromscheduleid,toscheduleid,orderid,activityid)
  {
    if(confirm('您确定要移动到第'+orderid+'天吗？')){
      $.getJSON("/index.php?act=plan.moveselectday&fromscheduleid=" + fromscheduleid + "&toscheduleid=" + toscheduleid + "&activityid="+activityid,function(data){
        if(data.success)
      {
        window.location.reload();
      }
        else
      {
        alert(data.error);
      }
      });
    }
  }

  this.moveActivityUp = function(id)
  {
    $('#activity_menu_' + id ).hide();
    $('#activity_act_' + id ).hide();
    $('#activity_status_' + id ).show();
    $.getJSON("/journeys/up?id=" + id,function(data){
        if(data.success)
        {
        $('#activity_' + id ).insertBefore($('#activity_' + data.swapid));
        $('#activity_status_' + id ).hide();
        $('#activity_act_' + id ).show();
        }
        else
        {
        $('#activity_status_' + id ).hide();
        $('#activity_act_' + id ).show();
        //alert(data.error);
        }
        });
  } 

  this.moveActivityDown = function(id)
  {
    $('#activity_menu_' + id ).hide();
    $('#activity_act_' + id ).hide();
    $('#activity_status_' + id ).show();
    $.getJSON("/journeys/down?id=" + id,function(data){
        if(data.success)
        {
        $('#activity_' + id ).insertAfter($('#activity_' + data.swapid));
        $('#activity_status_' + id ).hide();
        $('#activity_act_' + id ).show();
        }
        else
        {
        $('#activity_status_' + id ).hide();
        $('#activity_act_' + id ).show();
        //alert(data.error);
        }
        });
  } 

  this.moveScheduleUp = function(id)
  {
    $('#day_menu_' + id ).hide();
    $('#day_act_' + id ).hide();
    $('#activity_status_' + id ).show();
    $.getJSON("/schedules/up?id=" + id,function(data){
      if(data.success)
    {
      var temp;
      $('#schedule_' + id ).insertBefore($('#schedule_' + data.swapid));
      //交换天数
      temp = $('#day_count_' + id).text();

      $('#day_count_' + id ).text($('#day_count_' + data.swapid).text());
      $('#day_count_' + data.swapid).text(temp)
      //交换日期
      temp = $('#date_' + id).text();
      $('#date_' + id).text($('#date_' + data.swapid).text())
      $('#date_' + data.swapid).text(temp)

      $('#activity_status_' + id ).hide();
      $('#day_act_' + id ).show();
    }
      else
    {
      $('#activity_status_' + id ).hide();
      $('#day_act_' + id ).show();
      //alert(data.error);
    }
    });
  } 

  this.moveScheduleDown = function(id)
  {
    $('#day_menu_' + id ).hide();
    $('#day_act_' + id ).hide();
    $('#activity_status_' + id ).show();
    $.getJSON("/schedules/down?id=" + id,function(data){
      if(data.success)
    {
      $('#schedule_' + id ).insertAfter($('#schedule_' + data.swapid));
      //交换天数
      temp = $('#day_count_' + id).text();
      $('#day_count_' + id ).text($('#day_count_' + data.swapid).text());
      $('#day_count_' + data.swapid).text(temp)
      //交换日期
      temp = $('#date_' + id).text();
      $('#date_' + id).text($('#date_' + data.swapid).text())
      $('#date_' + data.swapid).text(temp)
      $('#activity_status_' + id ).hide();
      $('#day_act_' + id ).show();
    }
      else
    {
      $('#activity_status_' + id ).hide();
      $('#day_act_' + id ).show();
      //alert(data.error);
    }
    });
  } 
}

