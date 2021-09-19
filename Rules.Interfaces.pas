unit Rules.Interfaces;

interface

uses
  System.Generics.Collections;

type
 // iRules = interface;

  iRules = interface
    ['{CFDD8C51-9887-4D4B-BF6E-3FE42D56987C}']
    procedure Generate(pId, pOperation : String);
    procedure send(pOperation : String);
  end;


implementation

end.
