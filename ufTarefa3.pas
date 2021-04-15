unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfTarefa3 = class(TForm)
    Panel: TPanel;
    DBGrid: TDBGrid;
    BtnTotal: TButton;
    BtnTotalDivisoes: TButton;
    lblTitulo: TLabel;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    EditTotal: TEdit;
    EditTotalDivisoes: TEdit;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnTotalClick(Sender: TObject);
    procedure BtnTotalDivisoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.BtnTotalClick(Sender: TObject);
var
  total : Currency;
begin
  total := 0;

  with DataSource do
    begin
      ClientDataSet.First;

      while not ClientDataSet.Eof do
        begin
          try
             total := total +
               StrToCurr(Copy(ClientDataSet.FieldByName('Valor').AsString, 3, 5));

             ClientDataSet.Next;
          finally
             ClientDataSet.EnableControls;
             EditTotal.Text := FormatFloat('#,0.00', Total);
          end;
        end;
    end;
end;

procedure TfTarefa3.BtnTotalDivisoesClick(Sender: TObject);
var
  valor, valorAnterior, valorAtual, resultado, total : Currency;
begin
  valor := 0;
  valorAnterior := 0;
  valorAtual := 0;
  resultado := 0;
  total := 0;

  with DataSource do
    begin
      ClientDataSet.First;

      while not ClientDataSet.Eof do
        begin
         // try
             if ClientDataSet.Bof then
              begin
                valorAtual := StrToCurr(Copy(ClientDataSet.FieldByName('Valor').AsString, 3, 5));
                ClientDataSet.Next;
              end
             else
              begin

                if not ClientDataSet.Bof then
                  begin
                    if valorAnterior = 0 then
                      begin
                        valor := valorAtual;
                      end
                    else
                      begin
                        valor := valorAnterior;
                      end;

                    valorAnterior := StrToCurr(Copy(ClientDataSet.FieldByName('Valor').AsString, 3, 5));
                    total := total + valorAnterior / valor;
                  end
                else
                  begin
                    valor := valorAtual;

                    valorAnterior := StrToCurr(Copy(ClientDataSet.FieldByName('Valor').AsString, 3, 5));
                    total := total + valorAnterior / valor;

                  end;

                  ClientDataSet.Next;
              end;

             EditTotalDivisoes.Text := FormatFloat('#,0.00', Total);
        end;
    end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet.Free;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);

var
  StrField : TStringField;
  IntField : TIntegerField;

  i : integer;
begin
  IntField := TIntegerField.Create(self);
  IntField.FieldName := 'IdProjeto';
  IntField.DisplayLabel := 'IdProjeto';
  IntField.DataSet := ClientDataSet;

  StrField := TStringField.Create(self);
  StrField.FieldName := 'NomeProjeto';
  StrField.DisplayLabel := 'NomeProjeto';
  StrField.Size := 25;
  StrField.DataSet := ClientDataSet;

  StrField := TStringField.Create(self);
  StrField.FieldName := 'Valor';
  StrField.DisplayLabel := 'Valor';
  StrField.Size := 25;
  StrField.DataSet := ClientDataSet;

  ClientDataSet.CreateDataSet;

  for i := 1 to 10 do
    begin
      ClientDataSet.Append;

      ClientDataSet.FieldByName('IdProjeto').AsInteger := i;
      ClientDataSet.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(i);
      ClientDataSet.FieldByName('Valor').AsString := 'R$' + IntToStr(i) + '0,00';
    end;

  ClientDataSet.Open;

end;

end.
