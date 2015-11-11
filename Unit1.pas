unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, math;

type
  TArrSt = array of string;
  TOperand = record
          operand: string;
          count: integer;
  end;
  TArrOp = array of TOperand;
  TArrInt = array of integer;
  TForm_Holsted = class(TForm)
    Memo_Text: TMemo;
    Label_Text: TLabel;
    Button_Download: TButton;
    Panel_Holsted: TPanel;
    Label_Basic: TLabel;
    Label_Unic_Operators: TLabel;
    Label_Unic_Operands: TLabel;
    Label_Amount_Operators: TLabel;
    Label_Amount_Operands: TLabel;
    Label_Enterings_Operator: TLabel;
    Label_Enterings_Operand: TLabel;
    Label_Composite: TLabel;
    Label_Vocabulary: TLabel;
    Label_Length: TLabel;
    Label_Volume: TLabel;
    OpenDialog1: TOpenDialog;
    Memo_output: TMemo;
    Label_teor_length: TLabel;
    Label_level: TLabel;
    Label_level_progr: TLabel;
    Label_intellect: TLabel;
    Label_difficulty: TLabel;
    procedure Button_DownloadClick(Sender: TObject);
    function create_array: TArrSt;
    function find_define(operands: TArrOp; text: TArrSt): TArrOp;
    procedure output_operands(operands:TArrOp);
    function Find_functions(text: TArrSt; operators: TArrOp):TArrOp;
    function find_standart(operators: TArrOp):TArrOp;
    procedure output_operators(operators:TArrOp);
    procedure parameters(operators, operands: TArrOp);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Holsted: TForm_Holsted;

implementation

{$R *.dfm}

function load_default: TArrSt;
var
  i, count: integer;
  text: textfile;
  default: TArrSt;
  buffer: string;
begin
    assignfile(text, 'operators.txt');
    reset(text);
    count := 1;
    setlength(default, count);
    while not eof(text) do
    begin
        readln(text, buffer);
        default[count - 1] := buffer;
        inc(count);
        setlength(default,count);
    end;
    setlength(default,count - 1);
    closefile(text);
    result := default;
end;

function decap_line(line: string):TArrSt;
var
  i, count, current: integer;
  buffer: string;
  array_line: TArrSt;
begin
    i := 1;
    count := 1;
    setlength(array_line, count);
  while I <= length(line) do
  begin
    buffer := '';
    current := i;
    while line[current] <> ' '  do
     begin
      if (line[current - 1] + line[current] = '//') or (line[current] = '#') then
      begin
        buffer := buffer + line[current];
        break;
      end
      else
      begin
      buffer := buffer + line[current];
      inc(current);
      end;

      if current > length(line) then
         break;
     end;
    i := current + 1;
    array_line[count - 1] := buffer;
    inc(count);
    setlength(array_line, count);
  end;
  setlength(array_line, count - 1);
  result := array_line;
end;

function concat_arrays(text, new: TArrSt): TArrSt;
var
  i, lgth, j, new_l: integer;
  buf: TArrSt;
begin
   lgth := length(text);
   if lgth = 0 then
   begin
     lgth := length(new);
     setlength(text, lgth);
     text := new;
   end
   else
   begin
     lgth := length(text) + length(new);
     new_l := length(text);
     setlength(text, lgth);
     buf := new;
     j := 0;
     for i := new_l to lgth - 1  do
     begin
         text[i] := new[j];
         inc(j);
     end;
   end;
   result := text;
end;

function TForm_Holsted.create_array: TArrSt;
const
  comment = '*/';
var
  i, length_text, n, m: integer;
  from_line, array_text: TArrSt;
  line: string;
begin
  length_text := Memo_Text.lines.count;
  i := 0;
  While I < length_text - 1 do
  begin
    if memo_text.lines[i] <> '' then
    begin
      line := memo_text.Lines[i];
      n := pos(comment, line);
      if (n = 0) then
      begin
        from_line := Decap_Line(memo_text.Lines[i]);
        array_text := concat_arrays(array_text, from_line);
      end
      else
      begin
          setlength(from_line,1);
          from_line[0] := comment;
          array_text := concat_arrays(array_text, from_line);
          m := pos(comment, line);
          while m = 0 do
          begin
              inc(i);
              line := memo_text.Lines[i];
              m := pos(comment, line);
          end;
        setlength(from_line,1);
        from_line[0] := comment;
        array_text := concat_arrays(array_text, from_line);
    end;
    end;
    inc(i);
  end;
  result := array_text;
end;

function find_doubles(operands: TArrOp; line: string): integer;
var
  length_array, find: integer;
begin
  length_array := length(operands);
  for find := 0 to length_array - 1 do
  begin
     if operands[find].operand = line then
         break;
  end;
  if find  = length_array then
       find := -1;
  result := find;
end;


function test_string(line: string): string;
const
  dividers: set of char = [',', ';', '(', ')', '+', '-'];
var
  i, j, length_array : integer;
  new_line: string;
begin
  length_array := length(line);
  j := 1;
  setlength(new_line, j);
  for i := 1 to length_array do
  begin
    if line[i] in dividers then
         line[i] := line[i]
    else
    begin
      new_line[j] := line[i];
      inc(j);
      setlength(new_line, j);
    end;
  end;
  setlength(new_line, j - 1);
  result := new_line;
end;

function include_new(operands: TArrop; text: string): TArrOp;
var
  j, place: integer;
  test_str : string;
begin
   j := length(operands);
   test_str := test_string(text);
   if j = 0 then
   begin
     setlength(operands, 1);
     operands[j].operand := test_str;
     operands[j].count := 1;
   end
   else
   begin
      place := find_doubles(operands, test_str);
      if place = -1 then
      begin
        inc(j);
        setlength(operands, j);
        operands[j - 1].operand := test_str;
        operands[j - 1].count := 1;
      end
      else
      begin
        operands[place].count := operands[place].count + 1;
      end;
   end;
   result := operands;
end;

function include_new_operator(operands: TArrop; text: string): TArrOp;
var
  j, place: integer;
  test_string : string;
begin
   j := length(operands);
   test_string := text;
   if j = 0 then
   begin
     setlength(operands, 1);
     operands[j].operand := test_string;
     operands[j].count := 1;
   end
   else
   begin
      place := find_doubles(operands, test_string);
      if place = -1 then
      begin
        inc(j);
        setlength(operands, j);
        operands[j - 1].operand := test_string;
        operands[j - 1].count := 1;
      end
      else
      begin
        operands[place].count := operands[place].count + 1;
      end;
   end;
   result := operands;
end;

function find_letter(line:string):integer;
const
  delimeters: set of char = ['(', ')', '[', ']', '<'];
  alfabet: set of char = ['A'.. 'Z', 'a'.. 'z'];
var
  i, lgth, j: integer;
  found: char;
begin
  i := pos('$', line);
  if (line[i-1] in delimeters) then
  begin
      result := i - 1;
  end
  else
  begin
    for j := i to length(line) do
        if line[j] in delimeters then
           break;

    result := j;
  end;
end;


function test_line(line: string): string;
const
  delimeters: set of char = ['(', ')', '[', ']', '<', ',', '.'];
  alfabet: set of char = ['A'.. 'Z', 'a'.. 'z'];
var
  i, lgth: integer;
  buffer: string;
begin
  buffer := line[1];
  for i := 2 to length(line) do
  begin
      if line[i] in alfabet then
          buffer := buffer + line[i]
      else
          break;
  end;
  result := buffer;

end;

Function look(line: string; count: integer; operands: TArrOp): TArrOp;
var
  copy_string: string;
  letter: integer;
  i,  lgth, j, argh, amount: integer;
begin
           while count <> 0 do
           begin
              letter := find_letter(line);
              if letter <> 0 then
               begin
                  if letter < count then
                  begin
                      copy_string := copy(line, count, length(line) - letter);
                      copy_string := test_line(copy_string);
                  end
                  else
                  begin
                      copy_string := copy(line, count, letter - count);
                      copy_string := test_line(copy_string);
                  end;
                  if copy_string <> '' then
                      operands := include_new(operands, copy_string);
                  if count > 1 then
                     delete(line, 1, count + 1)
                  else
                      delete(line, count, letter);
                  count := pos('$', line);
               end
               else
               begin
                  operands := include_new(operands, line);
                  count := 0;
               end;
           end;
           result := operands;
 end;

function find_operands(text: TArrSt): TArrOp;
var
  operands: TArrOp;
  copy_string, line: string;
  letter: char;
  i,j,  count: integer;
begin
    j := 0;
    setlength(operands, j);
   for i := 0 to length(text) - 1 do
   begin
       count := pos('$', text[i]);
       if count <> 0 then
          operands := look(text[i], count, operands);

   end;
   result := operands;
end;


function numbers(operands: TArrOp; line: string; text:TArrSt): TArrOp;
const
  numbers: set of char = ['0'..'9'];
var
  i, length_array, j, len, curr: integer;
  buf: string;
begin
  length_array := length(line);
  i := 1;
  While  i <= length_array do
  begin
    buf := '';
    j := 0;
    curr := i;
    while line[curr] <> ' ' do
    begin
      if (line[curr] in numbers) then
      begin
         inc(j);
         buf := buf + line[curr];
       end;
       inc(curr);
       if curr >= length_array then
          break;
       end;
    if buf <> '' then
    begin
         j := find_doubles(operands, buf);
       if j = -1 then
       begin
         length_array := length(operands);
          setlength(operands, length_array+1);
          operands[length_array].operand := buf;
          operands[length_array].count := 1;
       end
       else
           operands[j].count :=  operands[j].count + 1;
    end;
    i := curr;
  end;
  result := operands;
end;

function const_strings(operands: TArrOp; line: string): TArrOp;
const
  symbol_str = '"';
var
  i, found, new_found: integer;
  copy_string: string;
begin
  found := pos(symbol_str, line);
  if found <> 0 then
  begin
     copy_string := copy(line, found, length(line));
     delete(line, 1, found - 1);
     new_found := pos(symbol_str, line);
     delete(copy_string, new_found, length(line));
     operands := include_new(operands, copy_string);
  end;
  result := operands;
end;

function find_inlines(operands: TArrOp; text: TArrSt; sign_to_choose_constantfinder: integer): TArrOp;
const
  symbol_line = '"';
var
  i, length_array, found, new_found: integer;
  copy_string, line: string;
begin
  length_array := length(text);
  i := 0;
  while I < length_array - 1 do
  begin
    if sign_to_choose_constantfinder = 1 then
    begin
      if (text[i] <> '') then
      begin
        line := text[i];
        found := pos(symbol_line, line);
        if found <> 0 then
          begin
          copy_string := copy(line, found + 1, length(line));
          delete(line, 1, found);
          new_found := pos(symbol_line, line);
          if new_found <> 0 then
          begin
            delete(copy_string, new_found, length(copy_string) - 1);
            operands := include_new(operands, copy_string);
          end
          else
          begin
            while new_found = 0 do
            begin
                inc(i);
                copy_string := copy_string + text[i];
                new_found := pos(symbol_line, copy_string);
            end;
            delete(copy_string, new_found, length(copy_string) - (new_found - 1));
            operands := include_new(operands, copy_string);
          end;
        end;
      end;
    end
    else
    begin
      if (text[i] <> '')  then
        operands := numbers(operands, text[i], text);
    end;
    inc(i);
  end;
  result := operands;
end;

function TForm_Holsted.find_define(operands: TArrOp; text: TArrSt): TArrOp;
const
  define_string = 'define';
  symbol_string= '"';
var
  i, found, new_found: integer;
  line, copy_string: string;
begin
   for i := 0 to memo_text.lines.count - 1 do
   begin
     if (length(define_string) < length(memo_text.lines[i])) then
     begin
        line := memo_text.lines[i];
        found := pos(define_string, line);
        if found <> 0 then
        begin
          found := pos(symbol_string, line);
          copy_string := copy(line, found + 1, length(line));
          delete(line, 1, found);
          new_found := pos(symbol_string, line);
          delete(copy_string, new_found, length(copy_string) - 1);
          operands := include_new(operands, copy_string);
        end;
     end;
   end;
   result := operands;
end;

procedure TForm_Holsted.output_operands(operands: TArrOp);
var
  i, length_array, amount: integer;
begin
   length_array := length(operands);
   amount := 0;
   label_unic_Operands.caption :=label_unic_Operands.caption + ' ' + inttostr(length_array);
   for I :=  0 to length_array - 1 do
   begin
       amount := amount + operands[i].count;
       memo_output.Lines.Add('������� ' + operands[i].operand + ' ����������� � ���� ' + inttostr(operands[i].count) + ' ���');
   end;
   label_Amount_Operands.caption := label_Amount_Operands.Caption  + ' ' + inttostr(amount);
end;

function test_operator(line: string; symb: string; found: integer; doubled_operators: TArrSt): integer;
var
  i, j, position, sign_found_double: integer;
begin
  sign_found_double := 0;
  for i := 0 to length(doubled_operators) - 1 do
  begin
     position := pos(doubled_operators[i], line);
     if (position <> 0)  then
     begin
      if doubled_operators[i] <> symb then
      begin
        sign_found_double := length(doubled_operators[i]);
        break;
      end
     end;
  end;
  result := sign_found_double;
end;

function create_double:TArrSt;
var
  file_doubled_operators: textfile;
  i: integer;
  doubled_operators: TArrSt;
begin
  assignfile(file_doubled_operators, 'doubled.txt');
  reset(file_doubled_operators);
  i := 1;
  setlength(doubled_operators,i);
  while not eof(file_doubled_operators) do
  begin
     readln(file_doubled_operators, doubled_operators[i-1]);
     inc(i);
     setlength(doubled_operators,i);
  end;
  dec(i);
  setlength(doubled_operators,i);
  closefile(file_doubled_operators);
  result := doubled_operators;
end;

function look_operators(buffer: string; operators: TArrOp; array_operators: TArrSt): TArrOp;
var
  i,j, found_symbol, test_position: integer;
  doubled_operators : TArrSt;
  line: string;
begin
  doubled_operators := create_double;
  for i := 0 to length(array_operators) - 1 do
  begin
      line := buffer;
     found_symbol := pos(array_operators[i], line);
       while found_symbol <> 0 do
       begin
         test_position := test_operator(line, array_operators[i], found_symbol, doubled_operators);
         if test_position = 0 then
         begin
            operators := include_new_operator(operators, array_operators[i]);
            test_position := length(line);
            delete(line, 1, test_position);
            found_symbol := pos(array_operators[i], line);
         end
         else
         begin
            found_symbol := 0;
         end;
       end;
  end;
  result := operators;
end;

function find_operators(array_text, array_operators:TArrst):TArrOp;
var
  i, count: integer;
  operators: TArrOp;
begin
   for I := 0 to length(array_text) - 1 do
   begin
      if array_text[i] <> '' then
         operators := look_operators(array_text[i], operators, array_operators);
   end;
   result :=  operators;
end;

function search_functions( operators: TArrOp; line:string):TArrOp;
const
  key_word =  'function';
  length_function = 9;
var
  found, ending:integer;
  buffer: string;
begin
  found := pos(key_word, line);
  buffer := '';
  if found <> 0 then
  begin
    ending := pos('(', line);
    buffer := copy(line, found + length_function, ending - found - length_function);
    operators := include_new(operators, buffer);
  end;
   result := operators;
end;

function TForm_Holsted.Find_functions(text: TArrSt; operators: TArrOp):TArrOp;
var
   i: integer;
begin
    for I := 0 to memo_text.lines.count - 1 do
    begin
      if memo_text.lines[i] <> '' then
         operators := search_functions(operators, memo_text.lines[i]);
    end;
    result := operators;
end;

function clear_str(given_string: string):string;
var
  position: integer;
begin
  position := pos(' ', given_string);
  while position <> 0 do
  begin
    delete(given_string,1,position);
    position := pos(' ', given_string);
  end;
  result := given_string;
end;


function search_standart(operators: TArrOp; line: string):TArrOp;
var
  i, find : integer;
  needed_string: string;
begin
  find := pos('(', line);
  while find <> 0  do
  begin
     needed_string := copy(line, 1, find-1);
     delete(line, 1, find);
     needed_string := clear_str(needed_string);
     operators := include_new( operators, needed_string);
     find := pos('(', line);
  end;
  result := operators;
end;

function TForm_Holsted.find_standart(operators: TArrOp):TArrOp;
var
  i: integer;
begin
    for I := 0 to memo_text.lines.count - 1 do
    begin
      if memo_text.lines[i] <> '' then
         operators := search_standart(operators, memo_text.lines[i]);
    end;
    result := operators;
end;

procedure TForm_Holsted.output_operators(operators:TArrOp);
var
  amount, i, count: integer;
begin
   amount := length(operators);
   count := 0;
   label_unic_Operators.caption :=  label_unic_Operators.caption + inttostr(amount);
   for I :=  0 to amount - 1 do
   begin
       count := count + operators[i].count;
       memo_output.Lines.Add('�������� ' + operators[i].operand + ' ����������� � ���� ' + inttostr(operators[i].count) + ' ���');
   end;
   label_Amount_operators.caption :=  label_Amount_operators.caption + ' ' + inttostr(count);
end;

procedure TForm_Holsted.parameters(operators, operands: TArrOp);
var
  volume, theoretical_length, level, sh_volume, level_progr, intellect, difficulty: real;
  i, vocabulary, count, length_progr, amount, length_operators: integer;
begin
   vocabulary := length(operators) + length(operands);
   label_vocabulary.Caption := label_vocabulary.Caption + ' ' +  inttostr(vocabulary);
   amount := length(operators);
   for I :=  0 to amount - 1 do
       count := count + operators[i].count;
   length_operators := length_operators + count;
   count := 0;
    amount := length(operands);
   for I :=  0 to amount - 1 do
       count := count + operands[i].count;
   length_progr := length_progr + count;
   label_length.Caption :=  label_length.Caption + ' ' +  inttostr(length_operators);
   volume := vocabulary * (Ln(length_operators)/Ln(2));
   label_volume.Caption :=  label_volume.Caption + ' ' + floattostrF(volume, fffixed, 6,2);
   theoretical_length := (length(operators)*(Ln(length(operators))/Ln(2))) + ((length(operands)*(Ln(length(operands))/Ln(2))));
   label_teor_length.Caption := '������������� �����: ' + floattostrf(theoretical_length, fffixed, 6, 2);
   sh_volume :=  (length(operands)) + 1;
   level := sh_volume * (Ln(sh_volume))/Ln(2);
   label_level.Caption := '������������� ����� ���������: ' + floattostrf(level, fffixed, 6, 2);
   level_progr := sh_volume/volume;
   label_level_progr.Caption := '������� ���������: '+ floattostrf(level_progr, fffixed, 6,2);
   intellect := sh_volume * (Ln(sh_volume))/Ln(2);
   label_intellect.Caption := '������������������ ���������: ' + floattostrf(intellect, fffixed, 6, 2);
   difficulty := volume*volume/intellect;
   label_difficulty.Caption := '������� ��������� ���������:  ' + floattostrf(difficulty, fffixed, 6, 2);
end;

procedure TForm_Holsted.Button_DownloadClick(Sender: TObject);
var
  array_operators, array_text: TArrSt;
  operands, operators: TArrOp;
begin
  array_operators := load_default;
  if opendialog1.execute then
      memo_text.Lines.LoadFromFile(opendialog1.filename);
  array_text := create_array;
  operands := find_operands(array_text);
  operands := find_inlines(operands, array_text, 1);
  output_operands(operands);
  operators := find_operators(array_text, array_operators);
  operators := find_functions(array_text, operators);
  operators := find_standart(operators);
  output_operators(operators);
  parameters(operators, operands);
end;

end.
