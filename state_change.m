possible_states = [1,0,1,1,1;
                   0,0,0,1,0;
                   1,1,0,0,0;
                   1,0,0,0,0;
                   1,1,0,0,0;
                   0,0,0,0,1;
                   0,0,0,1,1]
st = [1,0,0,0,0,0]
state = init_conj_state(st,possible_states)
%% prpozycja struktury prawdopodobieństw:
probabitlity_of_change = struct;
probabitlity_of_change.main_state = np.zeros(6,6,6,6);%
probabitlity_of_change.conj_state = np.zeros(5,5,6,6);%
%conj states
%%
function conj_state = init_conj_state(state, possible_states)
st = find(state);
possible = find(possible_states(st(1),:));

random_idx = datasample(possible, 1);
conj_state = zeros(5,1);
conj_state(random_idx) = 1;
end

%% probability selection
function state = select_state_from_probabilities(probabilities)
x,y = size(probabilities);
proba = rand(x,y);
state = zeros(x,y);
index_to_select = 0;
highest_proba = 0;
for i=1:1:x
    if proba(i)<=probabilities(i)
        if probabilities(i)>= highest_proba
            index_to_select=i;
        end
    end
end
state(index_to_select)=1;
end

%Zmiana prawdopodobieństw

%% Zmiana miedzy stanami głównymi
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


%% Przejście do stanu pośredniego
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
%%  Zmiana stanu jednostki
function new_particle = fChangeParticleState(particle,neighbor_states, probability_of_change, possible_states)
main_state = change_main_state(particle.state,neighbor_states,probability_of_change.main_state);
conj_state = change_conj_state(particle.state_conj,neighbor_states,probability_of_change.conj_state, main_state, possible_states);
new_particle = particle;
new_particle.state = main_state;
new_particle.state_conj = conj_state;
end
