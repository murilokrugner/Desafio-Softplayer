unit uspTestes;

interface

uses Data.SqlExpr, Data.DB, Forms, Controls, StdCtrls, Classes, SysUtils, Vcl.Dialogs, uspTarefa3;

type
  TTestes = class
  private

  Tarefa3 : TTarefa3;

  FDQuery: TSQLQuery;

  public

  function testeTarefa3Dados: boolean;
  function testeTarefa3DadosDivisoes: boolean;

  function testeTarefa1(value: string): boolean;
  function testeTarefa2(i : Integer): boolean;

  constructor Create;
  destructor Destroy; override;
  end;

implementation

constructor TTestes.Create;
begin
  Tarefa3 := Tarefa3.Create;
end;

destructor TTestes.Destroy;
begin
  Tarefa3.Free;
end;

function TTestes.testeTarefa3Dados:boolean;
begin
  Assert(Tarefa3.totalDados() = 550.00);
end;

function TTestes.testeTarefa3DadosDivisoes: boolean;
begin
  Assert(Tarefa3.totalDivisoesDados() = 11.83);
end;

function TTestes.testeTarefa2(i : Integer): boolean;
begin
  Assert(i = 100);
end;

function TTestes.testeTarefa1(value: string): boolean;
begin
  try
    Result := True;

    FDQuery := TSQLQuery.Create(nil);

   // FDQuery.DataSource := 'Banco'; Conexão com o banco

    FDQuery.Close;

    FDQuery.SQL.Add(value);

    FDQuery.Open;

  except
    on E : Exception do
      begin
         Result := False;

         FDQuery.Free;

         Raise Exception.Create(E.Message);
      end;

  end;
end;

end.
