unit Unit1;

interface

uses
  ControllersUnit,
  TestControllerUnit,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    /// <link>aggregation</link>
    Controller1: Controllers;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Controller1:= TestController.create(self);
end;

end.
