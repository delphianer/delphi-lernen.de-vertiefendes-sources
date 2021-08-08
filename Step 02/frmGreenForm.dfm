object GreenForm: TGreenForm
  Left = 0
  Top = 0
  Caption = 'GreenForm'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object shpLight: TShape
    Left = 8
    Top = 8
    Width = 50
    Height = 50
    Shape = stCircle
    OnMouseDown = shpLightMouseDown
  end
end
