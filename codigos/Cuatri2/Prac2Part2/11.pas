program once;








var
    c:char;
begin
    if(cumpleA(c))then begin
        if(cumpleB(c))then
            writeln('Cumple el Patron')
        else
            writeln('No cumple B');
    end
    else
        writeln('No cumple A');
end.