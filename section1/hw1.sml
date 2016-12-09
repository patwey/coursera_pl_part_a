(* Pat Wey, Coursera PL, HW1 *)

(* to_days : fn (int * int * int) -> int *)
fun to_days (date : (int * int * int)) =
  #1 date * 365 + #2 date * 30 + #3 date

(* is_older : fn ((int * int * int) * (int * int * int)) -> bool *)
fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
  to_days date1 < to_days date2

(* date_in_month : fn ((int * int * int) * int) -> bool *)
fun date_in_month (date : (int * int * int), month : int) =
  #2 date = month

(* number_in_month : fn ((int * int * int) list, int)) -> int *)
fun number_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then 0
  else
      if date_in_month (hd dates, month)
      then 1 + number_in_month (tl dates, month)
      else number_in_month (tl dates, month)

(* number_in_months : fn ((int * int * int) list, int list) -> int *)
fun number_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then 0
  else
      number_in_month (dates, hd months) + number_in_months (dates, tl months)

(* dates_in_month : fn ((int * int *int) list, int) -> (int * int * int) list *)
fun dates_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then []
  else
      if date_in_month (hd dates, month)
      then (hd dates) :: dates_in_month (tl dates, month)
      else dates_in_month (tl dates, month)

(* dates_in_months : fn ((int * int * int) list, int list) -> (int * int * int) list *)
fun dates_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then []
  else
      dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)



