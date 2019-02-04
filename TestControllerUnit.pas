unit TestControllerUnit;

interface

uses
  classes {TNotifyEvent} ,
  TestClassUnit,
  FMX.Forms,
  TestInterfaceUnit,
  ControllersUnit;

type
  TestController = class(Controllers)
    /// <link>aggregation</link>
    Test: TestInterface;
  public
    constructor create(AOwner: TForm);
    destructor destroy;
  end;

implementation

{ TestController }

constructor TestController.create(AOwner: TForm);
var
  event: TNotifyEvent;
begin
  Test:= TestClass.create(AOwner);
  for event in Test.OpenTests do
    event(nil);
end;

destructor TestController.destroy;
begin

end;

end.
