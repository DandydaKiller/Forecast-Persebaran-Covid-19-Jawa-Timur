function hasil=smoothm(hasil)
if hasil>=1e60 
    hasil = floor(round(hasil)/1e52); %6 digit
end
if hasil>=1e59 
    hasil = floor(round(hasil)/1e52); %5 digit
end
if hasil>=1e58 
    hasil = floor(round(hasil)/1e51); %5 digit
end
if hasil>=1e57 
    hasil = floor(round(hasil)/1e50); %5 digit
end
if hasil>=1e56 
    hasil = floor(round(hasil)/1e49); %5 digit
end
if hasil>=1e55 
    hasil = floor(round(hasil)/1e48); %5 digit
end
if hasil>=1e54 
    hasil = floor(round(hasil)/1e47); %5 digit
end
if hasil>=1e53 
    hasil = floor(round(hasil)/1e46); %5 digit
end
if hasil>=1e52 
    hasil = floor(round(hasil)/1e45); %5 digit
end
if hasil>=1e51
    hasil = floor(round(hasil)/1e41); %5 digit
end
if hasil>=1e50
    hasil = floor(round(hasil)/1e39); %5 digit
end
if hasil>=1e49
    hasil = floor(round(hasil)/1e45); %4 digit
end
if hasil>=1e48
    hasil = floor(round(hasil)/1e44); %4 digit
end
if hasil>=1e47
    hasil = floor(round(hasil)/1e43); %4 digit
end
if hasil>=1e46
    hasil = floor(round(hasil)/1e42); %4 digit
end
if hasil>=1e45
    hasil = floor(round(hasil)/1e41); %4 digit
end
if hasil>=1e44
    hasil = floor(round(hasil)/1e40); %4 digit
end
if hasil>=1e43
    hasil = floor(round(hasil)/1e39); %4 digit
end
if hasil>=1e42
    hasil = floor(round(hasil)/1e38); %4 digit
end
if hasil>=1e41
    hasil = floor(round(hasil)/1e37); %4 digit
end
if hasil>1e40
    hasil = floor(round(hasil)/1e36); %4 digit
end
if hasil>1e39
    hasil = floor(round(hasil)/1e35); %4 digit
end
if hasil>1e38
    hasil = floor(round(hasil)/1e34); %4 digit
end
if hasil>1e37
    hasil = floor(round(hasil)/1e33); %4 digit
end
if hasil>1e36
    hasil = floor(round(hasil)/1e32); %4 digit
end
if hasil>1e35
    hasil = floor(round(hasil)/1e31); %4 digit
end
if hasil>1e34
    hasil = floor(round(hasil)/1e30); %4 digit
end
if hasil>1e33
    hasil = floor(round(hasil)/1e29); %4 digit
end
if hasil>1e32
    hasil = floor(round(hasil)/1e28); %4 digit
end
if hasil>1e31
    hasil = floor(round(hasil)/1e27); %4 digit
end
if hasil>1e30
    hasil = floor(round(hasil)/1e26); %4 digit
end
if hasil>1e29
    hasil = floor(round(hasil)/1e25); %4 digit
end
if hasil>1e28
    hasil = floor(round(hasil)/1e24); %4 digit
end
if hasil>1e27
    hasil = floor(round(hasil)/1e23); %4 digit
end
if hasil>1e26
    hasil = floor(round(hasil)/1e22); %4 digit
end
if hasil>1e25
    hasil = floor(round(hasil)/1e21); %4 digit
end
if hasil>1e24
    hasil = floor(round(hasil)/1e20); %4 digit
end
if hasil>1e23
    hasil = floor(round(hasil)/1e19); %4 digit
end
if hasil>1e22
    hasil = floor(round(hasil)/1e18); %4 digit
end
if hasil>1e21
    hasil = floor(round(hasil)/1e17); %4 digit
end
if hasil>1e20
    hasil = floor(round(hasil)/1e16); %4 digit
end
if hasil>1e19
    hasil = floor(round(hasil)/1e15); %4 digit
end
if hasil>1e18
    hasil = floor(round(hasil)/1e14); %4 digit
end
if hasil>1e17
    hasil = floor(round(hasil)/1e13); %4 digit
end
if hasil>1e16
    hasil = floor(round(hasil)/1e12); %4 digit
end
if hasil>1e15
    hasil = floor(round(hasil)/1e11); %4 digit
end
if hasil>1e14
    hasil = floor(round(hasil)/1e10); %4 digit
end
if hasil>1e13
    hasil = floor(round(hasil)/1e9); %4 digit
end
if hasil>1e12
    hasil = floor(round(hasil)/1e8); %4 digit
end
if hasil>1e11
    hasil = floor(round(hasil)/1e7); %4 digit
end
if hasil>1e10
    hasil = floor(round(hasil)/1e6); %4 digit
end
if hasil>1e9
    hasil = floor(round(hasil)/1e5); %4 digit
end
if hasil>1e8
    hasil = floor(round(hasil)/1e4); %4 digit
end
if hasil>1e7
    hasil = floor(round(hasil)/1e3); %4 digit
end
if hasil>1e6
    hasil = floor(round(hasil)/1e2); %4 digit
end
if hasil>1e5
    hasil = floor(round(hasil)/1e1); %4 digit
end
%if hasil>1000000
 %   hasil = floor(round(hasil)/100);
%end
end