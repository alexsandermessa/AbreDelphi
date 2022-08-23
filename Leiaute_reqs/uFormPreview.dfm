inherited FormPreview: TFormPreview
  CustomHint = BalloonHint
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 402
  ClientWidth = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 383
    Width = 538
    CustomHint = BalloonHint
  end
  object MemoPreview: TMemo [1]
    Left = 9
    Top = 8
    Width = 521
    Height = 249
    CustomHint = BalloonHint
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = MemoPreviewKeyPress
  end
  object BitBtnDTCAcrescentar: TBitBtnDTC [2]
    Left = 102
    Top = 288
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    DropDownMenu = PopupMenu
    Kind = cxbkDropDownButton
    OptionsImage.ImageIndex = 1
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnDTCAcrescentarClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCEditar: TBitBtnDTC [3]
    Left = 187
    Top = 288
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 4
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtnDTCEditarClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCCopiar: TBitBtnDTC [4]
    Left = 272
    Top = 288
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 3
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BitBtnDTCCopiarClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCLimpar: TBitBtnDTC [5]
    Left = 357
    Top = 288
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 0
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtnDTCLimparClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object PopupMenu: TPopupMenu
    Left = 496
    Top = 344
    object WinV: TMenuItem
      Caption = 'Win + V'
      Enabled = False
      OnClick = WinVClick
    end
  end
end
