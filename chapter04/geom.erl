%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc Geometry functions for Chapter 4
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1

-module(geom).
-export([area/1]).

%% @doc Calculates the area of a shape.

-spec(area(tuple()) -> number()).

area({Shape, Number1, Number2}) when Number1 >= 0, Number2 >= 0 ->
  case Shape of
    rectangle -> Number1 * Number2;
    triangle -> Number1 * Number2 / 2.0;
    ellipse -> math:pi() * Number1 * Number2;
    _ -> 0
  end;

area({_,_,_}) -> 0.
