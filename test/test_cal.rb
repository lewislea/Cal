require 'test/unit'
require './cal.rb'

class CalTest < Test::Unit::TestCase

  def test_must_have_month_and_year
  end

  def test_number_month_to_name
    cal = Cal.new(2, 2011)
    new_cal = Cal.new(3, 2011)
    assert_equal "February", cal.month_name
    assert_equal "March", new_cal.month_name
  end

  def test_month_with_30_days
    cal = Cal.new(9, 2012)
    newer_cal = Cal.new(4, 2011)
    newest_cal = Cal.new(11, 2012)
    assert_equal 30, cal.days_in_month
    assert_equal 30, newer_cal.days_in_month
    assert_equal 30, newest_cal.days_in_month
  end

   def test_month_with_31_days
    cal = Cal.new(12, 2012)
    newer_cal = Cal.new(7, 2011)
    newest_cal = Cal.new(10, 2012)
    assert_equal 31, cal.days_in_month
    assert_equal 31, newer_cal.days_in_month
    assert_equal 31, newest_cal.days_in_month
  end

  def test_feb_leap_year_days
    cal = Cal.new(2, 2012)
    newer_cal = Cal.new(2, 1652)
    newest_cal = Cal.new(2, 1792)
    assert_equal 29, cal.days_in_month
    assert_equal 29, newer_cal.days_in_month
    assert_equal 29, newest_cal.days_in_month
  end

  def test_leap_true_or_false
    cal = Cal.new(2, 2000)
    new_cal = Cal.new(4, 1651)
    newer_cal = Cal.new(5, 1792)
    newest_cal = Cal.new(5, 2473)
    assert_equal true, cal.leap_year?
    assert_equal false, new_cal.leap_year?
    assert_equal true, newer_cal.leap_year?
    assert_equal false, newest_cal.leap_year?
  end

  def test_what_day_is_the_first_of_month
    cal = Cal.new(5, 2400)
    new_cal = Cal.new(8, 1800)
    newer_cal = Cal.new(6, 2100)
    newest_cal = Cal.new(5, 2900)
    assert_equal 2, cal.month_first_day
    assert_equal 6, new_cal.month_first_day
    assert_equal 3, newer_cal.month_first_day
    assert_equal 0, newest_cal.month_first_day
  end

  def test_first_2_lines_print
    cal = Cal.new(5, 2400)
    # new_cal = Cal.new(8, 1800)
    # newer_cal = Cal.new(6, 2100)
    # newest_cal = Cal.new(5, 2900)
    assert_equal "      May 2400\nSu Mo Tu We Th Fr Sa\n", cal.print_one_month_header
  end

  # def test_first_week_spaces
  #   cal = Cal.new(4, 2400) #sat
  #   new_cal = Cal.new(8, 1800) #fri
  #   newer_cal = Cal.new(6, 2100) #tues
  #   newest_cal = Cal.new(7, 2900) #thurs
  #   assert_equal "                 ", cal.first_week_spaces
  #   assert_equal "              ", new_cal.first_week_spaces
  #   assert_equal "     ", newer_cal.first_week_spaces
  #   assert_equal "           ", newest_cal.first_week_spaces
  # end

  def test_print_month_30_days
    cal = Cal.new(4, 2400) #sat
    expected = "                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30\n"
    assert_equal expected , cal.print_month
  end

   def test_print_month_31_days
    cal = Cal.new(8, 1800)
    expected = "                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31\n"
    assert_equal expected , cal.print_month
  end

  def test_print_month_28_days
    cal = Cal.new(2, 2005)
    expected = "       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28\n\n"
    assert_equal expected , cal.print_month
  end
  # def test_print_first_week
  #   cal = Cal.new(3, 2100) #monday
  #   new_cal = Cal.new(9, 1844) #sunday
  #   newer_cal = Cal.new(3, 2140)#tuesday
  #   newest_cal = Cal.new(8, 1900) #wednesday
  #   assert_equal"    1  2  3  4  5  6\n",cal.first_week_dates
  #   assert_equal " 1  2  3  4  5  6  7\n", new_cal.first_week_dates
  #   assert_equal"       1  2  3  4  5\n", newer_cal.first_week_dates
  #   assert_equal "          1  2  3  4\n", newest_cal.first_week_dates
  # end

  # def test_weeks_2_through_6
  #   cal = Cal.new(6, 2506) #tuesday
  #   # new_cal = Cal.new(9, 1533)
  #   # newer_cal = Cal.new(3, 2140)
  #   # newest_cal = Cal.new(6, 1900)
  #   assert_equal " 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29 30\n",cal.weeks_2_through_6
  # end

end
