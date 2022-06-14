unit uFormPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pForm, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Clipbrd, uAcoes, uStringManipulacao, cxImageList,
  cxGraphics, cxClasses, cxLookAndFeels, dxSkinsForm, cxLookAndFeelPainters,
  Vcl.Menus, cxButtons, uComponentesControleAcesso, uImagensDTC, uVersaoSistemaOperacional,
  Vcl.Buttons;

type
  TFormPreview = class(TFormSistema)
    MemoPreview: TMemo;
    BitBtnDTCAcrescentar: TBitBtnDTC;
    BitBtnDTCEditar: TBitBtnDTC;
    BitBtnDTCCopiar: TBitBtnDTC;
    BitBtnDTCLimpar: TBitBtnDTC;
    PopupMenu: TPopupMenu;
    WinV: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MemoPreviewKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnDTCEditarClick(Sender: TObject);
    procedure BitBtnDTCCopiarClick(Sender: TObject);
    procedure BitBtnDTCLimparClick(Sender: TObject);
    procedure WinVClick(Sender: TObject);
    procedure BitBtnDTCAcrescentarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetTexto(ATexto: TStrings);
    { Public declarations }
  end;

var
  FormPreview: TFormPreview;

implementation

uses
  uFormPrincipal, uConstante;

{$R *.dfm}

procedure TFormPreview.FormCreate(Sender: TObject);
var
  vRetornaVesaoSO: TIdentificacaoSistemaOperacional.TInformacoesVersaoWindows;
begin
  inherited;

  if FAcao.LerOpcaoCor = 1 then
    MemoPreview.Color := clWindow;

  FMemoria := UpperCase(FAcao.RemoveAcento(Clipboard.AsText));

  BitBtnDTCAcrescentar.Caption := cTextoAcrescentar;
  BitBtnDTCEditar.Caption     := cTextoEditar;
  BitBtnDTCCopiar.Caption     := cTextoCopiar;
  BitBtnDTCLimpar.Caption     := cTextoLimpar;
  BitBtnDTCAcrescentar.Hint    := cTextoAcrescentar + ': Acrescenta o texto copiado do suporte respeitando as configurações definidas';
  BitBtnDTCEditar.Hint        := cTextoEditar + ': Habilita o campo possibilitando uma edição antes da forma final';
  BitBtnDTCCopiar.Hint        := cTextoCopiar + ': Copia o texto formatado e pronto para colar no suporte';
  BitBtnDTCLimpar.Hint        := cTextoLimpar + ': Limpeza do campo de ' + cTextoPreview;

  if vRetornaVesaoSO.Principal >= 10 then
    WinV.Enabled := true;

end;

procedure TFormPreview.BitBtnDTCAcrescentarClick(Sender: TObject);
var
  vTexto: String;
begin
  inherited;

  if FAcao.LerOpcaoTipoTexto = 1 then
  begin
    vTexto := MemoPreview.Lines.Text;
    MemoPreview.Clear;
    MemoPreview.Lines.Text := UpperCase(FAcao.RemoveAcento(Clipboard.AsText));

    case FAcao.LerOpcaoPosicaoTexto of
      0:
      begin
        MemoPreview.Lines.Insert(0, vTexto);
      end;
      1:
      begin
        MemoPreview.Lines.Add(cSeparador);
        MemoPreview.Lines.Add(vTexto);
      end;
    end;
  end
  else
  begin
    if Application.MessageBox('O tipo de texto configurado é para descrição. Você deseja colar e substituir o texto atual?', cAtencao, MB_YESNO+MB_ICONQUESTION ) = mrYes then
      MemoPreview.Lines.Text := UpperCase(FAcao.RemoveAcento(Clipboard.AsText))
    else
    begin
      Abort
    end;
  end;

  BitBtnDTCAcrescentar.Enabled := False;
end;

procedure TFormPreview.BitBtnDTCCopiarClick(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := UpperCase(FAcao.RemoveAcento(MemoPreview.Lines.Text));
end;

procedure TFormPreview.BitBtnDTCEditarClick(Sender: TObject);
begin
  inherited;
  MemoPreview.ReadOnly := False;
end;

procedure TFormPreview.BitBtnDTCLimparClick(Sender: TObject);
begin
  inherited;
  MemoPreview.Clear;
  BitBtnDTCAcrescentar.Enabled := True;
end;

procedure TFormPreview.MemoPreviewKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TFormPreview.SetTexto(ATexto: TStrings);
var
  vTexto, vData, vAssinatura: String;
begin
  vData := FAcao.GetDataFormatada;
  vAssinatura := FAcao.LerNomeConfigurado;

  vTexto := UpperCase(FAcao.RemoveAcento(ATexto.Text));
  vTexto := TStringManipulacao.TrocaTexto(vTexto, QuebraLinha+QuebraLinha, ' ');
  vTexto := TStringManipulacao.RetiraEspacosDuplicadosString(vTexto);

  if FAcao.LerOpcaoTipoTexto = 1 then
    vTexto := FAcao.TextoDaObservacao(vTexto, vData, vAssinatura) + QuebraLinha + cSeparador;

  MemoPreview.Lines.Text := vTexto;

end;

procedure TFormPreview.WinVClick(Sender: TObject);
begin
  inherited;
  FAcao.WinV;
  MemoPreview.SetFocus;
end;

end.
