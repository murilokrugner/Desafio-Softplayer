object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 3'
  ClientHeight = 418
  ClientWidth = 686
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
  object Panel: TPanel
    Left = -1
    Top = 0
    Width = 690
    Height = 417
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 15
      Top = 2
      Width = 92
      Height = 13
      Caption = 'Valores por projeto'
    end
    object lblTotal: TLabel
      Left = 550
      Top = 293
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lblTotalDivisoes: TLabel
      Left = 550
      Top = 348
      Width = 81
      Height = 13
      Caption = 'Total divis'#245'es R$'
    end
    object DBGrid: TDBGrid
      Left = 14
      Top = 21
      Width = 657
      Height = 265
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGridKeyDown
    end
    object BtnTotal: TButton
      Left = 415
      Top = 309
      Width = 107
      Height = 25
      Caption = 'Obter Total'
      TabOrder = 1
      OnClick = BtnTotalClick
    end
    object BtnTotalDivisoes: TButton
      Left = 415
      Top = 362
      Width = 107
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 2
      OnClick = BtnTotalDivisoesClick
    end
    object EditTotal: TEdit
      Left = 550
      Top = 309
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object EditTotalDivisoes: TEdit
      Left = 550
      Top = 364
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
  end
end
