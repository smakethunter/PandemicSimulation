%% skrypt realizuje automat komorkowy "Gra w zycie" Conway'a

close all;
clear all;
clc;


rozmiar = 50; % rozmiar planszy: 50x50

zycie = zeros(rozmiar,rozmiar);	   % biezaca plansza zycia
liczbaCykli = 100;                  % ile iteracji zrobic

% wczytanie kilku form zycia z pliku:
%zycie = fWczytajZycie(zycie,'formyZycia/glider.txt',24,24);
%zycie = fWczytajZycie(zycie,'formyZycia/blinker.txt',43,12);
%zycie = fWczytajZycie(zycie,'formyZycia/clock.txt',12,43);
%zycie = fWczytajZycie(zycie,'formyZycia/gliderGun.txt',12,43);
zycie = fWczytajZycie(zycie,'formyZycia/prostokat.txt',43,12);
%zycie = fWczytajZycie(zycie,'formyZycia/infG.txt',30,30);
%zycie = fWczytajZycie(zycie,'formyZycia/osc.txt',30,30);
for n=1:liczbaCykli

    %--- KROK 1 ----------------------------------------------------
    % wyswietl cykl z tablicy zycie
    
    % najpierw znajdujemy niezerowe komorki na planszy zycia   
    [I,J] = find(zycie);
    % i tylko je wyswietlamy:
    % najpierw J - kolumny, potem 50-I - wiersze do gory nogami 
    % (bo y na wykresie rosnie w gore, a numery wierszy macierzy rosna w dol)
    plot(J,rozmiar-I,'.','Marker', 's', 'MarkerFaceColor', 'b', 'MarkerSize', 4);
    axis([1 rozmiar 1 rozmiar]);
    daspect([1,1,1])    
    % napisz, ktory to cykl:
    text(2,2.5,['cykl ' num2str(n)]);
        
    %--- KROK 2 ----------------------------------------------------
    % oblicz stany komorek do nastepnego cyklu:
    
    zyciePom= zeros(rozmiar,rozmiar); % tworzymy plansze do odtwarzania zycia "za chwile"

    % dla kazdej z komorek polanszy zycie obliczamy, ile maja sasiadow
    % i w zaleznosci od ich liczby wstawiamy do zyciePom jedynke lub nic
    % nie wstawiamy
    for w=1:rozmiar
        for k=1:rozmiar
            sasiedzi = fPoliczSasiadow(zycie,w,k,'n');
            % jezeli komorka jest zywa i ma 2 lub 3 sasiadow, to nadal zyje
            if zycie(w,k)==1 && (sasiedzi == 2 || sasiedzi == 3)
                zyciePom(w,k)=1;
            % jezeli komorka jest martwa i ma 3 sasiadow, to ozywa
            elseif zycie(w,k)==0 && sasiedzi == 3
                zyciePom(w,k)=1;
            end        
        end
    end
    
    %--- KROK 3 ----------------------------------------------------
    % przepisujemy wartosci z zyciePom do zycie
    
    % zerujemy znowu tablice zycie
    zycie= zeros(rozmiar,rozmiar);

    % gdzie w zyciePom sa jedynki?
    [I,J] = find(zyciePom);
    liczbaNieZer = length(I);    
       
    % przepisujemy jedynki z zycie do zyciePom
    for m=1:liczbaNieZer
        zycie(I(m),J(m)) = zyciePom(I(m),J(m));
    end    
    
    % wykasuj ponizsze 4 linijki, jezeli twoja regula pozwala ozywac
    % martwym komorkom nieposiadajacym zywych sasiadow!!!!
    if liczbaNieZer==0
        disp('Wszystkie komorki umarly - nie dzialam dalej!');
	[I,J] = find(zycie);
        plot(J,rozmiar-I,'.','Marker', 's', 'MarkerFaceColor', 'b', 'MarkerSize', 4);
        break;
    end
    pause(0.05);
end


