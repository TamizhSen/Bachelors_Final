
declare
pass varchar2(32):='ad';
pass2 varchar2(32);
pass3 varchar2(32);

begin
dbms_output.put_line('My password :'||pass);
pass2:=pass;
pass2:= utl_raw.cast_to_raw(pass2);
dbms_output.put_line('My first conversion :'||pass2);
pass3:=dbms_obfuscation_toolkit.MD5(input=>pass2);
dbms_output.put_line('My second conversion :'||pass3);
end;
