unit uspQuery;

interface

uses
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Classes, SysUtils, Vcl.Dialogs;

type
  TGeraQuery = class(TSQLQuery)
    spCondicoes: TStringList;
    spColunas: TStringList;
    spTabelas: TStringList;

  private
    FSql: string;
    procedure SetSql(const Value: string);

  public
    constructor Create;
    destructor Destroy; override;
    function GeraSQL: TStringList;
    property Sql: string read FSql write SetSql;
  end;

implementation

uses
  ufTarefa1;

constructor TGeraQuery.Create;
begin
  spCondicoes := TStringList.Create;
  spColunas := TStringList.Create;
  spTabelas := TStringList.Create;
end;

destructor TGeraQuery.Destroy;
begin
  spCondicoes.Free;
  spColunas.Free;
  spTabelas.Free;

  GeraSQL.Free;
end;

procedure TGeraQuery.SetSql(const Value: string);
begin
  FSql := Value;
end;

function TGeraQuery.GeraSQL: TStringList;
var
  i, c, a: Integer;
begin
  fTarefa1.MemoSql.Clear;

  if (fTarefa1.MemoColunas.Lines.Text = '') OR (fTarefa1.MemoTabelas.Lines.Text = '') then
    begin
      ShowMessage('Digite as coluna(s), tabela e condição(es) para gerar o SQL');
      Exit;
    end;

  if fTarefa1.MemoTabelas.Lines.Count > 1 then
    begin
      ShowMessage('É permitido informar somente uma tabela para gerar o SQL');
      Exit;
    end;

  for c := 0 to fTarefa1.MemoCondicoes.Lines.Count - 1 do
    begin
      spCondicoes.Add(fTarefa1.MemoCondicoes.Lines.Strings[c]);
    end;

  for a := 0 to fTarefa1.MemoColunas.Lines.Count - 1 do
    begin
      spColunas.Add(fTarefa1.MemoColunas.Lines.Strings[a]);
    end;

  spTabelas.Add(fTarefa1.MemoTabelas.Lines.Text);

  for i := 0 to spColunas.Count - 1 do
  begin
    if i = 0 then
    begin
      SetSql(Sql + 'SELECT ');
      SetSql(Sql + UpperCase(spColunas[i]));
      Continue;
    end;

    SetSql(Sql + ', ' + UpperCase(spColunas[i]));
  end;

  for i := 0 to spTabelas.Count - 1 do
  begin
    SetSql(Sql + ' FROM ' + UpperCase(spTabelas[i]));
  end;


  for i := 0 to spCondicoes.Count - 1 do
    begin
      if i = 0 then
        begin
          SetSql(Sql + ' WHERE ');
          SetSql(Sql + UpperCase(spCondicoes[i]));
          Continue;
        end;

      SetSql(Sql + ' AND ' + UpperCase(spCondicoes[i]));
    end;

    fTarefa1.MemoSql.Lines.Add(Sql);

    SetSql('');
    spColunas.Clear;
    spTabelas.Clear;
    spCondicoes.Clear;

end;

end.

