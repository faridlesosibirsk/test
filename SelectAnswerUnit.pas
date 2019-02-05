unit SelectAnswerUnit;

interface

uses
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms;

type
  SelectAnswerClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm);
    procedure destroy;
  end;

implementation

{ SelectAnswerClass }

constructor SelectAnswerClass.create(AOwner: TForm);
begin

end;

procedure SelectAnswerClass.destroy;
begin

end;
{
procedure SelectAnswerClass.setNotifyEvent(NotifyEvent: TNotifyEvent);
begin

end;
}
end.
