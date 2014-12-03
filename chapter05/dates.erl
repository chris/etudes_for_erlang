%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc date parsing functions for Chapter 5
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(dates).
-export([date_parts/1]).

%% @doc Convert a "yyyy-mm-dd" date string to a list of [yyyy, mm, dd].
-spec(date_parts(string()) -> list()).

date_parts(Date) ->
  Parts = re:split(Date, "-", [{return,list}]),
  lists:map(fun(Part) -> element(1, string:to_integer(Part)) end, Parts).
