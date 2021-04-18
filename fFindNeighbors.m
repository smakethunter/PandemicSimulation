%% funkcja zlicza sasiadow komorki (x,y) wg sasiedztwa Moore'a
% czyli maksymalnie osmiu sasiadow
% opt sąsiedztwo Moora - m inaczej von_neumanna
function neighbor_states = fFindNeighbors(particles,x,y)
    neighbor_states = [];
    
    % chcemy wiedziec, jakie sa ograniczenia planszy, zeby za nia nie "wyjechac"
    [w,k] = size(particles);
    
    if x>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory
        if particles(x-1,y)==1
            neighbor_states = [neighbor_states;particles(x-1,y)];
        end
    end
    if y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo po lewej
        if particles(x,y-1)==1
            neighbor_states = [neighbor_states;particles(x,y-1)];
        end
    end
    if x<w  % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole
        if particles(x+1,y)==1
            neighbor_states = [neighbor_states;particles(x+1,y)];
        end
    end
    if y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo po prawej
        if particles(x,y+1)==1
            neighbor_states = [neighbor_states;particles(x,y+1)];
        end
    end
    
    if x>1 && y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory po lewej
        if particles(x-1,y-1)==1
            neighbor_states = [neighbor_states;particles(x-1,y-1)];
        end
    end
    if x>1 && y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo u gory po prawej
        if particles(x-1,y+1)==1
            neighbor_states = [neighbor_states;particles(x-1,y+1)];
        end
    end
    if x<w && y>1 % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole po lewej
        if particles(x+1,y-1)==1
            neighbor_states = [neighbor_states;particles(x+1,y-1)];
        end
    end
    if x<w && y<k % w przeciwnym razie nie ma co zliczac, bo nie ma nikogo na dole po prawej
        if particles(x+1,y+1)==1
            neighbor_states = [neighbor_states;particles(x+1,y+1)];
        end
    
    end
    
     
   
end
  