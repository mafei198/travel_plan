module SchedulesHelper
  def day_to_week(wday)
  day_week = {"1" => "星期一", "2" => "星期二", "3" => "星期三","4" => "星期四", "5" => "星期五", "6" => "星期六","0" => "星期天"}
    day_week[wday] 
  end
end
