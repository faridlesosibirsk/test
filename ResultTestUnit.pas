unit ResultTestUnit;

interface

uses
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms;

type
  ResultTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm);
    procedure destroy;
  end;

implementation

{ ResultTestClass }

constructor ResultTestClass.create(AOwner: TForm);
begin

end;

procedure ResultTestClass.destroy;
begin

end;
{
procedure ResultTestClass.setNotifyEvent(NotifyEvent: TNotifyEvent);
begin

end;
}
end.
