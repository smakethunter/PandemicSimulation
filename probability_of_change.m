probability_of_change = struct;
%% P(Sg1|Spn)|Sg0
zeros(6,6,6,5)

probability_of_change.main_conj = zeros(6,6,6,5);
%%  P(Sg|Sg)
probability_of_change.main_main = zeros(6,6,6,6);
%% P(Sg|Sp)
probability_of_change.conj_main = zeros(5,5,5,6);
%% P(Sg|Sp)
probability_of_change.conj_conj = zeros(5,5,5,5);
probability_of_change
