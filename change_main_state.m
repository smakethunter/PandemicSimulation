function new_state = change_main_state(current_state,neighbor_states,probability_of_change)
%probability_of_change - tablica predefiniowana
x,y =size(current_state);

probability = neighbor_states.main_state*probability_of_change.main_main + neighbor_states.conj_state*probability_of_change.main_conj';
proba = probability(1,:);
px,py = size(probability);
for i=2:1:px
    proba = proba+(1/8)*probability(i,:);
    
    
end

new_state = select_state_from_probabilities(proba);
end