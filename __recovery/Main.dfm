object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1047#1056#1048' 1-3 '#1082#1072#1090#1077#1075#1086#1088#1080#1081
  ClientHeight = 657
  ClientWidth = 1803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1803
    Height = 657
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1085#1082#1086#1076#1080#1089#1087#1072#1085#1089#1077#1088#1099
      object Panel1: TPanel
        Left = 0
        Top = 568
        Width = 1795
        Height = 61
        Align = alBottom
        TabOrder = 0
        object Label2: TLabel
          Left = 136
          Top = 16
          Width = 31
          Height = 13
          Caption = 'Label2'
        end
        object Button1: TButton
          Left = 1
          Top = 1
          Width = 1793
          Height = 42
          Align = alClient
          Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          TabOrder = 0
          OnClick = Button1Click
        end
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 43
          Width = 1793
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1795
        Height = 568
        Align = alClient
        AutoFitColWidths = True
        ColumnDefValues.Title.TitleButton = True
        DataSource = DM.DS_Onko
        DynProps = <>
        IndicatorTitle.ShowDropDownSign = True
        IndicatorTitle.TitleButton = True
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        STFilter.InstantApply = True
        STFilter.Visible = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnGetCellParams = DBGridEh1GetCellParams
        OnSortMarkingChanged = DBGridEh1SortMarkingChanged
        OnTitleBtnClick = DBGridEh1TitleBtnClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'number'
            Footers = <>
            Title.Caption = #8470
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Year'
            Footers = <>
            Title.Caption = #1043#1086#1076
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Organization'
            Footers = <>
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 261
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Kategory'
            Footers = <>
            STFilter.DataField = 'Kategory'
            Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1047#1056#1048
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'InventDate'
            Footers = <>
            Title.Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103'|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Invent'
            Footers = <>
            Title.Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103'|'#1050#1086#1083'-'#1074#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'To'
            Footers = <>
            Title.Caption = #1044#1074#1080#1078#1077#1085#1080#1077'|'#1055#1086#1083#1091#1095#1077#1085#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'From'
            Footers = <>
            Title.Caption = #1044#1074#1080#1078#1077#1085#1080#1077'|'#1055#1077#1088#1077#1076#1072#1085#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'In'
            Footers = <>
            Title.Caption = #1044#1074#1080#1078#1077#1085#1080#1077'|'#1055#1088#1080#1096#1083#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Out'
            Footers = <>
            Title.Caption = #1044#1074#1080#1078#1077#1085#1080#1077'|'#1059#1096#1083#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Balance'
            Footers = <>
            Title.Caption = #1041#1072#1083#1072#1085#1089
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'nextInvent'
            Footers = <>
            Title.Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103'|'#1050#1086#1083'-'#1074#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'nextInventDate'
            Footers = <>
            Title.Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103'|'#1044#1072#1090#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1047#1056#1048' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' 2014-'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 560
        Width = 1795
        Height = 69
        Align = alBottom
        TabOrder = 0
        object Button2: TButton
          Left = 1273
          Top = 1
          Width = 336
          Height = 50
          Align = alClient
          Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          TabOrder = 0
          OnClick = Button2Click
          ExplicitLeft = 992
          ExplicitWidth = 617
        end
        object ProgressBar2: TProgressBar
          Left = 1
          Top = 51
          Width = 1793
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 1272
          Height = 50
          Align = alLeft
          TabOrder = 2
          object Label1: TLabel
            Left = 688
            Top = 10
            Width = 79
            Height = 23
            Caption = #1047#1072#1087#1080#1089#1077#1081':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 904
            Top = 10
            Width = 61
            Height = 23
            Caption = #1042#1088#1077#1084#1103':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 1072
            Top = 10
            Width = 95
            Height = 23
            Caption = #1054#1087#1077#1088#1072#1094#1080#1081':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object CB_IzgotYear: TComboBox
            Left = 224
            Top = 10
            Width = 185
            Height = 24
            AutoDropDown = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = #1043#1086#1076' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
            OnEnter = CB_IzgotYearEnter
            Items.Strings = (
              '2014'
              '2015'
              '2016'
              '2017'
              '2018'
              '2019'
              '2020'
              '2021')
          end
          object CB_Izgot: TComboBox
            Left = 17
            Top = 10
            Width = 185
            Height = 24
            AutoDropDown = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103'-'#1080#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
            OnEnter = CB_IzgotEnter
            Items.Strings = (
              '20553876'
              '07622740'
              '08624332'
              '08622474')
          end
          object CB_Kateg: TComboBox
            Left = 433
            Top = 10
            Width = 185
            Height = 24
            AutoDropDown = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
            OnEnter = CB_KategEnter
            Items.Strings = (
              '1'
              '2'
              '3')
          end
        end
        object Panel4: TPanel
          Left = 1609
          Top = 1
          Width = 185
          Height = 50
          Align = alRight
          TabOrder = 3
          object CheckBox1: TCheckBox
            Left = 16
            Top = 16
            Width = 169
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox1Click
          end
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 1795
        Height = 560
        Align = alClient
        ColumnDefValues.Title.TitleButton = True
        DataSource = DM.DS_ZRI
        DynProps = <>
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        IndicatorParams.Color = clRed
        IndicatorTitle.ShowDropDownSign = True
        IndicatorTitle.TitleButton = True
        OddRowColor = cl3DLight
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        STFilter.InstantApply = True
        STFilter.Visible = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnGetCellParams = DBGridEh2GetCellParams
        OnSortMarkingChanged = DBGridEh2SortMarkingChanged
        OnTitleBtnClick = DBGridEh2TitleBtnClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Type'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#1058#1080#1087
            Width = 90
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Number'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#1053#1086#1084#1077#1088
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Passport'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#8470' '#1087#1072#1089#1087#1086#1088#1090#1072
            Width = 110
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'IzgotDate'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
            Width = 86
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Izgot'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
            Width = 168
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Kategory'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082'|'#1050#1072#1090#1077#1075#1086#1088#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate1'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'1|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper1'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'1|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org1'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'1|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate2'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'2|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper2'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'2|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org2'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'2|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate3'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'3|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper3'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'3|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org3'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'3|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate4'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'4|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper4'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'4|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org4'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'4|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate5'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'5|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper5'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'5|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org5'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'5|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate6'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'6|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper6'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'6|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org6'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'6|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate7'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'7|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper7'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'7|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org7'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'7|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate8'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'8|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper8'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'8|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org8'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'8|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate9'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'9|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper9'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'9|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org9'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'9|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate10'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'10|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper10'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'10|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org10'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'10|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate11'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'11|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper11'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'11|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org11'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'11|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate12'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'12|'#1044#1072#1090#1072
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper12'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'12|'#1054#1087#1077#1088#1072#1094#1080#1103
            Width = 56
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org12'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'12|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate13'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'13|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper13'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'13|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org13'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'13|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate14'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'14|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper14'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'14|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org14'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'14|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate15'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'15|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper15'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'15|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clGradientInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org15'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'15|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate16'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'16|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper16'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'16|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org16'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'16|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate17'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'17|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper17'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'17|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org17'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'17|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate18'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'18|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper18'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'18|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org18'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'18|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate19'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'19|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper19'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'19|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            Color = clInactiveCaption
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org19'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'19|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OpDate20'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'20|'#1044#1072#1090#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Oper20'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'20|'#1054#1087#1077#1088#1072#1094#1080#1103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Org20'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103'20|'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
end
