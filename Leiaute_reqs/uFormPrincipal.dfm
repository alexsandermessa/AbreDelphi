inherited FormPrincipal: TFormPrincipal
  Caption = ''
  ClientHeight = 416
  ClientWidth = 582
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 397
    Width = 582
    Panels = <
      item
        Alignment = taCenter
        Width = 291
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object MemoTexto: TMemo [1]
    Left = 28
    Top = 8
    Width = 521
    Height = 249
    Cursor = crIBeam
    Hint = 'Digite seu texto aqui e depois clique em Pr'#233'-visualizar'
    CustomHint = BalloonHint
    Color = clYellow
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 0
    OnKeyPress = MemoTextoKeyPress
  end
  object BitBtnDTCPreview: TBitBtnDTC [2]
    Left = 122
    Top = 292
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 6
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnDTCPreviewClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCClear: TBitBtnDTC [3]
    Left = 207
    Top = 292
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 9
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtnDTCClearClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCConfig: TBitBtnDTC [4]
    Left = 377
    Top = 292
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 2
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BitBtnDTCConfigClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCSuporte: TBitBtnDTC [5]
    Left = 37
    Top = 292
    Width = 79
    Height = 69
    CustomHint = BalloonHint
    OptionsImage.ImageIndex = 10
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
    OnClick = BitBtnDTCSuporteClick
    ExibicaoLargura = 48
    ExibicaoAltura = 48
  end
  object BitBtnDTCHistorico: TBitBtnDTC [6]
    Left = 292
    Top = 292
    Width = 79
    Height = 69
    OptionsImage.ImageIndex = 11
    OptionsImage.Images = ImageList
    OptionsImage.Layout = blGlyphTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BitBtnDTCHistoricoClick
  end
end
