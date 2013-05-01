require 'test/unit'
require './cal.rb'

class CalTest < Test::Unit::TestCase

  def test_number_month_to_name
    cal = Cal.new(2, 2011)
    new_cal = Cal.new(3, 2011)
    assert_equal cal.get_month_name, "February"
    assert_equal new_cal.get_month_name,"March"
  end

  def test_month_with_30_days
    cal = Cal.new(9, 2012)
    newer_cal = Cal.new(4, 2011)
    newest_cal = Cal.new(11, 2012)
    assert_equal 30, cal.get_days_in_month[cal.get_month_name]
    assert_equal 30, newer_cal.get_days_in_month["April"]
    assert_equal 30, newest_cal.get_days_in_month[cal.get_month_name]
  end

   def test_month_with_31_days
    cal = Cal.new(12, 2012)
    newer_cal = Cal.new(7, 2011)
    newest_cal = Cal.new(10, 2012)
    assert_equal 31, cal.get_days_in_month[cal.get_month_name]
    assert_equal 31, newer_cal.get_days_in_month["July"]
    assert_equal 31, newest_cal.get_days_in_month[cal.get_month_name]
  end

  def test_feb_leap_year_days
    cal = Cal.new(2, 2012)
    newer_cal = Cal.new(2, 1652)
    newest_cal = Cal.new(2, 1792)
    assert_equal 29, cal.get_days_in_month[cal.get_month_name]
    assert_equal 29, newer_cal.get_days_in_month["February"]
    assert_equal 29, newest_cal.get_days_in_month[cal.get_month_name]
  end

  def test_leap_true_or_false
    cal = Cal.new(2, 2000)
    new_cal = Cal.new(4, 1651)
    newer_cal = Cal.new(5, 1792)
    newest_cal = Cal.new(5, 2473)
    assert_equal cal.leap_year?, true
    assert_equal new_cal.leap_year?, false
    assert_equal newer_cal.leap_year?, true
    assert_equal newest_cal.leap_year?, false
  end

  def test_what_day_is_the_first_of_month
    cal = Cal.new(5, 2400)
    new_cal = Cal.new(8, 1800)
    newer_cal = Cal.new(6, 2100)
    newest_cal = Cal.new(5, 2900)
    assert_equal cal.month_first_day, 2
    assert_equal new_cal.month_first_day, 6
    assert_equal newer_cal.month_first_day, 3
    assert_equal newest_cal.month_first_day, 0
  end

  # def test_order_of_names_of_days
  #   Su < Mon == true
  # end

  # def test_number_of_days_in_february
  # end

  # def test_number_of_days_in_a_week
  # end

  # def test_first_letter_month_capitalized
  # end

  # def test_month_centered
  # end

  # def test_numbers_right_justified
  # end

end
