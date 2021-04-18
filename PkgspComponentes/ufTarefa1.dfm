object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 370
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -6
    Width = 785
    Height = 442
    TabOrder = 0
    object lblColunas: TLabel
      Left = 24
      Top = 16
      Width = 50
      Height = 18
      Caption = 'Colunas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTabelas: TLabel
      Left = 224
      Top = 16
      Width = 51
      Height = 18
      Caption = 'Tabelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCondicoes: TLabel
      Left = 424
      Top = 16
      Width = 65
      Height = 18
      Caption = 'Condi'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSql: TLabel
      Left = 24
      Top = 198
      Width = 78
      Height = 18
      Caption = 'SQL Gerado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MemoColunas: TMemo
      Left = 24
      Top = 48
      Width = 185
      Height = 130
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'PRO_CODIGO'
        'PRO_DESCRICAO'
        'PRO_VALOR')
      ParentFont = False
      TabOrder = 0
    end
    object MemoTabelas: TMemo
      Left = 224
      Top = 48
      Width = 185
      Height = 130
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'PRODUTOS')
      ParentFont = False
      TabOrder = 1
    end
    object MemoCondicoes: TMemo
      Left = 424
      Top = 48
      Width = 185
      Height = 130
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'EMP_CODIGO = 1'
        'PRO_CODIGO = 22'
        'PRO_STATUS = 0')
      ParentFont = False
      TabOrder = 2
    end
    object MemoSql: TMemo
      Left = 24
      Top = 220
      Width = 737
      Height = 142
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnGeraSql: TButton
      Left = 648
      Top = 88
      Width = 113
      Height = 41
      Caption = 'Gera SQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnGeraSqlClick
    end
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 376
    Top = 184
  end
end
