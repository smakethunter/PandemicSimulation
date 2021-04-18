function new_state = change_main_state(current_state,neighbor_states,probability_of_change)
%probability_of_change - tablica predefiniowana
x,y =size(current_state);
c_state = find(current_state);
probability = zeros(x,y);
for i=1:1:x
    probability(x) = sum(neighbor_states*probability_of_change(c_state(1),x));
end
new_state = select_state_from_probabilities(probability);
end