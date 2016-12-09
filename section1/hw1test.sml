use "hw1.sml";

val is_older_test = is_older ((1,2,3), (3,4,5)) = true

val number_in_month_test = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1

val number_in_months_test = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val dates_in_month_test = dates_in_month ([(2012,2,28),(2013,12,1), (2012,2,15)],2) = [(2012,2,28), (2012,2,15)]

val dates_in_months_test = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
