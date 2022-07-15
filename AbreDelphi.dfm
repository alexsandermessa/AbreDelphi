object FormAbreDelphiAmbientes: TFormAbreDelphiAmbientes
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atalhos '#218'teis Vers'#227'o 22'
  ClientHeight = 695
  ClientWidth = 293
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 215
    Width = 275
    Height = 18
    Hint = 'TECLA F: FECHA O DELPHI FOR'#199'ADO'
    Margins.Left = 15
    Align = alTop
    Caption = 'F - Fechar Delphi For'#231'ado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelRestauraRegistro: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 236
    Width = 275
    Height = 18
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'R - Restaura/Exporta Reg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 262
    Width = 275
    Height = 18
    Hint = 'TECLA L: EXECUTA O'#13#10'C:\ScriptLogon.lnk'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'L - Script Logon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 288
    Width = 275
    Height = 18
    Hint = 'TECLA D: ABRE O DCDADOS '#13#10'DO AMBIENTE SELECIONADO'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'D - DCDados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelA: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 10
    Width = 275
    Height = 20
    Hint = 
      'TECLA A : INICIA AMBIENTE BIN.DTC.'#13#10'PRESSIONANDO SHIFT ABRE O DE' +
      'LPHI.   '#13#10
    Margins.Left = 15
    Margins.Top = 10
    Margins.Bottom = 5
    Align = alTop
    Caption = 'A - BIN.DTC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelB: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 38
    Width = 275
    Height = 20
    Hint = 
      'TECLA B : INICIA AMBIENTE BIN.LIBERACAO.'#13#10'PRESSIONANDO SHIFT ABR' +
      'E O DELPHI.   '#13#10
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'B - BIN.LIBERACAO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelC: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 66
    Width = 278
    Height = 20
    Hint = 
      'TECLA C : INICIA AMBIENTE BIN.SEPARADO.'#13#10'PRESSIONANDO SHIFT ABRE' +
      ' O DELPHI.   '#13#10
    Margins.Left = 15
    Margins.Right = 0
    Align = alTop
    Caption = 'C - BIN.SEPARADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label7: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 142
    Width = 278
    Height = 18
    Hint = 
      'TECLA 1: ABRE O DELPHI'#13#10'PRESSIONANDO SHIFT: ABRE DELPHI SEM PROJ' +
      'ETOS'
    Margins.Left = 15
    Margins.Top = 10
    Margins.Right = 0
    Align = alTop
    Caption = '1 - Abrir Delphi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 340
    Width = 278
    Height = 18
    Hint = 'TECLA U: ABRE O DCDADOSAUDITORIA '#13#10'DO AMBIENTE SELECIONADO'
    Margins.Left = 15
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alTop
    Caption = 'U - DCDadosAuditoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 366
    Width = 275
    Height = 20
    Hint = 'TECLA N: REINICIA OU INICIA O SEND'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'N - Reiniciar Send'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -17
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object DTCHeaderExecutar: TDTCHeader
    AlignWithMargins = True
    Left = 10
    Top = 86
    Width = 273
    Height = 18
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    Caption = ''
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Controls = <>
  end
  object Label5: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 394
    Width = 275
    Height = 18
    Hint = 
      'TECLA P: ABRE O SUPORTE. AO PRESSIONAR SHIFT+ P ABRE O SUPORTE C' +
      'OM A TELA DE CONSULTA DE REQ. J'#193' ABERTA'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'P - Suporte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label6: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 314
    Width = 275
    Height = 18
    Hint = 
      'TECLA T: ABRE O TESTCOMPLETE DO AMBIENTE SELECIONADO. '#13#10'OBS: SE ' +
      'EXECUTADO COM O TESTCOMPLETE '#13#10'ABERTO ELE S'#211' LIBERA O ACESSO.'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'T - Testcomplete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label9: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 420
    Width = 275
    Height = 18
    Hint = 
      'TECLA E: RODA A LIBDELPHI DO '#13#10'AMBIENTE SELECIONADO.'#13#10'COM SHIFT ' +
      'ABRE O DELPHI.'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'E - LibDelphi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label10: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 446
    Width = 275
    Height = 18
    Hint = 
      'TECLA H: RODA A LIBDELPHICOMPLETO DO '#13#10'AMBIENTE SELECIONADO.'#13#10'CO' +
      'M SHIFT ABRE O DELPHI.'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'H - LibDelphi Completo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label11: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 472
    Width = 275
    Height = 18
    Hint = 
      'TECLA Y: LIMPA AS DCUs, EXECUT'#193'VEIS, *.RSM, *.MAP DE '#13#10'TODAS AS ' +
      'PASTAS DE SISTEMAS DO OUTPUT DO '#13#10'AMBIENTE SELECIONADO.'#13#10' COM SH' +
      'IFT APAGA TAMB'#201'M:'#13#10'- LIBTERCEIROS'#13#10'- LIBTERCEIROSRUNTIME'#13#10'- LIB'#13 +
      #10'- LIBRUNTIME'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Y - Limpar Output'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label12: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 654
    Width = 275
    Height = 18
    Hint = 'TECLA W OU ESC: SAIR '
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'W - Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelArquivosOutPut: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 498
    Width = 275
    Height = 18
    Hint = 
      'TECLA O - COPIA AS DLLs NECESS'#193'RIAS PARA A PASTA OUTPUT'#13#10'DO SIST' +
      'EMA E GERA PERSONALIZA'#199#195'O'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'O - Criar OutPut'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelLibDelphiImagens: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 524
    Width = 275
    Height = 18
    Hint = 'TECLA I: RODA A LIBDELPHI_IMAGENS DO '#13#10'AMBIENTE SELECIONADO.'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'I - LibDelphi Imagens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelDelphiAberto: TLabel
    AlignWithMargins = True
    Left = 0
    Top = 114
    Width = 293
    Height = 18
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Align = alTop
    Alignment = taCenter
    Caption = 'Delphi Aberto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelPersonalizador: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 550
    Width = 275
    Height = 18
    Hint = 'TECLA Z: ABRE O PERSONALIZADOR DOS SISTEMAS'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Z - Personalizador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelPrioridades: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 576
    Width = 275
    Height = 18
    Hint = 
      'TECLA S: PRIORIDADES DO N'#218'CLEO CONT'#193'BIL. '#13#10'PRESSIONANDO SHIFT - ' +
      'PRIORIDADE N'#218'CLEO FISCAL'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'S - Prioridades N'#250'cleo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelUpdate: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 163
    Width = 275
    Height = 18
    Hint = 'TECLA 2 - FAZ UM UPDATE NA PASTA DELPHI DO BIN SELECIONADO'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = '2 - Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelCommit: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 189
    Width = 275
    Height = 18
    Hint = 
      'TECLA 3 - ABRE A TELA DE COMMIT NA PASTA DELPHI DO BIN SELECIONA' +
      'DO'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = '3 - Commit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelTestaDCComparaEstrutura: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 602
    Width = 275
    Height = 18
    Hint = 'TECLA G - Abre o TestaDCComparaEstrutura'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'G - TestaDCComparaEstrutura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 628
    Width = 275
    Height = 18
    Hint = 'TECLA Q - Abre o Layout de Requisi'#231#245'es'
    Margins.Left = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Q - Layout de Requisi'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object DirectoryListBoxLimpaOutput: TDirectoryListBox
    Left = 203
    Top = 4
    Width = 145
    Height = 97
    TabOrder = 0
    Visible = False
  end
  object PanelEmTesteDTC: TPanel
    Left = 0
    Top = 671
    Width = 293
    Height = 24
    Align = alBottom
    Caption = 'Em Teste DTC: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object TimerBinAtual: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerBinAtualTimer
    Left = 208
    Top = 320
  end
  object TimerDestacarAtalho: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerDestacarAtalhoTimer
    Left = 208
    Top = 176
  end
  object TimerDelphiAberto: TTimer
    Enabled = False
    OnTimer = TimerDelphiAbertoTimer
    Left = 40
    Top = 72
  end
end
