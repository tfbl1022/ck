function es = epsil
es = 1;
while(1)
es = es/2;
if es+1 <= 1, break, end
end
es = es*2;
end