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
    function getColTableWhere(cal, table: string; id: integer): TList<String>;
    function getColTable(cal, table: string): TList<String>;
    function getTableQuest(table, caption: string): String;
    function getTableAnswer(table, caption: string): String;
    function getTableTrue(table, caption: string): String;
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

function AccessConnection.getTableAnswer(table, caption: string): String;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT tableAnswer FROM ' + table + ' WHERE caption="'+caption+'";');
    Open;
    Active := True;
  end;
  result:=ADOQuery.FieldByName('tableAnswer').AsString;
  ADOQuery.Free;
end;

function AccessConnection.getTableQuest(table, caption: string): String;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT tableQuest FROM ' + table + ' WHERE caption="'+caption+'";');
    Open;
    Active := True;
  end;
  result:=ADOQuery.FieldByName('tableQuest').AsString;
  ADOQuery.Free;
end;

function AccessConnection.getTableTrue(table, caption: string): String;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT tableTrue FROM ' + table + ' WHERE caption="'+caption+'";');
    Open;
    Active := True;
  end;
  result:=ADOQuery.FieldByName('tableTrue').AsString;
  ADOQuery.Free;
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

function AccessConnection.getColTableWhere(cal, table: string;
  id: integer): TList<String>;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT ' + cal + ' FROM ' + table + ' WHERE '+IntToStr(id)+';');
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
