unit uFormConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uAcoes, uConstante,
  Vcl.ComCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxButtons, uComponentesControleAcesso, uImagensDTC;

type
  TFormConfig = class(TForm)
    lblNome: TLabel;
    rdGroup: TRadioGroup;
    EditNome: TEdit;
    rgTipoData: TRadioGroup;
    rgPosicaoTexto: TRadioGroup;
    rgCor: TRadioGroup;
    ComboSkin: TComboBox;
    LabelSkin: TLabel;
    BitBtnDTCConfirmar: TBitBtnDTC;
    BitBtnDTCCancelar: TBitBtnDTC;
    procedure FormCreate(Sender: TObject);
    procedure rdGroupClick(Sender: TObject);
    procedure SetaEstadoCampo(AValor: Integer);
    procedure BitBtnDTCConfirmarClick(Sender: TObject);
    procedure BitBtnDTCCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Acao: TAcoes;
    function GetCor: Tcolor;

  public
    property Cor: Tcolor read GetCor;
    { Public declarations }
  end;

var
  FormConfig: TFormConfig;

implementation

uses
  uFormPrincipal, pForm;

{$R *.dfm}


procedure TFormConfig.BitBtnDTCCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormConfig.BitBtnDTCConfirmarClick(Sender: TObject);
var
  FormSistema: TFormSistema;
begin
  Acao.GravaOpcaoTipoTexto(rdGroup.ItemIndex);
  Acao.GravaOpcaoPosicaoTexto(rgPosicaoTexto.ItemIndex);
  Acao.GravaOpcaoFormatoData(rgTipoData.ItemIndex);
  Acao.GravaNome(EditNome.Text);
  Acao.GravaOpcaoCor(rgCor.ItemIndex);
  Acao.GravaSkinName(ComboSkin.ItemIndex);

  FormSistema := (TFormPrincipal.ExecutaSelf as TFormSistema);

  Close;
end;

procedure TFormConfig.FormCreate(Sender: TObject);
var
  vIndice  : Integer;
begin
  for vIndice := Low(cArrayFormatoData) to High(cArrayFormatoData) do
    rgTipoData.Items.Add(FormatDateTime(cArrayFormatoData[vIndice], Now));

  for vIndice := Low(cArrayCor) to High(cArrayCor) do
    rgCor.Items.Add(cArrayCor[vIndice]);

  rdGroup.ItemIndex        := Acao.LerOpcaoTipoTexto;
  rgPosicaoTexto.ItemIndex := Acao.LerOpcaoPosicaoTexto;
  rgTipoData.ItemIndex     := Acao.LerOpcaoFormatoData;
  EditNome.Text            := Acao.LerNomeConfigurado;
  rgCor.ItemIndex          := Acao.LerOpcaoCor;
  ComboSkin.ItemIndex      := Acao.LerSkinIndex;

  SetaEstadoCampo(rdGroup.ItemIndex);

end;

function TFormConfig.GetCor: Tcolor;
begin
  Result := clYellow;
  case Acao.LerOpcaoCor of
    0:
      Result := clYellow;
    1:
      Result := clWindow;
  end;
end;

procedure TFormConfig.rdGroupClick(Sender: TObject);
var
  vTexto, vData, vAssinatura: String;
begin
  vTexto := '';
  vData := Acao.GetDataFormatada;
  vAssinatura := Acao.LerNomeConfigurado;

  SetaEstadoCampo(rdGroup.ItemIndex);

end;

procedure TFormConfig.SetaEstadoCampo(AValor: Integer);
begin
  case AValor of
    0: { DESABILITADOS - Texto para descrição }
    begin
      rgPosicaoTexto.Enabled   := False;
      rgTipoData.Enabled       := False;
      EditNome.Enabled         := False;
    end;
    1: { HABILITADOS - Texto para observação }
    begin
      rgPosicaoTexto.Enabled   := True;
      rgTipoData.Enabled       := True;
      EditNome.Enabled         := True;
    end;
  end;
end;

end.
