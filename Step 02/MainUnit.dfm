object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 170
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BtnStartGame: TButton
    Left = 8
    Top = 8
    Width = 305
    Height = 73
    Caption = 'Start'
    TabOrder = 0
    OnClick = BtnStartGameClick
  end
  object BtnQuit: TButton
    Left = 8
    Top = 87
    Width = 305
    Height = 74
    Caption = 'Quit'
    TabOrder = 1
  end
  object tmrGameTimer: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = tmrGameTimerTimer
    Left = 40
    Top = 24
  end
end
