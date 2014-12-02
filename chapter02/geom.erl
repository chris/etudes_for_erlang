%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc Geometry functions
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1

-module(geom).
-export([area/2]).

%% @doc Calculates the area of a rectangle.

-spec(area(number(), number()) -> number()).

area(Length, Width) -> Length * Width.
