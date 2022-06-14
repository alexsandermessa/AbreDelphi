inherited FormHistorico: TFormHistorico
  Caption = 'FormHistorico'
  ClientHeight = 510
  ClientWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 491
    Width = 1000
    Panels = <
      item
        Alignment = taCenter
        Width = 500
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object MemoHistorico: TMemo [1]
    Left = 8
    Top = 56
    Width = 984
    Height = 429
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  inherited BalloonHint: TBalloonHint
    Left = 176
    Top = 8
  end
  inherited dxSkinController: TdxSkinController
    Left = 96
  end
  inherited ImageList: TImageList
    Top = 8
  end
end
