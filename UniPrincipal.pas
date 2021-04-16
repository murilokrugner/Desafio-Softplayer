unit UniPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    Tarefas: TMainMenu;
    Tarefa1: TMenuItem;
    Tarefa2: TMenuItem;
    Tarefa3: TMenuItem;
    procedure Tarefa3Click(Sender: TObject);
    procedure Tarefa2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tarefa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  ufTarefa3, ufTarefa2, ufTarefa1;

{$R *.dfm}

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPrincipal.Tarefa1Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa1, fTarefa1);
end;

procedure TFrmPrincipal.Tarefa2Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa2, fTarefa2);
end;

procedure TFrmPrincipal.Tarefa3Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa3, fTarefa3);
end;
end.
