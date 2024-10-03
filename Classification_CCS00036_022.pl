go :- hypothesize(Classification),
      write('I guess that the organism belongs to the classification: '),
      write(Classification),
      nl,
      undo.

% Hypothesize based on classification
hypothesize(mammal)     :- mammal, !.
hypothesize(bird)       :- bird, !.
hypothesize(fish)       :- fish, !.
hypothesize(reptile)    :- reptile, !.
hypothesize(amphibian)  :- amphibian, !.
hypothesize(insect)     :- insect, !.
hypothesize(crustacean) :- crustacean, !.
hypothesize(plant)      :- plant, !.
hypothesize(fungi)      :- fungi, !.
hypothesize(unknown).   

mammal :-
    verify(has_hair_or_fur),
    verify(gives_birth_to_live_young),
    verify(warm_blooded),
    verify(has_mammary_glands),
    verify(breathes_air).

bird :-
    verify(has_feathers),
    verify(lays_eggs),
    verify(has_beak),
    verify(flies),
    verify(warm_blooded).

fish :-
    verify(has_scales),
    verify(lives_in_water),
    verify(lays_eggs),
    verify(has_fins),
    verify(has_gills),
    verify(cold_blooded).

reptile :-
    verify(has_scales),
    verify(lays_eggs),
    verify(cold_blooded),
    verify(breathes_air).

amphibian :-
    verify(has_moist_skin),
    verify(lays_eggs_in_water),
    verify(lives_on_land_and_water),
    verify(cold_blooded),
    verify(undergoes_metamorphosis).

insect :-
    verify(has_exoskeleton),
    verify(has_three_body_parts),
    verify(has_six_legs),
    verify(has_wings_or_antennae).

crustacean :-
    verify(has_exoskeleton),
    verify(lives_in_water),
    verify(has_claws),
    verify(has_more_than_six_legs).

plant :-
    verify(does_photosynthesis),
    verify(has_leaves),
    verify(has_roots),
    verify(has_flowers_or_fruits).

fungi :-
    verify(produces_spores),
    verify(grows_in_damp_places),
    verify(no_chlorophyll),
    verify(decomposes_organic_material).

/* How to ask questions */
ask(Question) :-
    write('Does the organism have the following characteristic: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      -> 
      assert(yes(Question)) ;
      assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    -> 
    true ;
    (no(S)
     -> 
     fail ;
     ask(S))).

/* Undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.
