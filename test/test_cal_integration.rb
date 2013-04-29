require 'test/unit'

class CalTest < Test::Unit::TestCase

  def test_first
  assert_equal `cal 2 2013`, `ruby cal.rb 2 2013`
  end

  def test_number_of_days_in_a_week
  end

  def test_month_with_30_days
  end

  def test_month_with_31_days
  end

  def test_number_of_days_in_february
  end

  def test_number_of_days_in_february_leap_year
  end

  def test_what_day_is_the_first_of_month
  end

  def test_order_of_names_of_days
  end

  def test_month_displayed_top
  end

  def test_first_letter_month_capitalized
  end

  def test_month_centered
  end

  def test_numbers_right_justified
  end

  def test_year_divided_by_100_not_leap_year
  end

  def test_year_divided_by_400_leap_year
  end

  def test_year_divided_by_4_leap_year
  end






end
