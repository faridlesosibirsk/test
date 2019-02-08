unit ReportUnit;

interface

uses
  System.Generics.Collections {TDictionary} ,
  DateUtils,
  SysUtils;

type
  Report = class
  private
    nameUser: string;
    captionTest: string;
    timeStart: TDateTime;
    currentQuest: integer;
    tableQuest: string;
    tableAnswer: string;
    tableTrue: string;
    Answers: TList<String>;
  strict private
    class var
    /// <link>aggregation</link>
      instance: Report;
  public
    procedure setUserName(nameUser: string);
    procedure setCaptionTest(captionTest: string);
    procedure setTimeStart(timeStart: TDateTime);
    procedure setCurrentQuest(currentQuest: integer);
    procedure setTableQuest(tableQuest: string);
    procedure setTableAnswer(tableAnswer: string);
    procedure setTableTrue(tableTrue: string);
    procedure setAnswers(Answers: TList<String>);
    function getCurrentQuest: integer;
    function getTableQuest: string;
    function getCaptionTest: string;
    function getAnswers: TList<String>;
    class function NewInstance: Report;
  end;

implementation

{ Report }

function Report.getAnswers: TList<String>;
begin
  result:=Answers;
end;

function Report.getCaptionTest: string;
begin
  result:=captionTest;
end;

function Report.getCurrentQuest: integer;
begin
  result:=currentQuest;
end;

function Report.getTableQuest: string;
begin
  result:=tableQuest;
end;

class function Report.NewInstance: Report;
begin
  if not assigned(instance) then
    instance := Report(inherited NewInstance);
  result := instance;
end;

procedure Report.setUserName(nameUser: string);
begin
  self.nameUser:=nameUser;
end;

procedure Report.setAnswers(Answers: TList<String>);
begin
  self.Answers:=Answers;
end;

procedure Report.setCaptionTest(captionTest: string);
begin
  self.captionTest:=captionTest;
end;

procedure Report.setCurrentQuest(currentQuest: integer);
begin
  self.currentQuest:=currentQuest;
end;

procedure Report.setTableAnswer(tableAnswer: string);
begin
  self.tableAnswer:=tableAnswer;
end;

procedure Report.setTableQuest(tableQuest: string);
begin
  self.tableQuest:=tableQuest;
end;

procedure Report.setTableTrue(tableTrue: string);
begin
  self.tableTrue:=tableTrue;
end;

procedure Report.setTimeStart(timeStart: TDateTime);
begin
  self.timeStart:=timeStart;
end;

end.
