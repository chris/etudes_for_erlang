%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc functions for Chapter 6
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(stats).
-export([minimum/1, maximum/1, range/1]).

%% @doc find the minimum number in a list.
-spec(minimum(list()) -> number()).

minimum([Head|Tail]) -> minimum(Tail, Head).

minimum([], Min) -> Min;
minimum([Head|Tail], Min) when Head < Min -> minimum(Tail, Head);
minimum([_Head|Tail], Min) -> minimum(Tail, Min).


%% @doc find the maximum number in a list.
-spec(maximum(list()) -> number()).

maximum([Head|Tail]) -> maximum(Tail, Head).

maximum([], Max) -> Max;
maximum([Head|Tail], Max) when Head > Max -> maximum(Tail, Head);
maximum([_Head|Tail], Max) -> maximum(Tail, Max).


%% @doc find the range that defines the minimum and maximum numbers in a list.
-spec(range(list()) -> list()).

range([Head|Tail]) -> range(Tail, Head, Head).

range([], Min, Max) -> [Min, Max];
range([Head|Tail], Min, Max) when Head < Min -> range(Tail, Head, Max);
range([Head|Tail], Min, Max) when Head > Max -> range(Tail, Min, Head);
range([_Head|Tail], Min, Max) -> range(Tail, Min, Max).
