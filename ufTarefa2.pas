unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, uspTarefa2;

type
  TfTarefa2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    EditTempo1: TEdit;
    lblTempo: TLabel;
    EditTempo2: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      Thread1 : TTarefa2;
      Thread2 : TTarefa2;
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.Button1Click(Sender: TObject);
begin
  Thread1 := TTarefa2.Create(false,1, 1);

  Thread2 := TTarefa2.Create(false,1, 2);
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
