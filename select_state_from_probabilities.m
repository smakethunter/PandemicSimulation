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
