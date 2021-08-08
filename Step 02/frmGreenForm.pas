unit frmGreenForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TGreenForm = class(TForm)
    shpLight: TShape;
    procedure shpLightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  GreenForm: TGreenForm;

implementation

uses
  MainUnit;

{$R *.dfm}

procedure TGreenForm.shpLightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainForm.SetCurrentClickedColor(clGreen);
end;

end.
