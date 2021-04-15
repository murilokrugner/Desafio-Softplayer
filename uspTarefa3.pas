unit uspTarefa3;

interface

uses
  Data.DB, Datasnap.DBClient, System.SysUtils, Vcl.Dialogs;

type
  TTarefa3 = class
  private
    FDs: TDataSource;
    FcdsTemp: TClientDataSet;
    FTotal: Currency;
    FTotalDivisoes: Currency;
    procedure SetTotal(const Value: Currency);
    procedure SetTotalDivisoes(const Value: Currency);
  public
    function carregarDados: TClientDataSet;
    function totalDados: Currency;
    function totalDivisoesDados: Currency;
    property Ds: TDataSource read FDs write FDs;
    property cdsTemp: TClientDataSet read FcdsTemp write FcdsTemp;
    property total: Currency read FTotal write SetTotal;
    property totalDivisoes: Currency read FTotalDivisoes write SetTotalDivisoes;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TTarefa3 }

constructor TTarefa3.Create;
var
  StrField: TStringField;
  IntField: TIntegerField;
begin
  cdsTemp := TClientDataSet.Create(nil);

  Ds := TDataSource.Create(nil);
  Ds.DataSet := cdsTemp;

  IntField := TIntegerField.Create(nil);
  IntField.FieldName := 'IdProjeto';
  IntField.DisplayLabel := 'IdProjeto';
  IntField.DataSet := cdsTemp;

  StrField := TStringField.Create(nil);
  StrField.FieldName := 'NomeProjeto';
  StrField.DisplayLabel := 'NomeProjeto';
  StrField.Size := 25;
  StrField.DataSet := cdsTemp;

  StrField := TStringField.Create(nil);
  StrField.FieldName := 'Valor';
  StrField.DisplayLabel := 'Valor';
  StrField.Size := 25;
  StrField.DataSet := cdsTemp;

  cdsTemp.CreateDataSet;
end;

destructor TTarefa3.Destroy;
begin
  cdsTemp.Free;
  Ds.Free;
end;

procedure TTarefa3.SetTotal(const Value: Currency);
begin
  FTotal := Value;
end;

procedure TTarefa3.SetTotalDivisoes(const Value: Currency);
begin
  FTotalDivisoes := Value;
end;

function TTarefa3.carregarDados: TClientDataSet;
var
  i: integer;
begin
  for i := 1 to 10 do
  begin
    cdsTemp.Append;

    cdsTemp.FieldByName('IdProjeto').AsInteger := i;
    cdsTemp.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(i);
    cdsTemp.FieldByName('Valor').AsString := 'R$' + IntToStr(i) + '0,00';
  end;

  cdsTemp.Open;

end;

function TTarefa3.totalDados: Currency;
var
  total: Currency;
begin
  total := 0;

  with Ds do
  begin
    cdsTemp.First;

    while not cdsTemp.Eof do
    begin
      try
        total := total + StrToCurr(Copy(cdsTemp.FieldByName('Valor').AsString, 3, 5));

        cdsTemp.Next;
      finally
        cdsTemp.EnableControls;
        SetTotal(total);
      end;
    end;
  end;
end;

function TTarefa3.totalDivisoesDados: Currency;
var
  valor, valorAnterior, valorAtual, resultado, total: Currency;
begin
  valor := 0;
  valorAnterior := 0;
  valorAtual := 0;
  resultado := 0;
  total := 0;

  with Ds do
  begin
    cdsTemp.First;

    while not cdsTemp.Eof do
    begin
      if cdsTemp.Bof then
      begin
        valorAtual := StrToCurr(Copy(cdsTemp.FieldByName('Valor').AsString, 3, 5));

        cdsTemp.Next;
      end;

      if (not cdsTemp.Bof) and (valorAnterior = 0) then
      begin
        valor := valorAtual;
        valorAnterior := StrToCurr(Copy(cdsTemp.FieldByName('Valor').AsString, 3, 5));

        total := total + valorAnterior / valor;

      end
      else
      begin
        valor := valorAnterior;
        valorAnterior := StrToCurr(Copy(cdsTemp.FieldByName('Valor').AsString, 3, 5));

        total := total + valorAnterior / valor;

      end;

      cdsTemp.Next;

    end;
    SetTotalDivisoes(total);
  end;
end;

end.

