unit uDepartmentChief;

interface



uses
  uClerk;

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

    // could be simple functions because no write-flag neccassary
    function getDepartmentName : String;
    function isAtWork : Boolean;

    constructor Create(AName : String = 'Michael Maier'; AID : Integer = 1;
      ADepartmentName : String = 'Informatik'; AIsAtWork: Boolean = false;
      ASpecialEarnings : Real = 0 );
  end;




implementation



// ... here the implementation of the other methods!

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
