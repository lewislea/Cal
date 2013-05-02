Cal
===

first program written in Ruby.  Mimic UNIX Cal.  Project for Nashville Software School

methods utilized (so far) for unit tests include...

month_name - able to take integer from intialize argument and match it with the full month name
days_in_month - calculates how many days in each month.  accounts for leap years.
leap_year? - returns true or false depending on whether or not the year is a leap year
get_zeller_month - calculates the correct month integer for use in zeller's congruence
get_zeller_year - calculates the correct year for zeller's congruence
month_first_day - utilizes zellers to calculate which day the first of the month falls on
determine_first_line_spacing - determines amount of space needed to line up the first day of the month with the proper day(stil not fully functional)
print_one_month_header - returns the month name, year, and days of the week
print_one_month - not working yet...but will print the rest of the month depending on when first day is.
