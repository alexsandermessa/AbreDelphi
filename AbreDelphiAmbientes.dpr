program AbreDelphiAmbientes;

uses
  Vcl.Forms,
  Windows,
  AbreDelphi in 'AbreDelphi.pas' {FormAbreDelphiAmbientes};

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
