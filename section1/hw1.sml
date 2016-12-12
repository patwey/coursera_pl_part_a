(* Pat Wey, Coursera PL, HW1 *)

fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
  let fun to_days (date : (int * int * int)) = #1 date * 365 + #2 date * 30 + #3 date
  in to_days date1 < to_days date2
  end

fun number_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then 0
  else
      if #2 (hd dates) = month
      then 1 + number_in_month (tl dates, month)
      else number_in_month (tl dates, month)

fun number_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then 0
  else number_in_month (dates, hd months) + number_in_months (dates, tl months)

fun dates_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then []
  else
      if #2 (hd dates) = month
      then (hd dates) :: dates_in_month (tl dates, month)
      else dates_in_month (tl dates, month)

fun dates_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then []
  else dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)

fun get_nth (strs : string list, n : int) =
  if n = 1
  then hd strs
  else get_nth (tl strs, n - 1)

fun date_to_string (date : (int * int * int)) =
  let
      val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
      val month = get_nth (months, #2 date)
  in month ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)
  end

fun number_before_reaching_sum (sum : int, nums : int list) =
  if sum <= hd nums
  then 0
  else 1 + number_before_reaching_sum (sum - (hd nums), tl nums)

fun what_month (day : int) =
  let val days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in number_before_reaching_sum (day, days_per_month) + 1
  end

fun month_range (day1 : int, day2 : int) =
  if day1 > day2
  then []
  else what_month day1 :: month_range (day1 + 1, day2)

fun oldest (dates : (int * int * int) list) =
  let
      fun minimum (min, dates) =
      	if null dates
      	then min
      	else
      	    if is_older (min, hd dates)
      	    then minimum (min, tl dates)
      	    else minimum (hd dates, tl dates)
  in
      if null dates
      then NONE
      else SOME (minimum (hd dates, tl dates))
  end

fun uniq (nums : int list, result : int list) =
  let
      fun in_list (n : int, l : int list) =
      	if null l
      	then false
      	else
      	    if n = hd l
      	    then true
      	    else in_list (n, tl l)
  in
      if null nums
      then result
      else
      	  if in_list(hd nums, result)
      	  then uniq (tl nums, result)
      	  else uniq (tl nums, result @ [hd nums])
  end

fun number_in_months_challenge (dates : (int * int * int) list, months : int list) =
  number_in_months (dates, uniq (months, []))

fun dates_in_months_challenge (dates : (int * int * int) list, months : int list) =
  dates_in_months (dates, uniq (months, []))

fun reasonable_date (date : (int * int * int)) =
  let
      val days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

      fun days_in_month (month : int, counts : int list) =
	      if month = 1
	      then hd counts
	      else days_in_month (month - 1, tl counts)

      fun is_leap_year (year : int) =
	      year mod 400 = 0 orelse (year mod 4 = 0 andalso not (year mod 100 = 0))

      fun is_valid_day (year : int, month : int, day : int) =
      	if month = 2 andalso is_leap_year year
      	then day <= 29
      	else day <= (days_in_month (month, days_per_month))
  in
      #1 date > 0 andalso
      #2 date >= 1 andalso
      #2 date <= 12 andalso
      is_valid_day (#1 date, #2 date, #3 date)
  end
