object FormConfig: TFormConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 234
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 192
    Top = 8
    Width = 160
    Height = 13
    Caption = 'Nome do Programador/Solicitante'
  end
  object LabelSkin: TLabel
    Left = 192
    Top = 51
    Width = 19
    Height = 13
    Caption = 'Skin'
  end
  object rdGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 97
    Height = 80
    Caption = 'Tipo de texto'
    ItemIndex = 0
    Items.Strings = (
      'Descri'#231#227'o'
      'Observa'#231#227'o')
    TabOrder = 0
    OnClick = rdGroupClick
  end
  object EditNome: TEdit
    Left = 192
    Top = 24
    Width = 186
    Height = 21
    TabOrder = 2
  end
  object rgTipoData: TRadioGroup
    Left = 191
    Top = 94
    Width = 186
    Height = 37
    Caption = 'Formato da Data'
    Columns = 2
    TabOrder = 3
  end
  object rgPosicaoTexto: TRadioGroup
    Left = 111
    Top = 8
    Width = 75
    Height = 80
    Caption = 'Texto no:'
    ItemIndex = 1
    Items.Strings = (
      'In'#237'cio'
      'Final')
    TabOrder = 1
  end
  object rgCor: TRadioGroup
    Left = 8
    Top = 94
    Width = 178
    Height = 77
    Caption = 'Cor do campo Texto'
    TabOrder = 4
  end
  object ComboSkin: TComboBox
    Left = 191
    Top = 67
    Width = 187
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 5
    Text = 'Azul'
    Items.Strings = (
      'Amarelo'
      'Azul'
      'Laranja'
      'Roxo'
      'Verde')
  end
  object BitBtnDTCConfirmar: TBitBtnDTC
    Left = 137
    Top = 177
    Width = 49
    Height = 49
    CustomHint = FormSistema.BalloonHint
    OptionsImage.ImageIndex = 7
    OptionsImage.Images = FormPrincipal.ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BitBtnDTCConfirmarClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCCancelar: TBitBtnDTC
    Left = 192
    Top = 177
    Width = 49
    Height = 49
    CustomHint = FormSistema.BalloonHint
    OptionsImage.ImageIndex = 5
    OptionsImage.Images = FormPrincipal.ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtnDTCCancelarClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
end
