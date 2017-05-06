% Question 1

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).


% Question 1
% need a single base case with just X and Y
path(X,Y):-
        connected(X,Y).
% need a case with two sets of connected places
path(X,Y):-
        % connected needs to be first so it reaches a base case without
        % looping forever
        connected(X,Z),
        path(Z,Y).

% Question 2
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

% Question 2
% need a single base case like question 1, but
% 3 different ones need to be defined
travel(X,Y):-
        byCar(X,Y);
        byTrain(X,Y);
        byPlane(X,Y).
% need a way to connect multiple pairs with travel(Z,Y)
travel(X,Y):-
        % need a base case first to keep from looping
        % forever. This time with three possibilities
        (byCar(X,Z);
        byTrain(X,Z);
        byPlane(X,Z)),
        travel(Z,Y).



% Question 3
% go() function displays route between cities
travel(X,Y,go(X,Y)) :- 
        % once again need a base case for travel
        byCar(X,Y);
        byTrain(X,Y);
        byPlane(X,Y).
% travel calls itself to recursively find multiple pairs
travel(X,Y,go(X,Z,G)) :-
        travel(X,Z,go(X,Z)), 
        travel(Z,Y,G).

% Extra Credit

% define a tree
tree(X,Y).
% define a term as tree with two leaf nodes
tree(leaf(X),leaf(X)).
% base case. If its just a tree with two nodes, swap the order
swap(tree(X,Y),tree(Y,X)) :-
        tree(X,Y).
% if left tree contains trees, swap x it and switch tree with leaf
swap(tree(X,Y),tree(Y,A)) :-
        swap(X,A).
% If right tree has trees, swap Y and switch tree with leaf
swap(tree(X,Y),tree(B,X)) :-
        swap(Y,B).
% if both trees contain trees, swap on both trees
swap(tree(X,Y),tree(B,A)) :-
        swap(X,A),
        swap(Y,B).

