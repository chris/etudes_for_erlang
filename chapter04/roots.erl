%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc root functions for Chapter 4 - recursion practice (since Erlang
%% already has root functions).
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(roots).
-export([nth_root/2]).

%% @doc Find Nth (integer) root of a number X. Uses Newton-Raphson method:
%% http://en.wikipedia.org/wiki/Newton%27s_method
-spec(nth_root(number(), number()) -> number()).

nth_root(X, N) -> nth_root(X, N, X / 2.0).

nth_root(X, N, A) ->
  io:format("Current guess is ~p~n", [A]),

  F = powers:raise(A, N) - X,
  Fprime = N * powers:raise(A, N - 1),
  Next = A - F / Fprime,
  Change = abs(Next - A),

  if
    Change < 1.0e-8 -> Next;
    true -> nth_root(X, N, Next)
  end.
