%% @author Christopher R. Bailey <chris@cobaltedge.com>
%% @doc generate data for teeth exercises for Chapter 6
%% @copyright 2014 by Christopher R. Bailey
%% @version 0.1
-module(non_fp).
-export([generate_teeth/2]).

%% @doc Generate tooth pocket depth data for a set teeth, specified as a string
%% of T/F characters indicating if the tooth is present or not. The second
%% parameter is the probability that a tooth with be good/not need attention.
%% Returns a list of lists of 6 numbers, 1-4 for present teeth, and just [0] for
%% a missing tooth.
-spec(generate_teeth(string(), number()) -> [[integer()]]).

generate_teeth(Teeth, Probability) ->
  random:seed(now()),
  generate_teeth(Teeth, Probability, []).

generate_teeth([], _, PocketDepths) -> lists:reverse(PocketDepths);
generate_teeth([$F|Teeth], Probability, PocketDepths) -> generate_teeth(Teeth, Probability, [[0]|PocketDepths]);
generate_teeth([$T|Teeth], Probability, PocketDepths) -> generate_teeth(Teeth, Probability, [generate_tooth(Probability)|PocketDepths]).


generate_tooth(Probability) -> generate_tooth(Probability, []).

generate_tooth(_Probability, Set) when length(Set) == 6 -> Set;
generate_tooth(Probability, Set) ->
  Depth = case random:uniform() < Probability of
    true -> random:uniform(3);
    false -> random:uniform(3) + 1
  end,
  generate_tooth(Probability, [Depth|Set]).
