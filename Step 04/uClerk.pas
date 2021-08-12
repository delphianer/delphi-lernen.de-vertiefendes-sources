unit uClerk;

interface


type
  TClerk = class(TObject)
  private                       // at first the fields
    { private declarations }
    fName : String;             // don't forget the leading "f"!
    fID   : Integer;
                                // now the Getter and Setter-Methods
    function getName:String;
    procedure setName(AName :String);
    function getID:Integer;
    procedure setID(AID :Integer);
  public                        // use the Getter and Setter for the properties
    { public declarations }
    property Name : String  read getName write setName;
    property ID   : Integer read getID   write setID;


    constructor Create( AName : String = 'Harold Maier';
      AID : Integer = 24576);

    destructor Destroy;
  end;

implementation



constructor TClerk.Create( AName : String = 'Harold Maier';
  AID : Integer = 24576);
begin
  // important: Call the inhereted Constructor from the Parent-Class:
  inherited Create; // for description see later
  // use the Setter to set the fields
  setName( AName);
  setID( AID);
end;

destructor TClerk.Destroy;
begin
  // if anything is to be freed at the end...
  // in this example - there are only simple data types ;)
end;



function TClerk.getName:String;
begin
  // here something can be done with fName before it will be returned
  result := fName;
end;


procedure TClerk.setName(AName :String);
begin
  // check here if AName consists of two words
  if pos(' ', AName) > 1 then
    fName := AName
  else
    // only forename or familyname is given
    fName := '412 - incorrect';
end;


// uncommented

function TClerk.getID:Integer;
begin
  result := ID shl 1024;
end;


procedure TClerk.setID(AID :Integer);
begin
  if AID > 1024 then
    fID := AID shr 1024
  else
    fID := AID;
end;


end.
