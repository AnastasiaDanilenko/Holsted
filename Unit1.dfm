object Form_Holsted: TForm_Holsted
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1061#1086#1083#1089#1090#1077#1076
  ClientHeight = 584
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Text: TLabel
    Left = 16
    Top = 8
    Width = 132
    Height = 20
    Caption = #1058#1077#1082#1089#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Memo_Text: TMemo
    Left = 16
    Top = 49
    Width = 521
    Height = 387
    BorderStyle = bsNone
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button_Download: TButton
    Left = 208
    Top = 0
    Width = 137
    Height = 34
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_DownloadClick
  end
  object Panel_Holsted: TPanel
    Left = 568
    Top = 46
    Width = 305
    Height = 371
    TabOrder = 2
    object Label_Basic: TLabel
      Left = 8
      Top = 3
      Width = 113
      Height = 18
      Caption = #1041#1072#1079#1086#1074#1099#1077' '#1084#1077#1090#1088#1080#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Unic_Operators: TLabel
      Left = 8
      Top = 22
      Width = 227
      Height = 18
      Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1099#1077' '#1086#1087#1077#1088#1072#1090#1086#1088#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Unic_Operands: TLabel
      Left = 8
      Top = 41
      Width = 221
      Height = 18
      Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1099#1077' '#1086#1087#1077#1088#1072#1085#1076#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Amount_Operators: TLabel
      Left = 8
      Top = 60
      Width = 240
      Height = 18
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Amount_Operands: TLabel
      Left = 8
      Top = 79
      Width = 234
      Height = 18
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1087#1077#1088#1072#1085#1076#1086#1074' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Enterings_Operator: TLabel
      Left = 8
      Top = 98
      Width = 186
      Height = 18
      Caption = #1063#1080#1089#1083#1086' '#1074#1093#1086#1078#1076#1077#1085#1080#1081' '#1086#1087#1077#1088#1072#1090#1086#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Enterings_Operand: TLabel
      Left = 8
      Top = 117
      Width = 180
      Height = 18
      Caption = #1063#1080#1089#1083#1086' '#1074#1093#1086#1078#1076#1077#1085#1080#1081' '#1086#1087#1077#1088#1072#1085#1076#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Composite: TLabel
      Left = 8
      Top = 152
      Width = 127
      Height = 18
      Caption = #1057#1086#1089#1090#1072#1074#1085#1099#1077' '#1084#1077#1090#1088#1080#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Vocabulary: TLabel
      Left = 8
      Top = 171
      Width = 132
      Height = 18
      Caption = #1057#1083#1086#1074#1072#1088#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Length: TLabel
      Left = 8
      Top = 190
      Width = 121
      Height = 18
      Caption = #1044#1083#1080#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_Volume: TLabel
      Left = 8
      Top = 209
      Width = 123
      Height = 18
      Caption = #1054#1073#1098#1105#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_teor_length: TLabel
      Left = 8
      Top = 233
      Width = 143
      Height = 18
      Caption = #1058#1077#1086#1088#1077#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1083#1080#1085#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_level: TLabel
      Left = 8
      Top = 249
      Width = 231
      Height = 18
      Caption = #1055#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1099': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_level_progr: TLabel
      Left = 8
      Top = 265
      Width = 135
      Height = 18
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_intellect: TLabel
      Left = 8
      Top = 281
      Width = 212
      Height = 18
      Caption = #1048#1085#1090#1077#1083#1083#1077#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label_difficulty: TLabel
      Left = 8
      Top = 297
      Width = 206
      Height = 18
      Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1083#1086#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
  end
  object Memo_output: TMemo
    Left = 568
    Top = 432
    Width = 312
    Height = 121
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Filter = '|*.txt'
    InitialDir = 'E:\Laboratory_Works\Holsted'
    Left = 280
  end
end
