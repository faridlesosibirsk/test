unit ResultTestUnit;

interface

uses
  BuilserUnit, ConnectionUnit,
  FMX.Forms;

type
  ResultTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ ResultTestClass }

constructor ResultTestClass.create(AOwner: TForm);
begin

end;

end.
