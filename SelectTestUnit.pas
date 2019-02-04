unit SelectTestUnit;

interface

uses
  BuilserUnit, ConnectionUnit,
  FMX.Forms;

type
  SelectTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ SelectTestClass }

constructor SelectTestClass.create(AOwner: TForm);
begin

end;

end.
