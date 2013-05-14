class Cal_Year < Cal

attr_reader :year

  def initialize(year)
    @year = year
  end

  def year_number
    year_header = "#{year}".center(63).rstrip
    year_header << "\n\n"
  end

  def first_three_months_header
    months = month_name[0].center(20) + "  " + month_name[1].center(20) + "  " +
            month_name[2].center(20).rstrip + "\n"
  end

  def days_header
    days = print_days.chop
    days + "  " + days + "  " + days + "\n"
  end

  def first_3_months_week_1
    @month = 1
    jan = print_week(1)
    @month = 2
    feb = print_week(1)
    @month = 3
    march = print_week(1)
    all_weeks = jan.chop + "  " + feb.chop + "  " + march
  end

  def first_3_months_week_2
    @month = 1
    jan = print_week(2)
    @month = 2
    feb = print_week(2)
    @month = 3
    march = print_week(2)
    all_weeks = jan.chop + "  " + feb.chop + "  " + march
  end

  def first_3_months_week_3
    @month = 1
    jan = print_week(3)
    @month = 2
    feb = print_week(3)
    @month = 3
    march = print_week(3)
    all_weeks = jan.chop + "  " + feb.chop + "  " + march
  end

  def first_3_months_week_4
    @month = 1
    jan = print_week(4)
    @month = 2
    feb = print_week(4)
    @month = 3
    march = print_week(4)
    all_weeks = jan.chop + "  " + feb.chop + "  " + march
  end

  def first_3_months_week_5
    @month = 1
    jan = print_week(5).chop.ljust(20)
    @month = 2
    feb = print_week(5).chop.ljust(20)
    @month = 3
    march = print_week(5).ljust(20)
    all_weeks = jan + "  " + feb + "  " + march
  end

  def first_3_months_week_6
    def first_3_months_week_5
    @month = 1
    jan = print_week(6).chop.ljust(20)
    @month = 2
    feb = print_week(6).chop.ljust(20)
    @month = 3
    march = print_week(6).ljust(20)
    all_weeks = jan + "  " + feb + "  " + march
  end
  end

  def first_3_months_complete
    puts year_number + first_three_months_header + days_header + first_3_months_week_1 + first_3_months_week_2 + first_3_months_week_3 + first_3_months_week_4 + first_3_months_week_5
  end




end