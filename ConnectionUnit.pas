unit ConnectionUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Connection = interface
    function getColTable(cal, table: string): TList<String>;
  end;

implementation

end.

