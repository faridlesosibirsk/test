unit StartTestUnit;

interface

uses
  AccessConnectionUnit,
  classes {TNotifyEvent} ,
  System.Generics.Collections {TDictionary} ,
  BuilserUnit,
  ConnectionUnit,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  System.UITypes;

type
  StartTestClass = class(TInterfacedObject, Builser)
  private
    /// <link>aggregation</link>
    Connection1: Connection;
    AOwner: TForm;
    MainLabel: TLabel;
    backButton: TButton;
    selectButton: TButton;
    backNotifyEvent: TNotifyEvent;
    selectNotifyEvent: TNotifyEvent;
  public
    procedure createCaption;
    //procedure setNotifyEvent(NotifyEvent: TNotifyEvent);
    constructor create(AOwner: TForm; back, select: TNotifyEvent);
    procedure destroy;
  end;

implementation

{ StartTestClass }

constructor StartTestClass.create(AOwner: TForm; back, select: TNotifyEvent);
begin
  self.AOwner := AOwner;
  self.backNotifyEvent:= back;
  self.selectNotifyEvent:= select;
  Connection1:= AccessConnection.create;
  createCaption;
  Connection1.destroy;
end;

procedure StartTestClass.createCaption;
var
  s: string;
begin
  s:=Connection1.getColTable('caption','report').Last;
  MainLabel:= TLabel.create(nil);
  backButton:= TButton.create(nil);
  selectButton:= TButton.create(nil);
  with MainLabel do
    begin
      Parent:=AOwner;
      Align:=TAlignLayout.alCenter;
      Text:=s;
      AutoSize:=true;
      Font.Style:=[TFontStyle.fsBold];
    end;
  with backButton do
    begin
      Parent:=AOwner;
      Text:='< Back';
      Position.X:=100;
      Position.Y:=100;
      OnClick:=backNotifyEvent;
    end;
  with selectButton do
    begin
      Parent:=AOwner;
      Text:='Select >';
      Position.X:=200;
      Position.Y:=100;
      OnClick:=selectNotifyEvent;
    end;
end;

procedure StartTestClass.destroy;
begin
  MainLabel.Parent:=nil;
  backButton.Parent:=nil;
  selectButton.Parent:=nil;
end;
{
procedure StartTestClass.setNotifyEvent(NotifyEvent: TNotifyEvent);
begin

end;
}
end.
