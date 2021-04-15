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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  ufTarefa3;

{$R *.dfm}

procedure TFrmPrincipal.Tarefa3Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa3, fTarefa3);
   Try
      fTarefa3.ShowModal;
   Finally
      FreeAndnil(fTarefa3);
   End;
end;

end.
