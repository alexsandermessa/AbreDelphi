unit pForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Clipbrd, inifiles, uStringManipulacao,
  Vcl.ComCtrls, uAcoes, System.ImageList, Vcl.ImgList, cxImageList, cxGraphics,
  cxClasses, cxLookAndFeels, dxSkinsForm, dxGDIPlusClasses, uAtributoEnumerado;

type
  TFormSistema = class(TForm)
    StatusBar: TStatusBar;
    BalloonHint: TBalloonHint;
    dxSkinController: TdxSkinController;
    ImageList: TImageList;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { public declarations }
    class function ExecutaSelf: TForm;

  protected
    FAcao: TAcoes;
    FMemoria: string;

  end;

var
  FormSistema: TFormSistema;

implementation

uses
  uConstante, uFormConfig, uVersao;

{$R *.dfm}

procedure TFormSistema.FormDestroy(Sender: TObject);
var
  vArquivoIni: TIniFile;
begin
  vArquivoIni := FAcao.ArquivoIni;
  if Assigned(vArquivoIni) then
    FreeAndNil(vArquivoIni);
end;

class function TFormSistema.ExecutaSelf: TForm;
var
  FormSistema: TFormSistema;
begin
  FormSistema := Self.Create(nil);
  try
    Result := FormSistema;
  finally
    FormSistema.Free;
  end;
end;

procedure TFormSistema.FormCreate(Sender: TObject);
begin
  Caption := TEnumeradoDescricoes.Descricao<TTIpoEnumeradoNomeProjeto>(tenExtenso);
  if Clipboard.AsText <> EmptyStr then
    FMemoria := Clipboard.AsText;

  StatusBar.Panels[0].Text := cTextoNomeComputador + ': ' + FAcao.GetNomeComputador;
  StatusBar.Panels[1].Text := cTextoVersao + ': ' + cVersao;
end;

end.
