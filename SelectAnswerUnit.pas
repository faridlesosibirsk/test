unit SelectAnswerUnit;

interface

uses
  ReportUnit,
  AccessConnectionUnit,
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms,
  FMX.Types,
  FMX.Controls,
  System.UITypes;

type
  SelectAnswerClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Report1: Report;
    /// <link>aggregation</link>
    Connection1: Connection;
    GroupBox1: TGroupBox;
    AOwner: TForm;
    CaptionLabel: TLabel;
  public
    constructor create(AOwner: TForm);
    procedure destroy;
    procedure createGroupBox;
  end;

implementation

{ SelectAnswerClass }

constructor SelectAnswerClass.create(AOwner: TForm);
begin
  Report1:= Report.NewInstance;
  Report1.setCurrentQuest(1);
  self.AOwner := AOwner;
  Connection1 := AccessConnection.create;
  AOwner.Caption := Connection1.getColTable('caption', 'report').First;
  createGroupBox;
  Connection1.destroy;
end;

procedure SelectAnswerClass.createGroupBox;
begin
  GroupBox1 := TGroupBox.create(nil);
  CaptionLabel:= TLabel.create(nil);
  with GroupBox1 do
  begin
    Parent := AOwner;
    Text := 'Вопрос';
    Margins.Left:=16;
    Padding.Left:=16;
    Margins.Right:=16;
    Padding.Right:=16;
    Align := TAlignLayout.alVertCenter;
  end;
  with CaptionLabel do
  begin
    Parent := GroupBox1;
    Align:=TAlignLayout.alTop;
    Height:=100;
    Text:=Connection1.getColTable('caption', Report1.getTableQuest).Items[Report1.getCurrentQuest-1];
  end;
end;

procedure SelectAnswerClass.destroy;
begin
  GroupBox1.Parent:=nil;
  CaptionLabel.Parent:=nil;
end;

end.
