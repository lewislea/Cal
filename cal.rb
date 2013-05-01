class Cal
  attr_reader :month
  attr_reader :year


# month = ARGV[0]
# year = ARGV[1]

# puts `cal #{month} #{year}`

  def initialize(month, year)
    @month = month
    @year = year

    if @year == nil
    raise ArgumentError, "you must have a month and a year"
    end
  end

  def get_month_name
    month_names = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October","November","December"]
    long_month_name = month_names[(@month - 1)]
    return long_month_name
  end #month - end

  def get_days_in_month
    if leap_year? == true
      @days_in_month = {"January" =>31,"February" =>29,"March" =>31,"April" =>30,"May"=>31,"June"=>30,"July"=>31,"August"=>31,"September"=>30,"October"=>31,"November"=>30,"December"=>31}
    else
      @days_in_month = {"January"=>31,"February"=>28,"March"=>31,"April"=>30,"May"=>31,"June"=>30,"July"=>31,"August"=>31,"September"=>30,"October"=>31,"November"=>30,"December"=>31}
    end
  end

  def get_month_and_year
    @month = month
    @year = year
    return month, year
  end

  def leap_year?
    if @year % 100 == 0 && @year % 400 == 0
      return true
    elsif @year % 400 == 0
      return true
    elsif @year % 4 == 0
      return true
    elsif @year % 100 == 0
      return false
    else
      return false
    end
  end

  def get_zeller_month
    months = [13,14,3,4,5,6,7,8,9,10,11,12]
    zeller_month = months[@month - 1]
  end

  def get_zeller_year
    if get_zeller_month == 13
      zeller_year = @year -1
    elsif get_zeller_month == 14
      zeller_year = @year -1
    else
      @year
    end
  end

  def month_first_day
    day_of_week = ( 1 + (((get_zeller_month + 1)*26)/10).floor + get_zeller_year + (get_zeller_year/4).floor + (6*(get_zeller_year/100).floor) + (get_zeller_year/400).floor ) % 7
    day_of_week
  end


  def days_header
    days = "Su Mo Tu We Th Fr Sa"


  end

  def print_header
    case
    when get_month_name.length == 8 or 9
      #put 3 spaces + @month + @year
    when get_month_name.length == 7
      #put 4 spaces + @month + @year
    when get_month_name.length == 4 or 5
      #put 5 spaces + @month + @year
    when get_month_name.length == 3
      #put 6 spaces + @month + @year
    end

  end

  def print_dates
  end





end #class end