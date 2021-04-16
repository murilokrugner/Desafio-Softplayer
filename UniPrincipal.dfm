object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 448
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = Tarefas
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Tarefas: TMainMenu
    Left = 48
    Top = 24
    object Tarefa1: TMenuItem
      Caption = 'Tarefa 1'
      OnClick = Tarefa1Click
    end
    object Tarefa2: TMenuItem
      Caption = 'Tarefa 2'
      OnClick = Tarefa2Click
    end
    object Tarefa3: TMenuItem
      Caption = 'Tarefa 3'
      OnClick = Tarefa3Click
    end
  end
end
