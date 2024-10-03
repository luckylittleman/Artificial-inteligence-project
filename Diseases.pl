go :- hypothesize(Disease),
      write('I guess that the disease is: '),
      write(Disease),
      nl,
      undo.

hypothesize(malaria) :- malaria, !.
hypothesize(cholera) :- cholera, !.
hypothesize(bilharzia) :- bilharzia, !.
hypothesize(typhoid) :- typhoid, !.
hypothesize(corona) :- corona, !.
hypothesize(tuberculosis) :- tuberculosis, !.
hypothesize(dengue_fever) :- dengue_fever, !.
hypothesize(hepatitis) :- hepatitis, !.
hypothesize(ebola) :- ebola, !.
hypothesize(hiv_aids) :- hiv_aids, !.
hypothesize(pneumonia) :- pneumonia, !.
hypothesize(diabetes) :- diabetes, !.
hypothesize(asthma) :- asthma, !.
hypothesize(rabies) :- rabies, !.
hypothesize(yellow_fever) :- yellow_fever, !.
hypothesize(anthrax) :- anthrax, !.
hypothesize(meningitis) :- meningitis, !.
hypothesize(typhus) :- typhus, !.
hypothesize(lyme_disease) :- lyme_disease, !.
hypothesize(measles) :- measles, !.
hypothesize(unknown).

malaria :- flu,
           cold,
           verify(fatigue),
           verify(rapid_breathing),
           verify(rapid_heart_rate),
           verify(general_feeling_of_discomfort),
           verify(headache),
           verify(nausea_and_vomiting), 
           verify(diarrhea),
           verify(abdominal_pain), 
           verify(muscle_or_joint_pain).

cholera :- verify(diarrhea),
           verify(nausea_and_vomiting),
           verify(dehydration).

bilharzia :- verify(nausea_and_vomiting),
             verify(diarrhea),
             verify(abdominal_pain),
             verify(muscle_or_joint_pain),
             verify(rapid_heart_rate).

typhoid :- verify(fever_that_starts_low_and_increases_daily),
           verify(headache),
           verify(weakness_and_fatigue),
           verify(muscle_aches),
           verify(sweating),
           verify(dry_cough),
           verify(loss_of_appetite_and_weight_loss),
           verify(stomach_pain),
           verify(diarrhea_or_constipation),
           verify(rash),
           verify(extremely_swollen_stomach).

tuberculosis :- verify(coughing_for_three_or_more_weeks),
                verify(coughing_up_blood_or_mucus),
                verify(chest_pain_or_pain_with_breathing_or_coughing),
                verify(unintentional_weight_loss),
                verify(fatigue),
                verify(fever),
                verify(night_sweats),
                verify(chills),
                verify(loss_of_appetite).

corona :- flu,
          cold,
          verify(tiredness),
          verify(shortness_of_breath_or_difficulty_breathing),
          verify(muscle_aches),
          verify(do_you_have_chills),
          verify(runny_nose),
          verify(headache),
          verify(chest_pain),
          verify(pink_eye_conjunctivitis),   
          verify(nausea_and_vomiting),
          verify(diarrhea),
          verify(rash).

dengue_fever :- verify(high_fever),
                verify(severe_headache),
                verify(pain_behind_the_eyes),
                verify(joint_muscle_bone_pain),
                verify(rash),
                verify(mild_bleeding).

hepatitis :- verify(jaundice),
             verify(fatigue),
             verify(abdominal_pain),
             verify(nausea),
             verify(loss_of_appetite),
             verify(fever),
             verify(dark_urine).

ebola :- verify(fever),
         verify(severe_headache),
         verify(muscle_pain),
         verify(weakness),
         verify(fatigue),
         verify(bleeding_from_orifices).

hiv_aids :- verify(fever),
            verify(sore_throat),
            verify(swollen_lymph_nodes),
            verify(fatigue),
            verify(unintentional_weight_loss),
            verify(skin_rash),
            verify(night_sweats).

pneumonia :- verify(cough_with_phlegm),
             verify(chest_pain),
             verify(fever),
             verify(shortness_of_breath),
             verify(fatigue),
             verify(nausea_and_vomiting).

diabetes :- verify(frequent_urination),
            verify(increased_thirst),
            verify(unintentional_weight_loss),
            verify(extreme_hunger),
            verify(fatigue),
            verify(blurred_vision).

asthma :- verify(shortness_of_breath),
          verify(chest_tightness),
          verify(coughing_or_wheezing),
          verify(coughing_worse_at_night).

rabies :- verify(fever),
          verify(headache),
          verify(aggression),
          verify(hallucinations),
          verify(paralysis),
          verify(excessive_salivation).

yellow_fever :- verify(fever),
                verify(chills),
                verify(severe_headache),
                verify(back_pain),
                verify(muscle_aches),
                verify(jaundice).

anthrax :- verify(fever),
           verify(chest_discomfort),
           verify(shortness_of_breath),
           verify(cough).

meningitis :- verify(stiff_neck),
              verify(fever),
              verify(headache),
              verify(sensitivity_to_light),
              verify(nausea_and_vomiting).

typhus :- verify(headache),
          verify(rash),
          verify(high_fever),
          verify(nausea).

lyme_disease :- verify(fatigue),
                verify(joint_pain),
                verify(bullseye_rash),
                verify(headache),
                verify(flu_like_symptoms).

measles :- verify(high_fever),
           verify(cough),
           verify(red_rash),
           verify(runny_nose),
           verify(red_and_watery_eyes).

/* Define flu symptoms */
flu :- verify(sore_throat),
       verify(cough),
       verify(fever),
       verify(headache),
       verify(shortness_of_breath).

/* Define cold symptoms */
cold :- verify(cough),
        verify(sneezing).

/* How to ask questions */
ask(Question) :-
    write('Do you have the following signs and symptoms: '),
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
undo :- retract(yes(_)), fail. 
undo :- retract(no(_)), fail.
undo.
