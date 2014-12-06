%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc date functions for Chapter 6
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(dates).
-export([date_parts/1, is_leap_year/1, julian/1]).

%% @doc Convert a "yyyy-mm-dd" date string to a list of [yyyy, mm, dd].
-spec(date_parts(string()) -> list()).

date_parts(Date) ->
  Parts = re:split(Date, "-", [{return,list}]),
  lists:map(fun(Part) -> element(1, string:to_integer(Part)) end, Parts).


is_leap_year(Year) -> (Year rem 4 == 0 andalso Year rem 100 /= 0) orelse (Year rem 400 == 0).

%% @doc determine the Julian date (day of the year) of a date.
%% This doesn't do the accumulator aspect the Etude suggestion has, but
%% that seemed silly for this :) Oh my science, so rebellious!
-spec(julian(string()) -> number()).

julian(Date) ->
  [Year, Month, Day] = date_parts(Date),
  DayCounts = [31,28,31,30,31,30,31,31,30,31,30,31],
  LeapDay = case is_leap_year(Year) of
    true -> 1;
    false -> 0
  end,
  lists:sum(lists:sublist(DayCounts, Month-1)) + Day + LeapDay.
