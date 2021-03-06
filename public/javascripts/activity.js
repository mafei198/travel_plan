// JavaScript Document
//document.domain = 'lvren.cn';
function iTipx(name)
{
  this._id = '#' + name;
  this.show = function(text){
    $(this._id).html(text).fadeIn();
    setTimeout('tipx.hide();',3000);
  }
  this.hide = function(){
    $(this._id).fadeOut();
  }
}
function iActivity(type)
{
  this._type = type;
  this._header = '#' + type + '_header';
  this._details = '#' + type + '_details';
  this._home = '#' + type + '_home';
  this._data = '#' + type + '_data';
  this._add = '#' + type + '_add';
  this.type = function(type)
  {
    this._type = type;
    this._header = '#' + type + '_header';
    this._home = '#' + type + '_home';
    this._data = '#' + type + '_data';
    this._add = '#' + type + '_add';
    this._details = '#' + type + '_details';
  }
  this.schedule_id = function(schedule_id)
  {
    this._schedule_id = schedule_id
  }
  this.showtype = function()
  {
    alert(this._type + "\r\n" + this._header + "\r\n" + this._home + "\r\n" + this._data + "\r\n" + this._add + "\r\n" + this._details);
  }
  this.save = function ()
  {
    var type = this._type;
    var url = '/journeys';
    //showLoading();
    $('#link_type').val(this._type);
    $('#schedule_id').val(this._schedule_id);
    $.post(url, $("#frmAdd").serialize(),function(data){
      if(data.error)
    {
      alert(data.error);
      return false;
    }
      else
    {
      //更新父框架的内容
      $('#day_' + data.schedule_id,parent.document).html(data.content);
      $('#day_costs_' + data.schedule_id,parent.document).html(data.costs);
      $('#day_costs_header_' + data.schedule_id,parent.document).html(data.costs);
      $('#planed_citys_menu').html(data.planed_citys);
      //显示提示信息
      //tipx.show('添加成功!');
    }
    //hideLoading();
    $('#' + type + '_add').hide();
    $('#' + type + '_header').show();
    $('#' + type + '_home').show();
    $('#' + type + '_data').show();
    }, "json");
  }
  this.add = function(id)
  {
    var type = this._type;
    switch(type)
    {
      case 'scenic':
        var url = '/attractions/info?id=' + id;
        break;
      case 'hotel':
        var url = '/index.php?act=plan.getHotel&id=' + id;
        break;
      case 'flight':
        var url = '/index.php?act=plan.getFlight&id=' + id;
        break;
      case 'train':
        var url = '/index.php?act=plan.get_train&code=' + encodeURI(id);
        break;
      default:
        var url = false;
        break;
    }
    showLoading();
    if(!url)
    {
      alert('-LOST TYPE-');
      return false;
    }
    $.getJSON(url, function(data){
      if(data.error)
    {
      alert(data.error);
      return false;
    }
      else
    {
      hideLoading();
      //此处为jquery回调，回调中是不能支持this.show函数的
      //alert(this._type + "\r\n" + this._header + "\r\n" + this._homebox + "\r\n" + this._databox + "\r\n" + this._addbox + "\r\n" + this._details);
      //设置默认值
      $('#name').val(data.name);
      $('#costs').val(data.price);
      $('#description').val(data.description);
      $('#link_id').val(data.link_id);
      if(typeof(data.starts) != 'undefined') $('#starts').val(data.starts);
      if(typeof(data.ends) != 'undefined') $('#ends').val(data.ends);
      $('#addActivity').insertBefore($('#' + type + '_details')).show();
      //$('#' + type + '_details').html(data.content).show();
      $('#' + type + '_header').hide();
      $('#' + type + '_home').hide();
      $('#' + type + '_data').hide();
      $('#' + type + '_add').show();
    }
    });
  }
  //不绑定任何数据的添加
  this.addex = function()
  {
    var type = this._type;
    var data = {title:'',price:'0',description:'',link_type:'',linkid:'0',content:''}
    //设置默认值
    $('#title').val(data.name);
    $('#costs').val(data.price);
    $('#description').val(data.description);
    $('#link_type').val(data.link_type);
    $('#linkid').val(data.linkid);
    $('#addActivity').insertBefore($('#' + type + '_details')).show();
    $(this._details).html(data.content).show();
    /*
       $(this._header).hide();
       $(this._homebox).hide();
       $(this._databox).hide();
       */
    $(this._add).show();
  }
  this.clear = function()
  {
    $('#title').val('');
    $('#costs').val('');
    $('#description').val('');
    $('#starts').val('');
    $('#ends').val('');
    $('#link_type').val('');
    $('#linkid').val('');
  }
  this.cancel = function()
  {
    var type = this._type;
    $('#' + type + '_add').hide();
    $('#' + type + '_header').show();
    $('#' + type + '_home').show();
    $('#' + type + '_data').show();
  }
}
/* 景点
   ====================================================================================
   */
function getPlanedScenic(page)
{
  showLoading()
    $('#scenic_add').hide();
  var url = '/index.php?act=plan.getPlanedScenic&planid=' + planid + '&page=' + page;
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function getScenic(url)
{
  //var url = $('#link_' + page).attr('url');
  showLoading();
  $('#scenic_add').hide();
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function getScenicSubList(id)
{
  showLoading();
  $('#scenic_add').hide();
  var url = '/index.php?act=plan.selector&type=commend&id=' + id + '&page=1';
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function getScenicType(type,id)
{
  showLoading();
  $('#scenic_add').hide();
  var url = '/index.php?act=plan.selector&type=' + type + '&id=' + id + '&page=1';
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function getChinaCitys(type,id)
{
  showLoading();
  $('#scenic_add').hide();
  var url = '/index.php?act=plan.selector_citys';
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function getScenicSubCity(id)
{
  showLoading();
  $('#scenic_add').hide();
  var url = '/index.php?act=plan.selector&type=subcity&id=' + id + '&page=1';
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
/* 酒店
   ====================================================================================
   */
function iHotel(){
  this.list = function(cityname)
  {
    $('#hotel_details_full').hide();
    showLoading();
    var url = '/index.php?act=plan.selector_hotel&cityname=' + encodeURI(cityname) + '&page=1';
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  this.getListByType = function(cityname,typeid)
  {
    $('#hotel_details_full').hide();
    showLoading();
    var url = '/index.php?act=plan.selector_hotel&typeid=' + typeid + '&cityname=' + encodeURI(cityname) + '&page=1';
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  this.home = function(cityname)
  {
    $('#hotel_details_full').hide();
    showLoading();
    var url = '/index.php?act=plan.getHotelCityHome&cityname=' + encodeURI(cityname);
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  //BY QINIAO 2010-12-21
  this.citys = function()
  {
    showLoading();
    $('#hotel_add').hide();
    var url = '/index.php?act=plan.hotel_citys';
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  //BY QINIAO 2010-12-21
  this.getHotelSubCity = function(id)
  {
    showLoading();
    $('#hotel_add').hide();
    var url = '/index.php?act=plan.hotel_citys&type=subcity&id=' + id;
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  this.getCityHotelTypes = function(cityname)
  {
    $('#hotel_details_full').hide();
    showLoading();
    var url = '/index.php?act=plan.getHotelType&cityname=' + encodeURI(cityname);
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  this.getListByUrl = function(url)
  {
    $('#hotel_details_full').hide();
    showLoading();
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
  this.details = function(id)
  {
    var url = '/index.php?act=plan.getHotelDetails&id=' + id;
    $('#hotel_details_full').load(url,function(data){
      $('#hotel_data').hide();
      $('#hotel_details_full').show();
      hideLoading();
    });
  }
  this.search = function()
  {
    var k = $('#keyword_hotel').val();
    showLoading();
    var url = '/index.php?act=plan.selector_hotel&type=search&q=' + encodeURI(k) + '&page=1';
    $('#hotel_data').load(url,function(data){
      $('#hotel_data').show();
      hideLoading();
    });
  }
}
function searchScenic()
{
  var k = $('#keyword_scenic').val();
  showLoading();
  var url = '/index.php?act=plan.selector&type=search&q=' + encodeURI(k) + '&page=1';
  $('#scenic_data').load(url,function(data){
    $('#scenic_data').show();
    hideLoading();
  });
}
function searchHotel()
{
}
function showLoading()
{
  $('#scenic_details').hide();
  $('#loading').show();
}
function hideLoading()
{
  $('#loading').hide();
}
function searchFlight()
{
  var from = $('#flight_origin').val();
  var to = $('#flight_destination').val();
  showLoading();
  $('#flight_add').hide();
  var url = '/index.php?act=plan.selector_flight&from=' + encodeURI(from) + '&to=' + encodeURI(to);
  $('#flight_data').load(url,function(data){
    $('#flight_data').show();
    hideLoading();
  });
}
function searchTrain()
{
  var from = $('#train_from').val();
  var to = $('#train_to').val();
  showLoading();
  $('#train_add').hide();
  var url = '/index.php?act=plan.select_train&from=' + encodeURI(from) + '&to=' + encodeURI(to);
  //var url = '/index.php?act=plan.selector_train&from=' + encodeURI(from) + '&to=' + encodeURI(to);
  $('#train_data').load(url,function(data){
    $('#train_data').show();
    hideLoading();
  });
}

this.addOnblur = function()
{
  $('#description').height(60);
  $('#description').position('relative');
  $('#description').width(180);
  $('#times').show();
}

this.addOnfocus = function()
{
  $('#times').hide();
  $('#description').height(120);
  $('#description').position('absolute');
  $('#description').width(320);
}
