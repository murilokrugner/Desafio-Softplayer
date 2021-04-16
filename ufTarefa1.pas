unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uspQuery,
  Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FMTBcd;

type
  TfTarefa1 = class(TForm)
    Panel1: TPanel;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSql: TLabel;
    MemoColunas: TMemo;
    MemoTabelas: TMemo;
    MemoCondicoes: TMemo;
    MemoSql: TMemo;
    btnGeraSql: TButton;
    SQLQuery1: TSQLQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGeraSqlClick(Sender: TObject);
  private
    { Private declarations }
     Tarefas : TGeraQuery;

  public
    { Public declarations }

  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSqlClick(Sender: TObject);
begin
  Tarefas.GeraSQL();
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa1.FormCreate(Sender: TObject);
begin
  Tarefas := TGeraQuery.Create;
end;

end.
