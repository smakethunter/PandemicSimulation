function new_particle = fChangeParticleState(particle,neighbor_states, probability_of_change, possible_states)
main_state = change_main_state(particle.state,neighbor_states,probability_of_change);
conj_state = change_conj_state(particle.state_conj,neighbor_states,probability_of_change, main_state, possible_states);
new_particle = particle;
new_particle.state = main_state;
new_particle.state_conj = conj_state;
end

