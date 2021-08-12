program OOPBeispielProjekt;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  uClerk in 'uClerk.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
