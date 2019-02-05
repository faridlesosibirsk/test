unit BuilserUnit;

interface

uses
  System.Generics.Collections {TDictionary} ,
  classes {TNotifyEvent};

type
  Builser = interface
    //procedure setNotifyEvent(NotifyEvent1: TNotifyEvent);
    procedure destroy;
  end;

implementation

end.
