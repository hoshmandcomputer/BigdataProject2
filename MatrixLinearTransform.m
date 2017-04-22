function mat = MatrixLinearTransform(mat,lowBound,upBound)

    [m n] = size(mat);
    

    minVal = min(mat(:));
    maxVal = max(mat(:));

    mat = lowBound*ones(m,n)+(upBound-lowBound)*(mat-minVal*ones(m,n))./(maxVal-minVal);

end
