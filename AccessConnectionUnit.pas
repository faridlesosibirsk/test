unit AccessConnectionUnit;

interface

uses
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
  public
    function getColTable(cal, table: string): TList<String>;
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
      'Data Source=Phisics.accdb;' +
      'Persist Security Info=False';
    Connected := True;
  end;
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
  Result := TList<String>.create;
  ADOQuery.First;
  While not ADOQuery.Eof do
  begin
    Result.add(ADOQuery.FieldByName(cal).AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;



end.
