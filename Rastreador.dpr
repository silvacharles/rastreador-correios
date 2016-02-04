program Rastreador;

uses
  Forms,
  Urastreador in 'Urastreador.pas' {Frastreador};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rastreador Direto dos Correios';
  Application.CreateForm(TFrastreador, Frastreador);
  Application.Run;
end.
