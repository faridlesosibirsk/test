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
    RadioButtons: TList<TRadioButton>;
  public
    constructor create(AOwner: TForm);
    procedure destroy;
    procedure createGroupBox;
    procedure createRadioButtons;
  end;

implementation

{ SelectAnswerClass }

constructor SelectAnswerClass.create(AOwner: TForm);
begin
  Report1 := Report.NewInstance;
  Report1.setCurrentQuest(1);
  self.AOwner := AOwner;
  Connection1 := AccessConnection.create;
  AOwner.Caption := Report1.getCaptionTest;
  createGroupBox;
  createRadioButtons;
  Connection1.destroy;
end;

procedure SelectAnswerClass.createGroupBox;
begin
  GroupBox1 := TGroupBox.create(nil);
  CaptionLabel := TLabel.create(nil);
  with GroupBox1 do
  begin
    Parent := AOwner;
    Text := 'Вопрос';
    Margins.Left := 16;
    Padding.Left := 16;
    Margins.Right := 16;
    Padding.Right := 16;
    Align := TAlignLayout.alVertCenter;
  end;
  with CaptionLabel do
  begin
    Parent := GroupBox1;
    Align := TAlignLayout.alTop;
    Padding.Top := 16;
    Text := Connection1.getColTable('caption', Report1.getTableQuest)
      .Items[Report1.getCurrentQuest - 1];
    // Report1.setAnswers(Connection1.getColTableWhere('caption', 'Answer1', 1));
    Report1.setAnswers(Connection1.getColTableWhere('caption',
    , 1));
  end;
end;

procedure SelectAnswerClass.createRadioButtons;
var
  s: string;
  i: integer;
begin
  i := 1;
  RadioButtons := TList<TRadioButton>.create;
  for s in Report1.getAnswers do
  begin
    with RadioButtons do
    begin
      Add(TRadioButton.create(GroupBox1));
      Last.Parent := GroupBox1;
      Last.Position.X := 16;
      Last.Position.Y := 16 + 16 * i;
      Last.Text := s;
      i := i + 1;
    end;
  end;
end;

procedure SelectAnswerClass.destroy;
begin
  GroupBox1.Parent := nil;
  CaptionLabel.Parent := nil;
end;

end.
