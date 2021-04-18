function new_conj_state = change_conj_state(current_state,neighbor_states,probability_of_change, current_main_state, possible_states)
x,y =size(current_state);
c_state = find(current_state);
probability = zeros(x,y);
for i=1:1:x
    probability(x) = sum(neighbor_states*probability_of_change(c_state(1),x));
end
st = find(current_main_state);
possible = find(possible_states(st(1),:));
proba_of_change = possible.*probability;
new_conj_state = select_state_from_probabilities(proba_of_change);
end