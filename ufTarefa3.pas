unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uspTarefa3;

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
    procedure BtnTotalDivisoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnTotalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      Tarefas : TTarefa3;
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.BtnTotalClick(Sender: TObject);
begin
   with Tarefas do
    begin
      totalDados();
      EditTotal.Text := FormatFloat('#,0.00', total);
    end;
end;

procedure TfTarefa3.BtnTotalDivisoesClick(Sender: TObject);

begin
  with Tarefas do
    begin
      totalDivisoesDados();
      EditTotalDivisoes.Text := FormatFloat('#,0.00', totalDivisoes);
    end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tarefas.Free;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  Tarefas := TTarefa3.Create;

  with Tarefas do
    begin
      DBGrid.DataSource := Ds;

      carregarDados();
    end;
end;

end.
