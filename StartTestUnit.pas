unit StartTestUnit;

interface

uses
  BuilserUnit, ConnectionUnit,
  FMX.Forms;

type
  StartTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ StartTestClass }

constructor StartTestClass.create(AOwner: TForm);
begin

end;

end.
