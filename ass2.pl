/We aknowledge this is our work and not others Kleanthis Liontis 961326, Themis Mouyiasis 962895, Theodoulos Christou 966851 Group92/

%EX1
parent(queenmother,elisabeth).
parent(elisabeth,charles).
parent(elisabeth,andrew).
parent(elisabeth,anne).
parent(elisabeth,edward).
parent(diana,william).
parent(diana,harry).
parent(sarah,beatrice).
parent(anne,peter).
parent(anne,zara).
parent(george,elisabeth).
parent(philip,charles).
parent(philip,andrew).
parent(philip,edward).
parent(charles,william).
parent(charles,harry).
parent(andrew,beatrice).
parent(andrew,eugene).
parent(mark,peter).
parent(mark,zara).
parent(william,georgejun).
parent(kate,georgejun).
parent(william,charlotte).
parent(kate,charlotte).
parent(phillip,anne).
parent(william,louis).
parent(kate,louis).


%query 1a
%This function prints a list of females of royal family
the_royal_females([queenmother,elisabeth,anne,diana,sarah,beatrice,zara,eugene,charlotte,kate]).


%query 1b
%This function prints a list of males of royal family
the_royal_males([charles,andrew,edward,william,harry,peter,george,philip,mark,georgejun,louis]).


%query 1.2
%This function prints a list of all the royal family
the_royal_family(X) :- the_royal_females(X),the_royal_males(Y),append(X,Y,Z).


%query 1.3
%This function finds the mother of Y
mother(X,Y):- the_royal_females(Z),member(X,Z),parent(X,Y).


%query 1.4
%This function finds the ancenstor of Y
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y) :- parent(X,Z),ancestor(Z,Y).


%query 1.5
%This function finds the sibling of X and Y
sibling(X,Y):- parent(Z,X), parent(Z,Y), X \= Y.


%query 1.6
%This function finds the brother of X
brother(X,Y):- the_royal_males(O),member(Y,O),parent(Z,X),parent(Z,Y), X \= Y.

%query 1.7
%The ancestors of louis are(william,kate,queenmother,elizabeth,diana,george,philip,charles).

%query 1.8
%The grandchilds of queenmother are(charles,andrew,edward,anne)
%This function finds the grandmother of Y
grandmother(X,Y):- the_royal_females(O),member(X,O),parent(X,Z),parent(Z,Y).

%query 1.9.
%The common descendants of anne and edward are(elizabeth,philip,queenmother,george)
%This function finds the common ancenstors X
common_anchestors(X,Y) :- ancestor(Y,X).


%This function finds the brother who is granddad of Y
granddad(X,Y):- the_royal_males(O),member(X,O),parent(X,Z),parent(Z,Y).

%query 1.10
%This function finds the brother of X who is granddad
has_brother_who_is_granddad(X,Y):- brother(X,Y), the_royal_males(O),granddad(Y,Z),!.

%EX2

%query 2a
%This function selects an element of the list
selectElement(0,[H|_],H).
selectElement(C,[_|T],X):- C1 is C-1, selectElement(C1,T,X).

%This function removes an element of the list
removeElement(Elem,[Elem|T],T).
removeElement(Elem,[H|T],[H|T2]):- removeElement(Elem,T,T2).

%This function returns a list without the selected element
nth_elt(N,L,E,R):- selectElement(N,L,E),removeElement(E,L,R).

%This function counts the length of the list	
listLength([], 0).
listLength([_|T],L):- listLength(T,L1) , L is L1+1.

%This function returns the list without the selected element and 
%checks N>0 and the length >= 0
nth_elt_with_test(N,L,E,R):- selectElement(N,L,E),listLength(L,LNew),N>0,N=<LNew,removeElement(E,L,R).

%query 2b
%This function sort the list in ascenting order
sortlist(L,LS):- sort(0,@<,L,LS). 

%query 2c
%This function selects an element
selectAndSort(K,L,R):- sortlist(L,X),selectElement(K,X,R).

%This function finds the median of the list	
median(L,E):- listLength(L,X),K is round(X/2 - 1),selectAndSort(K,L,E).

/Finds the median of the list/
median(L,X):-
    sort(L,SortedL),
    length(SortedL,Len),
    Len2 is Len//2,
    nth_elt(Num,SortedL,Len2,X).
	
/Ex3
Here we calculate the square of Euclidean distance between two vectors recursively./
euclidsqr([],[],0).
euclidsqr([X|Xs],[Y|Ys],ED):-
        euclidsqr(Xs,Ys,ED1),
        ED is (X-Y)*(X-Y) + ED1.
        
/The accumulator A stores the calculations of Euclidean squared distance between two vectors./
euclidsqr_acc([],[],ED,ED).
euclidsqr_acc([X|Xs],[Y|Ys],A,ED):-
        A1 is (X-Y)*(X-Y) + A,
        euclidsqr_acc(Xs,Ys,A1,ED).

/EX4 
removes 1 from element form a list and leaves a remainder/
member_rem(E,[E|L],L).
member_rem(E,[Y|L],[Y|R]):-
        member_rem(E,L,R).
        
/gen_list numbers from D being distinct/
gen_list(0,_,[]).
gen_list(N,D,[X|L]):-
        N>0,N1 is N-1,
        member_rem(X,D,D1),
        gen_list(N1,D1,L).
        
/sujiko
gen_listsj1 creates a list of 7 distinct digits for [X1,X2,X3,X4,X5,X6,X7] for sujiko 1/
gen_listsj1:-gen_list(7,[1,3,4,5,6,8,9],L).   