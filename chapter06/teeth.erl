%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc teeth functions for Chapter 6
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(teeth).
-export([alert/1]).

%% @doc Given a list of lists of 6 elements (or [0] to represent a missing tooth)
%% representing pocket depths, returns a list of teeth that need attention, where
%% that tooth has at least one pocket depth of 4 or greater.
-spec(alert([[integer()]]) -> [integer()]).

alert(Teeth) -> alert(Teeth, 1, []).

alert([], _, NeedAttention) -> lists:reverse(NeedAttention);
alert([Tooth|Teeth], ToothNum, NeedAttention) ->
  case lists:max(Tooth) >= 4 of
    true -> alert(Teeth, ToothNum+1, [ToothNum|NeedAttention]);
    false -> alert(Teeth, ToothNum+1, NeedAttention)
  end.
