unit ConnectionUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Connection = interface
    function getColTableWhere(cal, table: string; id: integer): TList<String>;
    function getColTable(cal, table: string): TList<String>;
    procedure destroy;
    procedure updateReport(user_id: integer; cal: string);
    function getTableQuest(table, caption: string): String;
    function getTableAnswer(table, caption: string): String;
    function getTableTrue(table, caption: string): String;
  end;

implementation

end.
