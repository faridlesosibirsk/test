unit StartTestUnit;

interface

uses
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
  public
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm);
    procedure destroy;
  end;

implementation

{ StartTestClass }

constructor StartTestClass.create(AOwner: TForm);
begin
  AOwner.Caption:='StartTestClass';
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
