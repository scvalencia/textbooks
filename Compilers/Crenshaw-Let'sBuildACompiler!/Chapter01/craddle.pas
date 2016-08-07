program Cradle;

const
	TAB = ^I;

var
	look : char;

procedure getChar();
begin
	read(look);
end;

procedure error(s : string);
begin
	writeln;
	writeln(^G, 'Error: ', s, '.');
	readln;
	readln;
end;

procedure abort(s : string);
begin
	error(s);
	halt;
end;

procedure expected(s : string);
begin
	abort(s + ' Expected');
end;

procedure match(x : char);
begin
	if look = x then
		getChar()
	else
		expected('''' + x + '''');
end;

function isAlpha(c : char) : boolean;
begin
	isAlpha := UpCase(c) in ['A'..'Z'];
end;

function isDigit(c : char) : boolean;
begin
	isDigit := c in ['0'..'9'];
end;

function getName() : char;
begin
  	if not isAlpha(look) then
    	expected('Name');
  	getName := UpCase(look);
  	getChar;
end;

function GetNum() : char;
begin
  	if not isDigit(look) then
    	expected('Integer');
  	getNum := look;
  	getChar;
end;

procedure emit(s : string);
begin
  	write(TAB, s);
end;

procedure emitln(s : string);
begin
  	emit(s);
  	writeln;
end;

procedure init;
begin
	getChar();
end;

begin
	init;
	readln;
end.