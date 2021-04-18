function conj_state = init_conj_state(state, possible_states)
st = find(state);
possible = find(possible_states(st(1),:));

random_idx = datasample(possible, 1);
conj_state = zeros(5,1);
conj_state(random_idx) = 1;
end