function new_conj_state = change_conj_state(current_state,neighbor_states,probability_of_change, current_main_state, possible_states)


x,y =size(current_state);

probability = neighbor_states.main_state*probability_of_change.conj_main' + neighbor_states.conj_state*probability_of_change.conj_conj;
proba = probability(1,:);
px,py = size(probability);
for i=2:1:px
    proba = proba+(1/8)*probability(i,:);
    
    
end

st = find(current_main_state);
possible = find(possible_states(st(1),:));
proba_of_change = possible.*proba;
new_conj_state = select_state_from_probabilities(proba_of_change);
end