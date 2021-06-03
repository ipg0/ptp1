object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Add'
  ClientHeight = 289
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 91
    Width = 51
    Height = 13
    Caption = 'Main Actor'
  end
  object Label2: TLabel
    Left = 16
    Top = 46
    Width = 29
    Height = 13
    Caption = 'Genre'
  end
  object Label3: TLabel
    Left = 16
    Top = 0
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label4: TLabel
    Left = 16
    Top = 137
    Width = 76
    Height = 13
    Caption = 'Year of Release'
  end
  object Label5: TLabel
    Left = 16
    Top = 183
    Width = 31
    Height = 13
    Caption = 'Rating'
  end
  object Edit1: TEdit
    Left = 8
    Top = 19
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 64
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 8
    Top = 110
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 255
    Width = 209
    Height = 25
    Caption = 'Add'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 156
    Width = 209
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 8
    Top = 202
    Width = 209
    Height = 21
    NumbersOnly = True
    TabOrder = 5
  end
end
