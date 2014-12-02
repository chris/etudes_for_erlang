%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc Geometry functions
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1

-module(geom).
-export([area/1]).

%% @doc Calculates the area of a shape.

-spec(area(tuple()) -> number()).
-spec(area(atom(), number(), number()) -> number()).

area({Shape, Number1, Number2}) -> area(Shape, Number1, Number2).

area(rectangle, Length, Width) when Length >= 0, Width >= 0 -> Length * Width;
area(triangle, Base, Height) when Base >= 0, Height >= 0 -> Base * Height / 2.0;
area(ellipse, MajorRadius, MinorRadius) when MajorRadius >= 0, MinorRadius >= 0 -> math:pi() * MajorRadius * MinorRadius;
area(_,_,_) -> 0.

