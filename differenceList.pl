%difference list in detail

%difference list is a open ended list where items can be added at one end
%As we can directly add the items at the end, the append is done in constant time
%This makes it advantageous to use it in scenarios where we want to do lot of appends to a list



%Creation of a difference list

%Here i will represent the difference list using the notation, [1,2,3|X]-X
%To convert a normal list to a difference list, we need a variable as the last element in the list

%To add the variable at the end of a list I will use the append predicate

append([],L2,L2).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).


%convert predicate will convert an input list to a difference list by appending a variable at the end
%here we are appending variable 'A' to the input List 'X' to get the result Z. Z is then concatenated with A,
%the variable we introduced earlier

convert(X,Y) :- append(X,A,Z),Y=Z-A.


%appending two difference lists

appendDl(Xh-X,Yh-Y,Z) :- X = Yh, Z = Xh-Y.

%in the above code we are setting X to Yh and then we are setting Z to Xh-Y, we can do this without writinh a conditional

appendDl1(Xh-X,X-Y,Xh-Y). 
