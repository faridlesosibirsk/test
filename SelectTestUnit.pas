unit SelectTestUnit;

interface

uses
  ReportUnit,
  System.Generics.Collections {TDictionary} ,
  AccessConnectionUnit,
  BuilserUnit,
  ConnectionUnit,
  FMX.Forms,
  System.Classes,
  FMX.Types,
  FMX.Menus,
  FMX.Controls,
  System.UITypes;

type
  SelectTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Report1: Report;
    /// <link>aggregation</link>
    Connection1: Connection;
    AOwner: TForm;
    NotifyEvent: TNotifyEvent;
    MainPanels: TList<TPanel>;
    MainLabels: TList<TLabel>;
    captionMain: TList<String>;
    MechanicsPanels: TList<TPanel>;
    MechanicsLabels: TList<TLabel>;
    captionMechanics: TList<String>;
    procedure createChapter;
    procedure createMechanics;
    procedure Notify_(Sender: TObject);
  public
    constructor create(AOwner: TForm; NotifyEvent1: TNotifyEvent);
    procedure destroy;
  end;

implementation

{ SelectTestClass }

constructor SelectTestClass.create(AOwner: TForm; NotifyEvent1: TNotifyEvent);
begin
  self.AOwner := AOwner;
  Connection1 := AccessConnection.create;
  self.NotifyEvent:= NotifyEvent1;
  createChapter;
  createMechanics;
  Connection1.destroy;
end;

procedure SelectTestClass.createChapter;
var
  s: string;
  i: integer;
begin
  i := 0;
  MainPanels := TList<TPanel>.create;
  MainLabels := TList<TLabel>.create;
  captionMain := TList<String>.create;
  captionMain := Connection1.getColTable('caption', 'Main');
  for s in captionMain do
  begin
    with MainPanels do
    begin
      Add(TPanel.create(nil));
      Last.Parent := AOwner;
      Last.Width := 250;
      Last.Height := 41;
      Last.Position.X := i * 250;
      Last.Margins.Left := 10;
    end;
    with MainLabels do
    begin
      Add(TLabel.create(MainPanels.Last));
      Last.Parent := MainPanels.Last;
      Last.Align := TAlignLayout.alVertCenter;
      Last.Text := s;
      Last.Font.Style := [TFontStyle.fsBold];
    end;
    i := i + 1;
  end;
end;

procedure SelectTestClass.createMechanics;
var
  s: string;
  i: integer;
begin
  i := 1;
  MechanicsPanels := TList<TPanel>.create;
  MechanicsLabels := TList<TLabel>.create;
  captionMechanics := TList<String>.create;
  captionMechanics := Connection1.getColTable('caption', 'Mechanics');
  for s in captionMechanics do
  begin
    with MechanicsPanels do
    begin
      Add(TPanel.create(nil));
      Last.Parent := AOwner;
      Last.Width := 250;
      Last.Height := 41;
      Last.Position.Y := i * 41;
      Last.Margins.Left := 10;
      Last.HelpKeyword:=s;
      Last.OnClick:=Notify_;
      Last.Cursor:=crHandPoint;
    end;
    with MechanicsLabels do
    begin
      Add(TLabel.create(MechanicsPanels.Last));
      Last.Parent := MechanicsPanels.Last;
      Last.Align := TAlignLayout.alVertCenter;
      Last.Text := s;
    end;
    i := i + 1;
  end;
end;

procedure SelectTestClass.destroy;
var
  p:TPanel;
  l:TLabel;
  s: String;
begin
  for l in MainLabels do
    l.Parent:=nil;
  for p in MainPanels do
    p.Parent:=nil;
  for l in MechanicsLabels do
    l.Parent:=nil;
  for p in MechanicsPanels do
    p.Parent:=nil;
end;

procedure SelectTestClass.Notify_(Sender: TObject);
var
  s: string;
begin
  Connection1 := AccessConnection.create;
  Report1:= Report.NewInstance;
  Report1.setCaptionTest(TPanel(Sender).HelpKeyword);
  Report1.setTableQuest(Connection1.getTableQuest('Mechanics',TPanel(Sender).HelpKeyword));
  Report1.setTableAnswer(Connection1.getTableAnswer('Mechanics',TPanel(Sender).HelpKeyword));
  Report1.setTableTrue(Connection1.getTableTrue('Mechanics',TPanel(Sender).HelpKeyword));
  NotifyEvent(nil);
  //Connection1.destroy;
end;

end.
