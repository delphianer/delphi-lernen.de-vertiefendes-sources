program LittleWindowGame;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  frmRedForm in 'frmRedForm.pas' {RedForm},
  frmBlueForm in 'frmBlueForm.pas' {BlueForm},
  frmGreenForm in 'frmGreenForm.pas' {GreenForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TRedForm, RedForm);
  Application.CreateForm(TBlueForm, BlueForm);
  Application.CreateForm(TGreenForm, GreenForm);
  Application.Run;
end.
