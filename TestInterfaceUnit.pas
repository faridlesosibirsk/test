unit TestInterfaceUnit;

interface

uses
  System.Generics.Collections {TDictionary} ,
  classes {TNotifyEvent};

type
  TestInterface = interface
    function OpenTests: TList<TNotifyEvent>;
    function SelectTest: TList<TNotifyEvent>;
    function StartTest: TList<TNotifyEvent>;
    function SelectAnswer: TList<TNotifyEvent>;
    function NextQuestion: TList<TNotifyEvent>;
    function ResultTest: TList<TNotifyEvent>;
  end;

implementation

end.
