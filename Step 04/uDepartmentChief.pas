unit uDepartmentChief;

interface



uses
  uClerk, Classes;

type
  TDepartmentChief = class(TClerk) // inherite from TClerk
  private
    // the [new] fields
    fDepartmentName  : String;
    fIsAtWork        : Boolean;
    fSpecialEarnings : Real;

    // Getter and Setter
    function getSpecialEarnings : Real;
    procedure setSpecialEarnings( ASpecialEarnings: real);
  public
    // Property
    property SpecialEarnings : Real read getSpecialEarnings
                                    write setSpecialEarnings;

    // simple example for overriding a method
    function getRankTitle: String;

    // could be simple functions because no write-flag neccassary
    function getDepartmentName : String;
    function isAtWork : Boolean;

    constructor Create(AName : String = 'Michael Maier'; AID : Integer = 1;
      ADepartmentName : String = 'Informatik'; AIsAtWork: Boolean = false;
      ASpecialEarnings : Real = 0 ); overload;
    constructor Create(AFileName : String; ALine : Integer); overload;
    constructor Create(AStringList : TStringList; ALine : Integer); overload;
  end;




implementation



constructor TDepartmentChief.Create(AName : String = 'Michael Maier';
  AID : Integer = 1; ADepartmentName : String = 'Informatik';
  AIsAtWork: Boolean = false; ASpecialEarnings : Real = 0 );
begin
  // important: now with parameters!
  inherited Create(AName, AID);
  fDepartmentName  := ADepartmentName;
  fIsAtWork        := AIsAtWork;
  fSpecialEarnings := ASpecialEarnings;
end;


constructor TDepartmentChief.Create(AFileName : String; ALine : Integer);
begin
  // Load File and read Line ALine and split into needed parts
  // and don't forget:
  inherited create;
end;


constructor TDepartmentChief.Create(AStringList : TStringList; ALine : Integer);
begin
  // read Line ALine from AStringList and split into needed parts.
  // and don't forget:
  inherited create;
end;






function TDepartmentChief.getRankTitle: String;
begin
  result := 'Manager';
end;






function TDepartmentChief.getSpecialEarnings : Real;
begin
  result := fSpecialEarnings;
end;


procedure TDepartmentChief.setSpecialEarnings( ASpecialEarnings: real);
begin
  fSpecialEarnings := ASpecialEarnings;
end;




function TDepartmentChief.getDepartmentName : String;
begin
  result := fDepartmentName;
end;



function TDepartmentChief.isAtWork : Boolean;
begin
  result := fIsAtWork;
end;



end.
