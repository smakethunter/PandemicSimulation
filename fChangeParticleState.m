function new_particle = fChangeParticleState(particle,neighbor_states, probability_of_change, possible_states)
main_state_from_neighbors = change_main_state(particle.state,neighbor_states,probability_of_change);
conj_state_from_neighbors = change_conj_state(particle.state_conj,neighbor_states,probability_of_change, main_state, possible_states);

proba_main_main = probability_of_change.main_main(find(particle.state),find(main_state_from_neighbors));
proba_main_conj = probability_of_change.main_conj(find(particle.state_conj),find(main_state_from_neighbors));
proba_conj_main = probability_of_change.conj_main(find(particle.state),find(conj_state_from_neighbors));
proba_conj_conj = probability_of_change.main_main(find(particle.state_conj),find(conj_state_from_neighbors));
main_rand = rand(1,1);
conj_rand = rand(1,1);
new_particle = particle;

if main_rand <= proba_main_main + proba_main_conj
  new_particle.state = main_state_from_neighbors;  
end
if conj_rand <= proba_conj_main + proba_conj_conj
  new_particle.state_conj = conj_state_from_neighbors;  
end

new_particle.colour = find(new_particle.state);
end

