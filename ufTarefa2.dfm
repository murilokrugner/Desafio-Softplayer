object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 2'
  ClientHeight = 305
  ClientWidth = 538
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 321
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 173
      Width = 43
      Height = 13
      Caption = 'Thread 1'
    end
    object Label2: TLabel
      Left = 24
      Top = 221
      Width = 43
      Height = 13
      Caption = 'Thread 2'
    end
    object lblTempo: TLabel
      Left = 160
      Top = 32
      Width = 79
      Height = 13
      Caption = 'Tempo Thread1:'
    end
    object Label3: TLabel
      Left = 160
      Top = 72
      Width = 79
      Height = 13
      Caption = 'Tempo Thread2:'
    end
    object Button1: TButton
      Left = 96
      Top = 128
      Width = 353
      Height = 25
      Caption = 'Executar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object ProgressBar1: TProgressBar
      Left = 24
      Top = 192
      Width = 489
      Height = 17
      TabOrder = 3
    end
    object ProgressBar2: TProgressBar
      Left = 24
      Top = 240
      Width = 489
      Height = 17
      TabOrder = 4
    end
    object EditTempo1: TEdit
      Left = 256
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object EditTempo2: TEdit
      Left = 256
      Top = 69
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0'
    end
  end
end
