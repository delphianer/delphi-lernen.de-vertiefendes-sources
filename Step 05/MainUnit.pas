unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TICQKontakt = record
    Nick : String[10]; // die Zahl in den Eckigen Klammern gibt
    Vorname : String[25]; // die maximale Größe des "Strings" an!
    Nachname : String[25];
    UIN : Integer;
  end;

  T4ICQKontaktBuch = Array of TICQKontakt;

  TMainForm = class(TForm)
    Label1: TLabel;
    EdNick1: TEdit;
    Label2: TLabel;
    EdVorname1: TEdit;
    Label3: TLabel;
    EdNachname1: TEdit;
    Label4: TLabel;
    EdIcqNummer1: TEdit;
    BtnPrevious: TButton;
    BtnNext: TButton;
    BtnSave: TButton;
    BtnOpen: TButton;
    lblPos: TLabel;
    BtnDelete: TButton;
    BtnNew: TButton;
    procedure BtnNextClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnPreviousClick(Sender: TObject);
  private
    { Private-Deklarationen }
    fICQKontaktBuch : T4ICQKontaktBuch;
    fCurrentIndex   : Integer;

    procedure FelderInsArray;
    procedure ArrayInDieFelder;
    procedure StatusAnzeigen;
  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;


implementation

{$R *.dfm}



procedure TMainForm.FelderInsArray;
begin
  // die Felder erstmal in die aktuelle Position im Array speichern
  fICQKontaktBuch[fCurrentIndex].Nick     := EdNick1.Text;
  fICQKontaktBuch[fCurrentIndex].Vorname  := EdVorname1.Text;
  fICQKontaktBuch[fCurrentIndex].Nachname := EdNachname1.Text;
  fICQKontaktBuch[fCurrentIndex].UIN      := StrToInt( EdIcqNummer1.Text);
end;


procedure TMainForm.ArrayInDieFelder;
begin
  EdNick1.Text      := fICQKontaktBuch[fCurrentIndex].Nick;
  EdVorname1.Text   := fICQKontaktBuch[fCurrentIndex].Vorname;
  EdNachname1.Text  := fICQKontaktBuch[fCurrentIndex].Nachname;
  EdIcqNummer1.Text := IntToStr( fICQKontaktBuch[fCurrentIndex].UIN);
end;


procedure TMainForm.StatusAnzeigen;
begin
    BtnPrevious.Enabled := fCurrentIndex > 0;
    BtnNext.Enabled     := fCurrentIndex < High(fICQKontaktBuch);
    BtnSave.Enabled     := BtnPrevious.Enabled;
    lblPos.Caption      := IntToStr(fCurrentIndex + 1) + ' / '
                           + IntToStr(length(fICQKontaktBuch));
end;




procedure TMainForm.BtnNewClick(Sender: TObject);
begin
  // falls es bereits ein Datensatz gibt, der verändert worden sein könnte
  if (fCurrentIndex >= 0) and (fCurrentIndex <= High( fICQKontaktBuch)) then
  begin
    // Sichern:
    FelderInsArray;
  end;

  //Vergrößern des dynamischen Arrays fICQKontaktBuch
  SetLength( fICQKontaktBuch, Length( fICQKontaktBuch) + 1);

  // fCurrentIndex auf das letzte Element setzen,
  fCurrentIndex := High( fICQKontaktBuch);

  // Da das Feld leer ist - alle Edits leeren,
  EdNick1.Text      := '';
  EdVorname1.Text   := '';
  EdNachname1.Text  := '';
  EdIcqNummer1.Text := '0'; // Aufgrund IntToStr fürs Auslesen muss hier eine 0 stehen
  // Da es evtl. das erste Mal ist, dass Daten geschrieben werden -> Edits freigeben
  EdNick1.Enabled      := true;
  EdVorname1.Enabled   := true;
  EdNachname1.Enabled  := true;
  EdIcqNummer1.Enabled := true;

  // BtnSaveFile wieder aktivieren, da ja jetzt Daten zum Speichern vorhanden sind.
  StatusAnzeigen;
end;






{Click-Procedure des Buttons, der alles speichern soll: }
procedure TMainForm.BtnSaveClick( Sender: TObject);
var
  f : file of TICQKontakt;
  i: Integer;
begin
  FelderInsArray;

  // Dateispeicherort wählen - hier ist es direkt im Verzeichnis, wo die
  // Exe-Datei gespeichert ist:
  AssignFile( f, ExtractFilePath( Application.Exename) + 'demofile.dat');

  // da wir in diesem Fall "neu" speichern wollen, nutzen wir Rewrite() um
  // die Datei komplett zu leeren
  ReWrite( f);

  // nun schreiben wir unser Kontaktbuch in die Datei - Datensatz für Datensatz
  for i := 0 to High(fICQKontaktBuch) do
  begin
    Write( f, fICQKontaktBuch[ i]);
  end;

  // und zu guter Letzt, schließen wir den Zeiger auf die Datei.
  // das ermöglicht, dass ein anderes Programm auf die Datei zugreifen kann :)
  CloseFile( f);
end;





procedure TMainForm.FormCreate(Sender: TObject);
begin
  fCurrentIndex := -1;
end;




{ Click-Procedure des Buttons, der alles laden soll: }
procedure TMainForm.BtnOpenClick(Sender: TObject);
var
  f : file of TICQKontakt;
begin
  // auch hier definieren wir erst den Zeiger auf die Datei
  AssignFile( f, ExtractFilePath( Application.Exename) + 'demofile.dat');

  // nun stellen wir sicher, dass der Zeiger auf den Anfang zeigt
  ReSet( f);
  // und setzen alles zurück
  fCurrentIndex := -1;
  SetLength(fICQKontaktBuch, 0);

  // Und jetzt lesen wir unser Kontaktbuch aus der Datei,
  // wieder Datensatz für Datensatz
  while not eof(f) do
  begin
    SetLength(fICQKontaktBuch, length(fICQKontaktBuch)+1);
    Inc(fCurrentIndex);
    Read( f, fICQKontaktBuch[ fCurrentIndex]);
  end;

  // Wie oben, alles wieder schließen
  CloseFile( f);

  // und die Anzeige aktualisieren
  StatusAnzeigen;
  ArrayInDieFelder;
end;





procedure TMainForm.BtnPreviousClick(Sender: TObject);
begin
  FelderInsArray;

  // sofern es weiter runter geht
  if fCurrentIndex > 0 then
  begin
    // den Index runterzählen
    fCurrentIndex := fCurrentIndex-1;

    // die entsprechenden Werte aus dem Array in die Felder wieder eintragen
    ArrayInDieFelder;

    // und die Anzeige aktualisieren
    StatusAnzeigen;
  end;
end;






procedure TMainForm.BtnNextClick( Sender: TObject);
begin
  FelderInsArray;

  // wenn es weiter hoch gehen kann:
  if fCurrentIndex < High(fICQKontaktBuch) then
  begin
    fCurrentIndex := fCurrentIndex + 1;

    ArrayInDieFelder;

    StatusAnzeigen;
  end;
end;






end.
