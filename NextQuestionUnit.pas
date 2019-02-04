unit NextQuestionUnit;

interface

uses
  BuilserUnit, ConnectionUnit,
  FMX.Forms;

type
  NextQuestionClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ NextQuestionClass }

constructor NextQuestionClass.create(AOwner: TForm);
begin

end;

end.
