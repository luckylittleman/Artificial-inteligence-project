male(amakalu).
male(muthungu).
male(mino).
male(oruko).
male(levi).
male(osama).
male(sang).
male(mike).
male(kevin).
male(denis).
male(bravin).
male(nick).
male(david).
male(dismus).
male(emmanuel).
male(victor).

female(faith).
female(vodka).
female(mercy).
female(joan).
female(fridah).
female(vivian).
female(samantha).
female(annette).
female(june).
female(josephine).
female(tiffany).
female(swabra).
female(stacy).
female(cate).
female(cynthia).

parent(sang,mino).
parent(sang,oruko).
parent(sang,osama).
parent(sang,josephine).
parent(victor,sang).
parent(victor,kevin).

parent(mino,muthungu).
parent(mino,tifanny).

parent(oruko,stacy).
parent(oruko,swabra).

parent(dismus,faith).
parent(dismus,emmanuel).

parent(kevin,bravin).
parent(kevin,nick).
parent(kevin,david).

parent(faith,mino).
parent(faith,oruko).
parent(faith,osama).
parent(faith,josephine). 
 
parent(annette,muthungu).


parent(june,bravin).
parent(june,nick).
parent(june,david).

parent(cynthia,sang).
parent(cynthia,kevin).
parent(cate,faith).
parent(cate,emmanuel).

sibling(X,Y):-parent(Z,X),parent(Z,Y).
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X).
grandparent(Z,Y):-parent(Z,X),parent(X,Y).
uncle(X,Z):-male(X),brother(X,Y),parent(Y,Z),\+parent(X,Z).
auntie(X,Z):-female(X),sister(X,Y),parent(Y,Z),\+parent(X,Z). 
greatgrandparent(X,Z):-parent(X,Y),grandparent(Y,Z).
maternaluncle(X,Z):-parent(Y,Z),sister(Y,X),male(X).
maternalgrandmother(X,Z):-parent(Y,Z),female(Y),parent(X,Y),female(X).
maternalgrandfather(X,Z):-parent(Y,Z),female(Y),parent(X,Y),male(X).
paternaluncle(X,Z):-parent(Y,Z),brother(X,Y),male(X).
paternalgrandfather(X,Z):-parent(Y,Z),male(X),parent(X,Y),male(Y).
paternalgrandmother(X,Z):-parent(Y,Z),female(X),parent(X,Y),male(Y).



