%% funkcja zlicza sasiadow komorki (x,y) wg sasiedztwa Moore'a
% czyli maksymalnie osmiu sasiadow
% opt sąsiedztwo Moora - m inaczej von_neumanna
function neighbor_states = fFindNeighbors(particles,x,y)
    neighbor_states.main_state = [];
    neighbor_states.conj_state = [];
    % chcemy wiedziec, jakie sa ograniczenia planszy, zeby za nia nie "wyjechac"
    [w,k] = size(particles);
    
    if x>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory
        
            neighbor_states.main_state = [neighbor_states.main_state;particles(x-1,y).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x-1,y).state_conj];
    
    end
    if y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo po lewej
        
            neighbor_states.main_state = [neighbor_states.main_state;particles(x,y-1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x,y-1).state_conj];
        
    end
    if x<w  % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole
        
            
            neighbor_states.main_state = [neighbor_states.main_state;particles(x+1,y).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x+1,y).state_conj];
        
    end
    if y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo po prawej
        
            
            neighbor_states.main_state = [neighbor_states.main_state;particles(x,y+1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x,y+1).state_conj];
        
    end
    
    if x>1 && y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory po lewej
            
            neighbor_states.main_state = [neighbor_states.main_state;particles(x-1,y-1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x-1,y-1).state_conj];
        
       
    end
    if x>1 && y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory po prawej
     
            neighbor_states.main_state = [neighbor_states.main_state;particles(x-1,y+1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x-1,y+1).state_conj];
        
        
    end
    if x<w && y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole po lewej

            neighbor_states.main_state = [neighbor_states.main_state;particles(x+1,y-1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x+1,y-1).state_conj];
        
        
    end
    if x<w && y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole po prawej
        

            neighbor_states.main_state = [neighbor_states.main_state;particles(x+1,y+1).state];
            neighbor_states.conj_state = [neighbor_states.conj_state;particles(x+1,y+1).state_conj];
        
        
    
    end
    
     
   
end
  