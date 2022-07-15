program AbreDelphiAmbientes;

uses
  Vcl.Forms,
  Windows,
  AbreDelphi in 'AbreDelphi.pas' {FormAbreDelphiAmbientes},

  //############### fontes do Leiaute_reqs início ###############
  pForm in 'Leiaute_reqs\pForm.pas' {FormSistema},
  uAcoes in 'Leiaute_reqs\uAcoes.pas',
  uConstante in 'Leiaute_reqs\uConstante.pas',
  uFormConfig in 'Leiaute_reqs\uFormConfig.pas' {FormConfig},
  uFormPreview in 'Leiaute_reqs\uFormPreview.pas' {FormPreview},
  uFormPrincipal in 'Leiaute_reqs\uFormPrincipal.pas' {FormPrincipal},
  uVersao in 'Leiaute_reqs\uVersao.pas';
  //############### fontes do Leiaute_reqs fim ###############

{$R *.res}

var
  Hwnd : THandle;

begin
  Hwnd := FindWindow('TApplication', 'Atalhos Úteis');

  if Hwnd = 0 then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFormAbreDelphiAmbientes, FormAbreDelphiAmbientes);
  Application.Run;
  end
  else
    SetForegroundWindow(Hwnd);
end.
