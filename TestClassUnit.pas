unit TestClassUnit;

interface

uses
  BuilserUnit,
  FMX.Forms,
  OpenTestsUnit,
  SelectTestUnit,
  StartTestUnit,
  SelectAnswerUnit,
  NextQuestionUnit,
  ResultTestUnit,
  System.Generics.Collections {TDictionary} ,
  classes {TNotifyEvent} ,
  TestInterfaceUnit;

type
  TestClass = class(TInterfacedObject, TestInterface)
  private
    /// <link>aggregation</link>
    Builser1: Builser;
    AOwner: TForm;
    procedure OpenTests_(Sender: TObject);
    procedure SelectTest_(Sender: TObject);
    procedure StartTest_(Sender: TObject);
    procedure SelectAnswer_(Sender: TObject);
    procedure NextQuestion_(Sender: TObject);
    procedure ResultTest_(Sender: TObject);
  public
    constructor create(AOwner: TForm);
  end;

implementation

{ TestClass }

constructor TestClass.create(AOwner: TForm);
begin
  self.AOwner := AOwner;
  OpenTests_(nil);
end;

procedure TestClass.NextQuestion_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := NextQuestionClass.create(AOwner);
end;

procedure TestClass.OpenTests_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := OpenTestsClass.create(AOwner, SelectTest_);
end;

procedure TestClass.ResultTest_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := ResultTestClass.create(AOwner);
end;

procedure TestClass.SelectAnswer_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := SelectAnswerClass.create(AOwner);
end;

procedure TestClass.SelectTest_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := SelectTestClass.create(AOwner, StartTest_);
end;

procedure TestClass.StartTest_(Sender: TObject);
begin
  if assigned(Builser1) then
    Builser1.destroy;
  Builser1 := StartTestClass.create(AOwner, SelectTest_, SelectAnswer_);
end;

end.
