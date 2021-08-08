unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    tmrGameTimer: TTimer;
    BtnStartGame: TButton;
    BtnQuit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnStartGameClick(Sender: TObject);
    procedure tmrGameTimerTimer(Sender: TObject);
  private
    { Private-Deklarationen }
    fCurrentClickedColor : TColor;
  public
    { Public-Deklarationen }
    procedure SetCurrentClickedColor( AColor: TColor);
  end;

var
  MainForm: TMainForm;

implementation

uses
  frmBlueForm, frmGreenForm, frmRedForm;

{$R *.dfm}




procedure TMainForm.FormCreate(Sender: TObject);
begin
  Left := 250;
  top  := 350;
end;





procedure TMainForm.FormShow(Sender: TObject);
begin
  with RedForm do
  begin
    BorderStyle := bsNone;
    Color       := ClRed;
    Width       := 250;
    Height      := 250;
    Top         := 50;
    Left        := 50;

    shpLight.left        :=100;
    shpLight.top         :=100;
    shpLight.Brush.Color := ClRed;

    Show;
  end;

  with GreenForm do
  begin
    BorderStyle := bsNone;
    Color       := clGreen;
    Width       := 250;
    Height      := 250;
    Top         := 50;
    Left        := 350;

    shpLight.left        :=100;
    shpLight.top         :=100;
    shpLight.Brush.Color := clGreen;

    Show;
  end;

  with BlueForm do
  begin
    BorderStyle := bsNone;
    Color       := clBlue;
    Width       := 250;
    Height      := 250;
    Top         := 50;
    Left        := 650;

    shpLight.left        :=100;
    shpLight.top         :=100;
    shpLight.Brush.Color := clBlue;

    Show;
  end;
end;





procedure TMainForm.BtnStartGameClick(Sender: TObject);
var
  col: TColor;
begin
  // Zufallsfarbe wählen
  case random(3) of
    0: col := clRed;
    1: col := clGreen;
    2: col := clBlue;
  end;

  // Farbe setzen:
  RedForm.shpLight.Brush.Color := col;
  GreenForm.shpLight.Brush.Color := col;
  BlueForm.shpLight.Brush.Color := col;

  // Timer einschalten
  tmrGameTimer.Enabled := true;
end;







procedure TMainForm.SetCurrentClickedColor(AColor: TColor);
begin
  fCurrentClickedColor := AColor;
end;





procedure TMainForm.tmrGameTimerTimer(Sender: TObject);
var
  col: TColor;
begin
  if fCurrentClickedColor = BlueForm.shpLight.Brush.Color then
  begin
    // SetzeNeueZufallsfarbe
    case random(3) of
      0: col := clRed;
      1: col := clGreen;
      2: col := clBlue;
    end;
    RedForm.shpLight.Brush.Color := col;
    GreenForm.shpLight.Brush.Color := col;
    BlueForm.shpLight.Brush.Color := col;

    // VerringereIntervallDesTimersUm100
    tmrGameTimer.Interval := tmrGameTimer.Interval-100;
  end
  else
  begin
    tmrGameTimer.Enabled := false;
    Application.MessageBox( PChar('Du hast ' +
                                IntToStr(4000 -
                                         tmrGameTimer.Interval) +
                                ' Punkte!') ,
                          'Game Over' ,
                          MB_OK+MB_ICONINFORMATION);
  end;
end;

end.
