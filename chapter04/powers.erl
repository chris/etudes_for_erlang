%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc power functions for Chapter 4 - recursion practice (since Erlang
%% already has power functions).
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(powers).
-export([raise/2, raise2/2, nth_root/2]).

%% @doc Raise a number X to an integer power N.
-spec(raise(number(), number()) -> number()).

raise(_X, 0) -> 1;
raise(X, 1) -> X;
raise(X, N) when N > 0 -> X * raise(X, N-1);
raise(X, N) when N < 0 -> 1.0 / raise(X, -N).


%% @doc Raise a number X to an integer power N, using an accumulator for the recursion.
%% This one is tail recursive.
-spec(raise2(number(), number()) -> number()).

raise2(_X, 0) -> 1;
raise2(X, N) when N < 0 -> 1.0 / raise2(X, -N);
raise2(X, N) when N > 0 -> raise2(X, N, 1).

raise2(_X, 0, Acc) -> Acc;
raise2(X, N, Acc) -> raise2(X, N-1, X * Acc).


%% @doc Find Nth (integer) root of a number X. Uses Newton-Raphson method:
%% http://en.wikipedia.org/wiki/Newton%27s_method
-spec(nth_root(number(), number()) -> number()).

nth_root(X, N) -> nth_root(X, N, X / 2.0)


nth_root(X, N, A)
