class Cal
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
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
    print header
    header
  end

  def first_week_spaces
    spaces = ["  ","  ","  ","  ","  ","  "]
    case
    when month_first_day == 0
      first_week_spaces = spaces
    when month_first_day == 1
      first_week_spaces = nil
    when month_first_day == 2
      first_week_spaces = spaces.take(1)
    when month_first_day == 3
      first_week_spaces = spaces.take(2)
    when month_first_day == 4
      first_week_spaces = spaces.take(3)
    when month_first_day == 5
      first_week_spaces = spaces.take(4)
    when month_first_day == 6
      first_week_spaces = spaces.take(5)
    end
    first_week_spaces
  end

  def days_array
    days_31 = [" 1", " 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    days_30 = [" 1", " 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    days_29 = [" 1", " 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]
    days_28 = [" 1", " 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"]
    if days_in_month == 31
      days_31
    elsif days_in_month == 30
      days_30
    elsif days_in_month == 29
      days_29
    else
      days_28
    end
  end

  def print_month
    dates = days_array.unshift(first_week_spaces)
    weeks = dates.flatten
    weeks.insert(7,"\n")
    weeks.insert(15,"\n")
    weeks.insert(23,"\n")
    weeks.insert(31,"\n")
    weeks.insert(39,"\n")
    weeks << "\n"
    weeks_array = weeks.each_slice(8).to_a
    joined_weeks_string = weeks_array.join(" ")
    joined_weeks_string.slice!(20)
    joined_weeks_string.slice!(21)
    joined_weeks_string.slice!(41)
    joined_weeks_string.slice!(42)
    joined_weeks_string.slice!(62)
    joined_weeks_string.slice!(63)
    joined_weeks_string.slice!(83)
    joined_weeks_string.slice!(84)
    joined_weeks_string.slice!(104)
    joined_weeks_string.slice!(105)
    joined_weeks_string.slice!(107)
    puts joined_weeks_string
    joined_weeks_string
  end


end #class

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  output = Cal.new(month,year)
  output.print_one_month_header
  output.print_month
end