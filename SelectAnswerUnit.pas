unit SelectAnswerUnit;

interface

uses
  BuilserUnit, ConnectionUnit,
  FMX.Forms;

type
  SelectAnswerClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ SelectAnswerClass }

constructor SelectAnswerClass.create(AOwner: TForm);
begin

end;

end.
