object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Demo zu FileHandling Teil 1'
  ClientHeight = 286
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 87
    Top = 35
    Width = 23
    Height = 13
    Caption = 'Nick:'
  end
  object Label2: TLabel
    Left = 64
    Top = 62
    Width = 46
    Height = 13
    Caption = 'Vorname:'
  end
  object Label3: TLabel
    Left = 56
    Top = 90
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nachname:'
  end
  object Label4: TLabel
    Left = 88
    Top = 116
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'UIN:'
  end
  object lblPos: TLabel
    Left = 128
    Top = 165
    Width = 77
    Height = 13
    Caption = '[nichts geladen]'
  end
  object EdNick1: TEdit
    Left = 116
    Top = 32
    Width = 156
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EdVorname1: TEdit
    Left = 116
    Top = 59
    Width = 156
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EdNachname1: TEdit
    Left = 116
    Top = 86
    Width = 157
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object EdIcqNummer1: TEdit
    Left = 116
    Top = 113
    Width = 156
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object BtnPrevious: TButton
    Left = 56
    Top = 184
    Width = 105
    Height = 25
    Caption = 'Zur'#252'ck'
    Enabled = False
    TabOrder = 4
    OnClick = BtnPreviousClick
  end
  object BtnNext: TButton
    Left = 167
    Top = 184
    Width = 105
    Height = 25
    Caption = 'Weiter'
    Enabled = False
    TabOrder = 5
    OnClick = BtnNextClick
  end
  object BtnSave: TButton
    Left = 57
    Top = 246
    Width = 113
    Height = 25
    Caption = 'Eingabe speichern'
    Enabled = False
    TabOrder = 6
    OnClick = BtnSaveClick
  end
  object BtnOpen: TButton
    Left = 176
    Top = 246
    Width = 96
    Height = 25
    Caption = 'Eingabe laden'
    TabOrder = 7
    OnClick = BtnOpenClick
  end
  object BtnDelete: TButton
    Left = 56
    Top = 215
    Width = 105
    Height = 25
    Caption = 'Datensatz l'#246'schen'
    Enabled = False
    TabOrder = 8
  end
  object BtnNew: TButton
    Left = 167
    Top = 215
    Width = 105
    Height = 25
    Caption = 'Neuer Datensatz'
    TabOrder = 9
    OnClick = BtnNewClick
  end
end
