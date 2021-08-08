unit frmRedForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TRedForm = class(TForm)
    shpLight: TShape;
    procedure shpLightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  RedForm: TRedForm;

implementation

uses
  MainUnit;

{$R *.dfm}

procedure TRedForm.shpLightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainForm.SetCurrentClickedColor(clRed);
end;

end.
