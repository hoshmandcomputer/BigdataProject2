function cos = cosine(x,y)
    xval = norm(x);
    yval = norm(y);
    if xval==0 || yval==0
        cos = 0;
    else
        cos = x*y'/(xval*yval);
    end
end