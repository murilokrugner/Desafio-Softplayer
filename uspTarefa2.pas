unit uspTarefa2;

interface

uses Forms, Controls, StdCtrls, Classes, SysUtils, Vcl.Dialogs;

type
  TTarefa2 = class(TThread)
  protected
    procedure Execute; override;

  private
    FProgressBarValue1 : Integer;
    FProgressBarValue2 : Integer;

    FThreadProcesso : Integer;

    procedure processarThread();

    procedure SetProgressBarValue1(const Value: Integer);
    procedure SetProgressBarValue2(const Value: Integer);
    procedure SetThreadProcesso(const Value: Integer);

    destructor Destroy; override;

  public
    constructor Create (const CreateSuspended : boolean; const tempo : integer; const processo : integer);

    property ProgressBarValue1: Integer read FProgressBarValue1 write SetProgressBarValue1;
    property ProgressBarValue2: Integer read FProgressBarValue2 write SetProgressBarValue2;
    property ThreadProcesso: Integer read FThreadProcesso write SetThreadProcesso;
  end;

implementation

uses
  ufTarefa2;

constructor TTarefa2.Create(const CreateSuspended: boolean;
  const tempo: integer; const processo : integer);
begin
  SetThreadProcesso(processo);
  Self.FreeOnTerminate  := true;
  inherited Create(CreateSuspended);
end;

destructor TTarefa2.Destroy;
begin
  Free;
end;

procedure TTarefa2.SetProgressBarValue1(const Value: Integer);
begin
  FProgressBarValue1 := Value;
end;

procedure TTarefa2.SetProgressBarValue2(const Value: Integer);
begin
  FProgressBarValue2 := Value;
end;

procedure TTarefa2.SetThreadProcesso(const Value: Integer);
begin
  FThreadProcesso := Value;
end;

procedure TTarefa2.processarThread;
var
  i: Integer;
begin
  if ThreadProcesso = 1 then
    begin
       for i := 0 to 100 do
        begin
          Sleep(StrToInt(fTarefa2.EditTempo1.Text));
          fTarefa2.ProgressBar1.Position := fTarefa2.ProgressBar1.Position + i;

        end;

      ShowMessage('Fim Thread 1');
      fTarefa2.ProgressBar1.Position := 0;

      Terminate;
      WaitFor;
      Free;
    end;

  if ThreadProcesso = 2 then
    begin
       for i := 0 to 100 do
        begin
          Sleep(StrToInt(fTarefa2.EditTempo2.Text));
          fTarefa2.ProgressBar2.Position := fTarefa2.ProgressBar2.Position + i;

        end;

      ShowMessage('Fim Thread 2');
      fTarefa2.ProgressBar2.Position := 0;

      Terminate;
      WaitFor;
      Free;
    end;
end;

procedure TTarefa2.Execute;
begin
  processarThread();
end;

end.

