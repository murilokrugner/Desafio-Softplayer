unit uspComponentesRegistro;

interface

uses
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Classes, SysUtils, Vcl.Dialogs;

type
  TComponentesRegistro = class(TSQLQuery)
    FDQuery: TSQLQuery;
  private

  public
    constructor Create;
    destructor Destroy; override;

    function ExecutarSQL(var sql : string): string;
  end;

implementation

constructor TComponentesRegistro.Create;
begin
  FDQuery := TSQLQuery.Create(self);
end;

destructor TComponentesRegistro.Destroy;
begin
  FDQuery.Free;
end;

function TComponentesRegistro.ExecutarSQL(var sql : string): string;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;

  FDQuery.SQL.Add(sql);

  ShowMessage(sql);

 // FDQuery.Open;
end;

end.

