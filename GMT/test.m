a = [1 4 7 2 5 8 3 6 9]


x = mybubblesort(a)


function a = mybubblesort(a)
n = length(a);
    for i = 1:n
        for j = 1:n-1
           if a(j) > a(j+1)
               a = myswap(a,j,j+1);
           end
        end
    end
end


function a = myswap(a, i, j)

    tmp = a(i);
    a(i) = a(j);
    a(j) = tmp;
    
end