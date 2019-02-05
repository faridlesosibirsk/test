unit NextQuestionUnit;

interface

uses
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms;

type
  NextQuestionClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm);
    procedure destroy;
  end;

implementation

{ NextQuestionClass }

constructor NextQuestionClass.create(AOwner: TForm);
begin

end;

procedure NextQuestionClass.destroy;
begin

end;
{
procedure NextQuestionClass.setNotifyEvent(NotifyEvent: TNotifyEvent);
begin

end;
}
end.
