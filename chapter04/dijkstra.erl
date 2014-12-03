%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc Dijkstra functions for Chapter 4
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1

-module(dijkstra).
-export([gcd/2]).

%% @doc Calculates the greatest common divisor (GCD) for two numbers,
%% using Dijkstra's method.
-spec(gcd(number(), number()) -> number()).

gcd(M, N) when M == N -> M;
gcd(M, N) when M > N -> gcd(M-N, N);
gcd(M, N) when M < N -> gcd(M, N-M).
