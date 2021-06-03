object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Element Table'
  ClientHeight = 359
  ClientWidth = 662
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
    Left = 519
    Top = 204
    Width = 90
    Height = 13
    Caption = 'Least rated genre:'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 505
    Height = 346
    DefaultColWidth = 98
    DefaultRowHeight = 25
    RowCount = 3
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 519
    Top = 8
    Width = 138
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 519
    Top = 39
    Width = 138
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 519
    Top = 80
    Width = 66
    Height = 21
    TabOrder = 3
    TextHint = 'Genre'
  end
  object Edit2: TEdit
    Left = 591
    Top = 80
    Width = 66
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    TextHint = 'Threshold'
  end
  object Button3: TButton
    Left = 519
    Top = 107
    Width = 138
    Height = 25
    Caption = 'Match'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 519
    Top = 146
    Width = 138
    Height = 21
    TabOrder = 6
    TextHint = 'Actor'
  end
  object Button4: TButton
    Left = 519
    Top = 173
    Width = 138
    Height = 25
    Caption = 'Filter'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 519
    Top = 329
    Width = 138
    Height = 25
    Caption = 'Graph'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Edit4: TEdit
    Left = 519
    Top = 223
    Width = 136
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
end
