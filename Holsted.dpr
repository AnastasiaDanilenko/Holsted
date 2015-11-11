program Holsted;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form_Holsted};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Holsted, Form_Holsted);
  Application.Run;
end.
