use "hw1.sml";

val is_older_test1 = is_older ((1,2,3), (3,4,5)) = true
val is_older_test2 = is_older ((3,4,5), (1,2,3)) = false
val is_older_test3 = is_older ((1,2,3), (1,2,3)) = false

val number_in_month_test1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val number_in_month_test2 = number_in_month ([(2015,3,30)], 8) = 0
val number_in_month_test3 = number_in_month ([], 8) = 0

val number_in_months_test1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val number_in_months_test2 = number_in_months ([(2015,1,11)],[30]) = 0
val number_in_months_test3 = number_in_months ([], [1]) = 0
val number_in_months_test4 = number_in_months ([(2016,2,8)], []) = 0

val dates_in_month_test1 = dates_in_month ([(2012,2,28),(2013,12,1), (2012,2,15)],2) = [(2012,2,28), (2012,2,15)]
val dates_in_month_test2 = dates_in_month ([], 2) = []
val dates_in_month_test3 = dates_in_month ([(2012,2,28),(2013,12,1)],5) = []

val dates_in_months_test1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val dates_in_months_test2 = dates_in_months ([],[2,3,4]) = []
val dates_in_months_test3 = dates_in_months ([(1,2,3)],[]) = []

val get_nth_test1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val get_nth_test2 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
val get_nth_test3 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"

val date_to_string_test1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val date_to_string_test2 = date_to_string (2015, 1, 10) = "January 10, 2015"
val date_to_string_test3 = date_to_string (2016, 12, 30) = "December 30, 2016"

val number_before_reaching_sum_test1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val number_before_reaching_sum_test2 = number_before_reaching_sum (0, [1,2,3,4,5]) = 0
val number_before_reaching_sum_test3 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4

val what_month_test1 = what_month 70 = 3
val what_month_test2 = what_month 365 = 12
val what_month_test3 = what_month 32 = 2
val what_month_test4 = what_month 31 = 1

val month_range_test1 = month_range (31, 34) = [1,2,2,2]
val month_range_test2 = month_range (100, 10) = []
val month_range_test3 = month_range (363, 365) = [12, 12, 12]

val oldest_test1 = oldest ([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val oldest_test2 = oldest [] = NONE
val oldest_test3 = oldest ([(2012,2,28),(2011,4,28),(2011,4,28)]) = SOME (2011,4,28)

val challenge1_test1 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2,4]) = 3
val challenge1_test2 = number_in_months_challenge ([(2015,1,11)],[30]) = 0
val challenge1_test3 = number_in_months_challenge ([], [1]) = 0
val challenge1_test4 = number_in_months_challenge ([(2016,2,8)], []) = 0

val challenge1_test5 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val challenge1_test6 = dates_in_months_challenge ([],[2,3,4]) = []
val challenge1_test7 = dates_in_months_challenge ([(1,2,3)],[]) = []

val challenge2_test1 = reasonable_date (~1, 10, 10) = false
val challenge2_test2 = reasonable_date (1, 13, 10) = false
val challenge2_test3 = reasonable_date (1, 12, 44) = false
val challenge2_test4 = reasonable_date (1, 2, 29) = false
val challenge2_test5 = reasonable_date (400, 2, 29) = true
val challenge2_test6 = reasonable_date (16, 2, 29) = true
val challenge2_test7 = reasonable_date (100, 4, 30) = true

