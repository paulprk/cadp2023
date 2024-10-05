program four;
const
    pi=3.14;
var
    diameter,radius:real;
begin
    write('Enter diameter of the circle: '); readln(diameter);
    radius:=diameter/2;
    writeln('The radius of the circle is: ',radius:0:2);
    writeln('The area of the circle is: ',pi*(radius*radius):0:2);
    writeln('The perimeter of the circle is: ',diameter*pi:0:2);
end.