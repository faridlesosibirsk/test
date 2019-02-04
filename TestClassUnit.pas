unit TestClassUnit;

interface

uses
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
    OpenTestsClass1: OpenTestsClass;
    /// <link>aggregation</link>
    SelectTestClass1: SelectTestClass;
    /// <link>aggregation</link>
    StartTestClass1: StartTestClass;
    /// <link>aggregation</link>
    SelectAnswerClass1: SelectAnswerClass;
    /// <link>aggregation</link>
    NextQuestionClass1: NextQuestionClass;
    /// <link>aggregation</link>
    ResultTestClass1: ResultTestClass;
    AOwner: TForm;
    procedure OpenTests_(Sender: TObject);
    procedure SelectTest_(Sender: TObject);
    procedure StartTest_(Sender: TObject);
    procedure SelectAnswer_(Sender: TObject);
    procedure NextQuestion_(Sender: TObject);
    procedure ResultTest_(Sender: TObject);
  public
    function OpenTests: TList<TNotifyEvent>;
    function SelectTest: TList<TNotifyEvent>;
    function StartTest: TList<TNotifyEvent>;
    function SelectAnswer: TList<TNotifyEvent>;
    function NextQuestion: TList<TNotifyEvent>;
    function ResultTest: TList<TNotifyEvent>;
    constructor create(AOwner: TForm);
  end;

implementation

{ TestClass }

constructor TestClass.create(AOwner: TForm);
begin
  self.AOwner:=AOwner;
end;

function TestClass.NextQuestion: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(NextQuestion_);
end;

procedure TestClass.NextQuestion_(Sender: TObject);
begin
  NextQuestionClass1:= NextQuestionClass.Create(AOwner);
end;

function TestClass.OpenTests: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(OpenTests_);
end;

procedure TestClass.OpenTests_(Sender: TObject);
begin
  OpenTestsClass1:= OpenTestsClass.create(AOwner);
end;

function TestClass.ResultTest: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(ResultTest_);
end;

procedure TestClass.ResultTest_(Sender: TObject);
begin
  ResultTestClass1:= ResultTestClass.create(AOwner);
end;

function TestClass.SelectAnswer: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(SelectAnswer_);
end;

procedure TestClass.SelectAnswer_(Sender: TObject);
begin
  SelectAnswerClass1:= SelectAnswerClass.create(AOwner);
end;

function TestClass.SelectTest: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(SelectTest_);
end;

procedure TestClass.SelectTest_(Sender: TObject);
begin
  StartTestClass1:= StartTestClass.create(AOwner);
end;

function TestClass.StartTest: TList<TNotifyEvent>;
begin
  result:=TList<TNotifyEvent>.create;
  result.add(StartTest_);
end;

procedure TestClass.StartTest_(Sender: TObject);
begin
  StartTestClass1:= StartTestClass.create(AOwner);
end;

end.
