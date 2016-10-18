node(a,b,c).
node(b,d,e).
leaf(e).
leaf(d).
leaf(c).

append([],L2,L2).
append([H|T],L2,[H|L3]) :- append(T,L2,L3). 

preorder(A,[A]) :- leaf(A).
preorder(Root,[Root|L]):- node(Root,Child1, Child2),preorder(Child1,A), preorder(Child2,B),append(A,B,L).

convert(X,Z) :- append(X,Y,A),Z=A-Y.
appendDf(Xb-X,X-Y,Xb-Y).

%writing the preorder to use difference lists

preorderDl(A,[A]-[]) :- leaf(A).
preorderDl(Root,Xb-Yb) :- node(Root,Child1,Child2), preorderDl(Child1,Xb-Xe), preorderDl(Child2,Yb-Ye).

preorder1(Root,[Root|Tail],Tail) :- leaf(Root).
preorder1(Root,Head,Tail) :- node(Root,Child1,Child2),
                             Head = [Root|Tail1],
                             preorder1(Child1,Tail1,Tail2),
                             preorder1(Child2,Tail2,Tail).

preorder2(Root,[Root|Tail]-Tail) :- leaf(Root).
preorder2(Root,[Root|Xb]-Y) :- node(Root,Child1, Child2),
                             preorder2(Child1,Xb-X),
                             preorder2(Child2,X-Y).

appendByDf(X,Y,Z) :- convert(X,A),convert(Y,B),appendDf(A,B,Z).
