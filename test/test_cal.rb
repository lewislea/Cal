require 'test/unit'
require './cal.rb'
require './cal_year.rb'

class CalTest < Test::Unit::TestCase


  def test_number_month_to_name
    cal = Cal.new(2, 2011)
    new_cal = Cal.new(3, 2011)
    assert_equal "February", cal.month_name[2 - 1]
    assert_equal "March", new_cal.month_name[3 - 1]
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

  def test_get_zeller_month
    cal = Cal.new(2, 1301)
    expected = 14
    assert_equal expected, cal.get_zeller_month
  end

  def test_get_zeller_year
    cal = Cal.new(2, 1801)
    expected = 1800
    assert_equal expected, cal.get_zeller_year
  end

  def test_get_zeller_year_again
    cal = Cal.new(5, 1801)
    expected = 1801
    assert_equal expected, cal.get_zeller_year
  end

  def test_what_day_is_the_first_of_month
    cal = Cal.new(2, 1900)
    new_cal = Cal.new(8, 1822)
    newer_cal = Cal.new(6, 2100)
    newest_cal = Cal.new(3, 1988)
    assert_equal 5, cal.month_first_day
    assert_equal 5, new_cal.month_first_day
    assert_equal 3, newer_cal.month_first_day
    assert_equal 3, newest_cal.month_first_day
  end

  def test_first_2_lines_print
    cal = Cal.new(5, 2400)
    assert_equal "      May 2400\n", cal.print_one_month_header
  end

  def test_first_2_lines_print
    cal = Cal.new(5, 2400)
    assert_equal "Su Mo Tu We Th Fr Sa\n", cal.print_days
  end

  def test_print_month_30_days
    cal = Cal.new(4, 2400) #sat
    expected = "                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30\n"
    assert_equal expected , cal.print_month_all_weeks
  end

   def test_print_month_31_days
    cal = Cal.new(8, 1800)
    expected = "                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31\n"
    assert_equal expected , cal.print_month_all_weeks
  end

  def test_print_month_28_days
    cal = Cal.new(2, 2005)
    expected = "       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28\n\n"
    assert_equal expected , cal.print_month_all_weeks
  end

  def test_print_week_1
    cal = Cal.new(2,2005)
    assert_equal "       1  2  3  4  5\n", cal.print_week(1)
  end

  def test_print_week_2
    cal = Cal.new(2,2005)
    assert_equal " 6  7  8  9 10 11 12\n", cal.print_week(2)
  end

  def test_print_week_3
    cal = Cal.new(2,2005)
    expected = "13 14 15 16 17 18 19\n"
    assert_equal expected, cal.print_week(3)
  end

  def test_print_month_weeks
    cal = Cal.new(2, 2000)
    expected = "       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29\n\n"
    assert_equal expected, cal.print_month_all_weeks
  end

  def test_print_entire_month
    cal = Cal.new(2, 2000)
    expected = "   February 2000\nSu Mo Tu We Th Fr Sa\n       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29\n\n"
    assert_equal expected, cal.print_month
  end

  def test_print_year_number_entire_year
    cal = Cal_Year.new(1944)
    expected = "                             1944\n\n"
    assert_equal expected, cal.year_number
  end

  def test_three_month_header
    cal = Cal_Year.new(2533)
    expected = "      January               February               March\n"
    assert_equal expected, cal.first_three_months_header
  end

  def test_days_header
    cal = Cal_Year.new(1877)
    expected = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    assert_equal expected, cal.days_header
  end

  def test_3_months_first_week
    cal = Cal_Year.new(2233)
    expected = "       1  2  3  4  5                  1  2                  1  2\n"
    assert_equal expected, cal.first_3_months_week_1
  end

  def test_3_months_second_week
    cal = Cal_Year.new(2233)
    expected = " 6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9\n"
    assert_equal expected, cal.first_3_months_week_2
  end

  def test_3_months_third_week
    cal = Cal_Year.new(2233)
    expected = "13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16\n"
    assert_equal expected, cal.first_3_months_week_3
  end

  def test_3_months_fourth_week
    cal = Cal_Year.new(2233)
    expected = "20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23\n"
    assert_equal expected, cal.first_3_months_week_4
  end

  def test_3_months_fifth_week
    cal = Cal_Year.new(2233)
    expected = "27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30\n"
    assert_equal expected, cal.first_3_months_week_5
  end
  # def test_first_3_months_complete
  #   cal = Cal_Year.new(2233)
  #   expected = "                             2233\n\n      January               February               March\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n       1  2  3  4  5                  1  2                  1  2\n 6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9\n13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16\n20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23\n27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30\n                                            31\n"
  #   assert_equal expected, cal.first_3_months_complete
  # end







end
