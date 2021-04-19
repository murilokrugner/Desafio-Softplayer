program ProvaDelphiApp;

uses
  Vcl.Forms,
  UniPrincipal in 'UniPrincipal.pas' {FrmPrincipal},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  uspTarefa3 in 'uspTarefa3.pas',
  uspTarefa2 in 'uspTarefa2.pas',
  uspTestes in 'uspTestes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
