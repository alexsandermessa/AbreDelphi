unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, pForm, uAcoes, Clipbrd,
  cxImageList, cxGraphics, cxClasses, cxLookAndFeels, dxSkinsForm, dxBar,
  uDevExBarControlsDTC, cxLookAndFeelPainters, Vcl.Menus, cxButtons,
  uComponentesControleAcesso, uImagensDTC, ShellApi;

type
  TFormPrincipal = class(TFormSistema)
    MemoTexto: TMemo;
    BitBtnDTCPreview: TBitBtnDTC;
    BitBtnDTCClear: TBitBtnDTC;
    BitBtnDTCConfig: TBitBtnDTC;
    BitBtnDTCSuporte: TBitBtnDTC;
    BitBtnDTCHistorico: TBitBtnDTC;
    procedure FormCreate(Sender: TObject);
    procedure MemoTextoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnDTCPreviewClick(Sender: TObject);
    procedure BitBtnDTCClearClick(Sender: TObject);
    procedure BitBtnDTCConfigClick(Sender: TObject);
    procedure BitBtnDTCSuporteClick(Sender: TObject);
    procedure BitBtnDTCHistoricoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FHistorico: TStringList;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uConstante, uFormConfig, uVersao, uFormPreview, uFormHistorico;

{$R *.dfm}

procedure TFormPrincipal.BitBtnDTCHistoricoClick(Sender: TObject);
var
  vHistorico: TFormHistorico;
begin
  inherited;
  if Assigned(FHistorico) then
  begin
    vHistorico := TFormHistorico.Create(Self);

    try
      vHistorico.MemoHistorico.Lines := FHistorico;
      vHistorico.ShowModal;
    finally
      vHistorico.Free;
    end;
  end
  else
    Application.MessageBox('Nenhum histórico para mostrar!', cAtencao, MB_ICONWARNING);

end;

procedure TFormPrincipal.BitBtnDTCClearClick(Sender: TObject);
begin
  inherited;
  MemoTexto.Clear;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName) + cArquivoConfig) then
  begin
    FAcao.GravaNome(FAcao.GetNomeComputador);
    FAcao.GravaOpcaoTipoTexto(0);
    FAcao.GravaOpcaoFormatoData(0);
    FAcao.GravaOpcaoPosicaoTexto(0);
    FAcao.GravaOpcaoCor(0);
    FAcao.GravaSkinName(1);
  end;

  if FAcao.LerOpcaoCor = 1 then
    MemoTexto.Color := clWindow;

  dxSkinController.SkinName := FAcao.LerSkinName;

  if not FAcao.ProgramaRodando('Suporte.exe') then
    begin
      BitBtnDTCSuporte.Visible := True;
      BitBtnDTCSuporte.Left    := BitBtnDTCPreview.Left + 45;
      BitBtnDTCPreview.Left    := BitBtnDTCPreview.Left - 40;
      BitBtnDTCClear.Left := BitBtnDTCClear.Left + 45;
      BitBtnDTCHistorico.Left := BitBtnDTCHistorico.Left + 45;
      BitBtnDTCConfig.Left := BitBtnDTCConfig.Left + 45;
    end;

  BitBtnDTCSuporte.Caption := cTextoSuporte;
  BitBtnDTCPreview.Caption := cTextoPreview;
  BitBtnDTCConfig.Caption  := cTextoConfig;
  BitBtnDTCClear.Caption   := cTextoLimpar;
  BitBtnDTCHistorico.Caption := cTextoHistorico;
  BitBtnDTCSuporte.Hint    := cTextoSuporte + ': Abrir o suporte';
  BitBtnDTCPreview.Hint    := cTextoPreview + ': Mostra o texto formatado antes da sua forma final';
  BitBtnDTCClear.Hint      := cTextoLimpar + ': Limpa o campo de texto para nova digitação';
  BitBtnDTCConfig.Hint     := cTextoConfig + ': Configuração do sistema';
  BitBtnDTCHistorico.Hint := cTextoHistorico + ': Mostrar o histórico da ' + cTextoPreview + ' .';
end;

procedure TFormPrincipal.BitBtnDTCConfigClick(Sender: TObject);
begin
  FormConfig := TFormConfig.Create(self);
  try
    FormConfig.ShowModal;
    MemoTexto.Color := FormConfig.Cor;
  finally
    FreeAndNil(FormConfig);
  end;

end;

procedure TFormPrincipal.BitBtnDTCPreviewClick(Sender: TObject);
var
  vFormPreview: TFormPreview;
begin
  inherited;
  if MemoTexto.Lines.Count > 0 then
  begin
    vFormPreview := TFormPreview.Create(Self);
    vFormPreview.SetTexto(MemoTexto.Lines);

    if not Assigned(FHistorico) then
      FHistorico := TStringList.Create;

    FHistorico.Add(MemoTexto.Text + QuebraLinha);

    try
      vFormPreview.ShowModal;
    finally
      FreeAndNil(vFormPreview);
    end;

  end
  else
  begin
    Application.MessageBox(cMesangemCampoVazio, cAtencao, MB_ICONEXCLAMATION);
  end;

end;

procedure TFormPrincipal.BitBtnDTCSuporteClick(Sender: TObject);
begin
  if not FileExists(cSuporte) then
    Application.MessageBox('Caminho não encontrado!', cAtencao, MB_ICONERROR)
  else
    ShellExecute(0, nil, cSuporte, '', nil, SW_SHOWNORMAL);
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FHistorico.Free;
end;

procedure TFormPrincipal.MemoTextoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Application.Terminate;
end;

end.
