%% funkcja wczytuje na plansze forme zycia z pliku o danej nazwie
% forma zycia pojawi sie w x-tym wierszu i y-tej kolumnie tablicy

function particles = fWczytajZycie(nazwaPliku)
particles = struct;
M = importdata(nazwaPliku,',');
[w, k] = size(M);

for i=1:w
	for j=1:k
        possible_states = [1,0,1,1,1;
                   0,0,0,1,0;
                   1,1,0,0,0;
                   1,0,0,0,0;
                   1,1,0,0,0;
                   0,0,0,0,1;
                   0,0,0,1,1];
		particles(i,j).colour = M(i,j);
        if M(i,j)==1
        state = datasample([3,5],1);
        else
        state = datasample([1,2,3],1);
        end
        particles(i,j).state = [0 0 0 0 0 0];
        particles(i,j).state(state) = 1;
        particles(i,j).state_conj = init_conj_state(particles(i,j).state, possible_states)';
        particles(i,j).age = randi([4,90]);
        particles(i,j).chronic_disease = datasample([0,1],1);
        particles(i,j).fitness =  datasample([1,2,3],1);
        particles(i,j).gender = datasample([0,1],1);
        
	end
end
end


