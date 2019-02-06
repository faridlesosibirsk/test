unit StartTestUnit;

interface

uses
  AccessConnectionUnit,
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms;

type
  StartTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
    AOwner: TForm;
  public
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm);
    procedure destroy;
  end;

implementation

{ StartTestClass }

constructor StartTestClass.create(AOwner: TForm);
begin
  self.AOwner := AOwner;
  Connection1:= AccessConnection.create;
  AOwner.Caption:=Connection1.getColTable('caption','report').Last;//'StartTestClass';
  Connection1.destroy;
end;

procedure StartTestClass.destroy;
begin

end;
{
procedure StartTestClass.setNotifyEvent(NotifyEvent: TNotifyEvent);
begin

end;
}
end.
