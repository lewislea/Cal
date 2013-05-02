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

  def month_name
    month_names = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October","November","December"]
    long_month_name = month_names[(@month - 1)]
    return long_month_name
  end

  def days_in_month
      number_of_days = [28,29,30,31]
      if @month == 9 or @month ==4 or @month ==6 or @month == 11
        number_of_days[2]
      elsif @month == 2
        if leap_year? == true
          number_of_days[1]
        else
          number_of_days[0]
        end
      else
        number_of_days[3]
      end
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

  def print_one_month_header
    month_year = "#{month_name} #{year}".center(20).rstrip
    days = "Su Mo Tu We Th Fr Sa"
    header = "#{month_year}\n#{days}\n"
  end

  def determines_first_line_date_spacing
    case
    when month_first_day == 0
      spaces = ["                 "]
    when month_first_day == 1
      spaces = ["              "]
    when month_first_day == 2
      spaces = ["           "]
    when month_first_day == 3
      spaces = ["        "]
    when month_first_day == 4
      spaces = ["     "]
    when month_first_day == 5
      spaces = ["    "]
    when month_first_day == 6
      spaces = []
    end
  end


  def print_one_month
    days = ["  1", "  2","  3","  4","  5","  6","  7","  8","  9"," 10"," 11"," 12"," 13"," 14"," 15"," 16"," 17"," 18"," 19"," 20"," 21"," 22"," 23"," 24"," 25"," 26"," 27"," 28"," 29"," 30"," 31"]
    week = Array.new
    case
    when month.days_in_month == 31
      while days.empty? == false
        days.take(7) << week
        week
        days.drop(7)
        week << "\n"
      end
    when month.days_in_month == 30
      days.pop
      until days.nil?
        days.take(7) << week
        puts week
        days.drop(7)
      end
    when month.days_in_month == 29
      days.pop(2)
      until days.nil?
        days.take(7) << week
        puts week
        days.drop(7)
      end
    when month.days_in_month == 28
      days.pop(3)
      until days.nil?
        days.take(7) << week
        puts week
        days.drop(7)
      end
    end
  end#print one month end





end #class end