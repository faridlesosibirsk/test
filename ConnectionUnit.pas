unit ConnectionUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Connection = interface
    function getColTable(cal, table: string): TList<String>;
    procedure destroy;
  end;

implementation

end.
