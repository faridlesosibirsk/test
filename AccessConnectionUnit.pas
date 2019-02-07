unit AccessConnectionUnit;

interface

uses
  SysUtils,
  System.Generics.Collections {TDictionary} ,
  Data.DB,
  Data.Win.ADODB,
  ConnectionUnit;

type
  AccessConnection = class(TInterfacedObject, Connection)
  private
    ADOQuery: TADOQuery;
    DataSource: TDataSource;
    ADOConnection: TADOConnection;
    caption: string;
  public
    function getColTable(cal, table: string): TList<String>;
    procedure updateReport(user_id: integer; cal: string);
    procedure destroy;
  published
    constructor create;
  end;

implementation

{ AccessConnection }

constructor AccessConnection.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'Persist Security Info=False';
    Connected := True;
  end;
end;

procedure AccessConnection.destroy;
begin
  ADOConnection.Free;
end;

function AccessConnection.getColTable(cal, table: string): TList<String>;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT ' + cal + ' FROM ' + table + ';');
    Open;
    Active := True;
  end;
  result := TList<String>.create;
  ADOQuery.First;
  While not ADOQuery.Eof do
  begin
    result.add(ADOQuery.FieldByName(cal).AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

procedure AccessConnection.updateReport(user_id: integer; cal: string);
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('INSERT INTO report (user_id, caption, tableQuest, tableAnswer, tableTrue) VALUES (1000, "'
      + cal + '" , "Quest1", "Answer1", "True1");');
    ExecSQL;
  end;
  ADOQuery.Free;
end;

end.
