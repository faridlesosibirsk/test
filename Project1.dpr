program Project1;

uses
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TestInterfaceUnit in 'TestInterfaceUnit.pas',
  TestClassUnit in 'TestClassUnit.pas',
  OpenTestsUnit in 'OpenTestsUnit.pas',
  SelectTestUnit in 'SelectTestUnit.pas',
  StartTestUnit in 'StartTestUnit.pas',
  SelectAnswerUnit in 'SelectAnswerUnit.pas',
  NextQuestionUnit in 'NextQuestionUnit.pas',
  ResultTestUnit in 'ResultTestUnit.pas',
  ConnectionUnit in 'ConnectionUnit.pas',
  AccessConnectionUnit in 'AccessConnectionUnit.pas',
  BuilserUnit in 'BuilserUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
