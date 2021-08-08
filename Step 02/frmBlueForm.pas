unit frmBlueForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TBlueForm = class(TForm)
    shpLight: TShape;
    procedure shpLightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  BlueForm: TBlueForm;

implementation

uses
  MainUnit;


{$R *.dfm}

procedure TBlueForm.shpLightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainForm.SetCurrentClickedColor(clBlue);
end;

end.
