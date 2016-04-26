min = 10 ;
max = 20 ;

Matrix = zeros(max-min+1,1) ;

parfor i = min : max
        Matrix(i-min+1) = 1 ;
end