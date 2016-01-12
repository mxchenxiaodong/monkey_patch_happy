#计算相隔的时间。
#初始化年月日的hash等等。

module TimeHelper
  #初始化hash
  def get_24_hours(default_num = 0)
    hash = {}
    24.times do |i|
      hash[("h" + (i+1).to_s).to_sym ] = default_num
    end
    hash
  end

  def get_31_days(default_num = 0)
    hash = {}
    31.times do |i|
      hash[("d" + (i+1).to_s).to_sym] = default_num
    end
    hash
  end

  def get_12_months(default_num = 0)
    hash = {}
    12.times do |i|
      hash[("m" + (i+1).to_s).to_sym] = default_num
    end
    hash
  end

	#date.day之前总共多少小时
  def apart_hours(begin_date, end_date)
    hours = [(end_date - bbegin_date).to_i * 24 , 0].max
  end

  #两个日期之间多少天
  def apart_days(begin_time, end_time)
    days = [(end_time.to_date - begin_time.to_date).to_i + 1, 0].max
  end

  #两个日期之间多少个月
  def apart_months(begin_time, end_time)
    months = [((end_time.year * 12 + end_time.month) - (begin_time.year * 12 + begin_time.month) + 1), 0].max
  end

   #两个日期之间多少年
  def apart_years(begin_time, end_time) 
    years = [(end_time.year - begin_time.year + 1), 0].max
  end

  def time_change_to_date(begin_time, end_time)
    begin_date = begin_time.to_date
    end_date = end_time.to_date
    yield begin_date, end_date
  end

  #两个时间之间每个小时的个数。#1点3次，2点3次，3点3次，4点2次。
  #result like : {:h1=>5,:h2=>5,:h3=>4 ...}
  def hours_number(begin_time, end_time)
    days = apart_days(begin_time, end_time) #相隔多少天
    number_hash = get_24_hours(days)  #因为每天都是24小时，所以直接用“天数 x 24”
    time_now = Time.now #用来判断所选日期是否是今天。

    #比如结束时间是当天的2015-11-5 20:00:00 ，那么21,22,23小时需要减掉
    if end_time.strftime('%Y-%m-%d') == time_now.strftime('%Y-%m-%d')
      #hour is 1..24h
      (24 - time_now.hour - 1).times do  |index|
        number_hash[("h" + (time_now.hour + index + 1 + 1 ).to_s).to_sym] -= 1
      end

      #hour is 0..23h
      # (24 - time_now.hour).times do  |index|
      #   number_hash[("h" + (time_now.hour + index + 1).to_s).to_sym] -= 1
      # end
    end

    #比如开始时间是2015-11-5 4:00:00 ，那么1,2,3小时需要减掉
    begin_time.hour.times do |index|
      number_hash[("h" + (index + 1).to_s).to_sym] -= 1
    end
    number_hash
  end

  #两个日期之间各天的天数。比如1号有4天，2号有3天等。
  #result like : {:d1=>5,:d2=>4,:d3=>4,:d4=>4,:d5=>4,:d6=>4,:d7=>4,:d8=>4, ...}
  def days_number(begin_time, end_time)
    number_hash = get_31_days
    today = Date.today

    index = 0
    remaining_date = today
    while remaining_date.strftime('%Y-%m') >= begin_time.strftime('%Y-%m')
      Time.days_in_month(remaining_date.month).times do |index|
        number_hash[("d" + (index + 1).to_s).to_sym] += 1
      end
      index += 1
      remaining_date = end_time - index.month
    end
    
    #比如当前日期是2015-12-25号，那么应该减去26,27,28,29,30,31
    if end_time.strftime('%Y-%m') == today.strftime('%Y-%m')
      (Time.days_in_month(today.month) - today.day).times do  |index|
        number_hash[("d" + (today.day + index + 1).to_s).to_sym] -= 1
      end
    end

    #比如开始日期是2015-11-5 ，那么1,2,3,4号需要减掉
    (begin_time.day - 1).times do |index|
      number_hash[("d" + (index + 1).to_s).to_sym] -= 1
    end 
    
    number_hash
  end

  #两个日期之间,每个月的个数
  #result like : {:m1=>3, :m2=>2, :m3=>2, :m4=>2, :m5=>2, :m6=>2, :m7=>2, :m8=>3, :m9=>3, :m10=>3, :m11=>3, :m12=>3}
  def months_number(begin_time, end_time)
    number_hash = get_12_months
    today = Date.today

    index = 0
    remaining_date = end_time
    while remaining_date.strftime('%Y') >= begin_time.strftime('%Y')
      12.times do |index|
        number_hash[("m" + (index + 1).to_s).to_sym] += 1
      end
      
      index += 1
      remaining_date = end_time - index.year
    end

    #今年是2016，目前是1月份。那么2月..12月就需要去掉
    if end_time.strftime('%Y') == today.strftime('%Y')
      (12 - today.month).times do  |index|
        number_hash[("m" + (today.month + index + 1).to_s).to_sym] -= 1
      end
    end

    #比如开始日期是2015-5 ，那么1,2,3,4月需要减掉
    (begin_time.month - 1).times do |index|
      number_hash[("m" + (index + 1).to_s).to_sym] -= 1
    end

    number_hash
  end


end