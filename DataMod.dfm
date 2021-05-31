object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 482
  Width = 677
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=QW12erty;Persist Security Info=True' +
      ';User ID=dev;Initial Catalog=CentralPart_ZRI;Data Source=SQL0'
    DefaultDatabase = 'CentralPart_Oper'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 26
  end
  object ADOQ10: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT year(opdate) as '#39'Year'#39
      '      ,s.NAME_SHORT'
      '      ,opdate'
      '      ,[Kateg]'
      '      ,sum(Sht) as '#39'kolvo'#39
      ''
      ''
      ''
      '  FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT like '#39'%'#1086#1085#1082#1086#1076#1080'%'#39
      #9'and year(opdate) >= 2014'
      #9'and OpCod = 10 '
      #9'and Kateg in (1, 2, 3)'
      #9'group by  year(opdate), s.NAME_SHORT, opdate,  Kateg'
      #9'order by  year(opdate), s.NAME_SHORT, opdate, Kateg')
    Left = 168
    Top = 34
    object ADOQ10Year: TIntegerField
      FieldName = 'Year'
      ReadOnly = True
    end
    object ADOQ10NAME_SHORT: TWideStringField
      DisplayWidth = 150
      FieldName = 'NAME_SHORT'
      Size = 150
    end
    object ADOQ10opdate: TDateTimeField
      FieldName = 'opdate'
    end
    object ADOQ10Kateg: TSmallintField
      FieldName = 'Kateg'
    end
    object ADOQ10kolvo: TIntegerField
      FieldName = 'kolvo'
      ReadOnly = True
    end
  end
  object ADOQTo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  sum(Sht) as '#39'kolvo'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      #9'and OpCod in (31, 32, 35, 37, 38, 39) '
      #9'and Kateg = :kateg'
      '')
    Left = 168
    Top = 82
    object ADOQTokolvo: TIntegerField
      FieldName = 'kolvo'
      ReadOnly = True
    end
  end
  object ADOQFrom: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  sum(Sht) as '#39'kolvo'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      #9'and OpCod in (21, 22, 25, 27, 28, 29) '
      #9'and Kateg = :kateg'
      ''
      '')
    Left = 168
    Top = 138
    object ADOQFromkolvo: TIntegerField
      FieldName = 'kolvo'
      ReadOnly = True
    end
  end
  object ADOQIn: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  sum(Sht) as '#39'kolvo'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      
        #9'and OpCod in (11, 12, 15, 17, 58, 62, 73, 74, 75, 85, 86, 87, 8' +
        '8, 97) '
      #9'and Kateg = :kateg')
    Left = 168
    Top = 194
    object ADOQInkolvo: TIntegerField
      FieldName = 'kolvo'
      ReadOnly = True
    end
  end
  object ADOQOut: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  sum(Sht) as '#39'kolvo'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      
        #9'and OpCod in (41, 42, 43, 46, 47, 48, 61, 65, 67, 71, 72, 81, 8' +
        '2, 83, 84, 98) '
      #9'and Kateg = :kateg')
    Left = 168
    Top = 250
    object ADOQOutkolvo: TIntegerField
      FieldName = 'kolvo'
      ReadOnly = True
    end
  end
  object ADOQInvent: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'opdate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT opdate'
      '      ,sum(Sht) as '#39'Sht'#39
      ''
      '  FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT = :name'
      #9'and opdate > :opdate'
      #9'and OpCod = 10 '
      #9'and Kateg = :kateg'
      #9'group by  opdate'
      #9'order by  opdate')
    Left = 168
    Top = 306
    object ADOQInventopdate: TDateTimeField
      FieldName = 'opdate'
    end
    object ADOQInventSht: TIntegerField
      FieldName = 'Sht'
      ReadOnly = True
    end
  end
  object MTE_Onko: TMemTableEh
    AutoCalcFields = False
    CachedUpdates = True
    Filter = '1=1'
    Filtered = True
    Params = <>
    SortOrder = 'number, Year, Kategory'
    Left = 160
    Top = 368
    object MTE_Onkonumber: TSmallintField
      FieldName = 'number'
    end
    object MTE_OnkoYear: TSmallintField
      FieldName = 'Year'
    end
    object MTE_OnkoOrganization: TStringField
      DisplayWidth = 150
      FieldName = 'Organization'
      Required = True
      Size = 150
    end
    object MTE_OnkoKategory: TSmallintField
      FieldName = 'Kategory'
    end
    object MTE_OnkoInventDate: TDateField
      FieldName = 'InventDate'
    end
    object MTE_OnkoInvent: TSmallintField
      FieldName = 'Invent'
    end
    object MTE_OnkoTo: TSmallintField
      FieldName = 'To'
    end
    object MTE_OnkoFrom: TSmallintField
      FieldName = 'From'
    end
    object MTE_OnkoIn: TSmallintField
      FieldName = 'In'
    end
    object MTE_OnkoOut: TSmallintField
      FieldName = 'Out'
    end
    object MTE_OnkoBalance: TSmallintField
      FieldName = 'Balance'
    end
    object MTE_OnkonextInvent: TSmallintField
      FieldName = 'nextInvent'
    end
    object MTE_OnkonextInventDate: TDateField
      FieldName = 'nextInventDate'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object number: TMTNumericDataFieldEh
          FieldName = 'number'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Year: TMTNumericDataFieldEh
          FieldName = 'Year'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Organization: TMTStringDataFieldEh
          FieldName = 'Organization'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 150
        end
        object Kategory: TMTNumericDataFieldEh
          FieldName = 'Kategory'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object InventDate: TMTDateTimeDataFieldEh
          FieldName = 'InventDate'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Invent: TMTNumericDataFieldEh
          FieldName = 'Invent'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object To: TMTNumericDataFieldEh
          FieldName = 'To'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object From: TMTNumericDataFieldEh
          FieldName = 'From'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object In: TMTNumericDataFieldEh
          FieldName = 'In'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Out: TMTNumericDataFieldEh
          FieldName = 'Out'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Balance: TMTNumericDataFieldEh
          FieldName = 'Balance'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object nextInvent: TMTNumericDataFieldEh
          FieldName = 'nextInvent'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object nextInventDate: TMTDateTimeDataFieldEh
          FieldName = 'nextInventDate'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object DS_Onko: TDataSource
    DataSet = MTE_Onko
    Left = 216
    Top = 368
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  sum(Sht) as '#39'To'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      #9'and OpCod in (31, 32, 35, 37, 38, 39) '
      #9'and Kateg = :kateg'
      ''
      'left join'
      ''
      '(SELECT  sum(Sht) as '#39'From'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      #9'and OpCod in (21, 22, 25, 27, 28, 29) '
      #9'and Kateg = :kateg) as From'
      ''
      'left join'
      ''
      '(SELECT  sum(Sht) as '#39'In'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      
        #9'and OpCod in (11, 12, 15, 17, 58, 62, 73, 74, 75, 85, 86, 87, 8' +
        '8, 97) '
      #9'and Kateg = :kateg) '
      ''
      'left join'
      ''
      '(SELECT  sum(Sht) as '#39'out'#39
      ' FROM [dbo].[Zri] as r'
      #9'left join FORMP as F ON f.id = r.idf'
      #9'left join SprORG as s ON s.id = f.IDP'
      #9'where'
      #9's.NAME_SHORT= :name'
      #9'and opdate between :date1 and :date2'
      
        #9'and OpCod in (41, 42, 43, 46, 47, 48, 61, 65, 67, 71, 72, 81, 8' +
        '2, 83, 84, 98) '
      #9'and Kateg = :kateg)')
    Left = 64
    Top = 290
  end
  object ADOZRIQIzgot: TADOQuery
    Connection = ADOConnection2
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'izgot'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'year'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT distinct([Key])'
      ''
      '  FROM [dbo].[StaticSourceAllow]'
      '  where   '
      #9'izgotOKPO = :izgot'
      #9'and year(IzgotDate) = :year'
      #9'and Kateg = :kateg'
      ''
      '')
    Left = 320
    Top = 42
    object ADOZRIQIzgotKey: TWideStringField
      FieldName = 'Key'
      Size = 350
    end
  end
  object ADOZRIQOper: TADOQuery
    Connection = ADOConnection2
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tokenKey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 350
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '      [KOD_ORG]'
      '      ,opCod'
      '      ,opdate'
      '     ,okpo'
      '      ,okpoPip'
      '  ,operationPriority'
      '      ,[typ]'
      '      ,[paspN]'
      '      ,[numb]'
      '      ,[kateg]'
      '      ,[izgotDate]'
      '      ,[izgotOKPO]'
      '      , [Key]'
      ''
      '  FROM [dbo].[StaticSourceAllow]'
      'where'
      ' [Key]= :tokenKey'
      ''
      'order by  opdate, operationPriority desc, OpCod'
      ''
      '')
    Left = 320
    Top = 98
    object ADOZRIQOperKOD_ORG: TWideStringField
      FieldName = 'KOD_ORG'
      Size = 10
    end
    object ADOZRIQOperopCod: TIntegerField
      FieldName = 'opCod'
    end
    object ADOZRIQOperopdate: TWideStringField
      FieldName = 'opdate'
      Size = 10
    end
    object ADOZRIQOperokpoPip: TWideStringField
      FieldName = 'okpoPip'
      Size = 150
    end
    object ADOZRIQOperoperationPriority: TIntegerField
      FieldName = 'operationPriority'
    end
    object ADOZRIQOpertyp: TWideStringField
      FieldName = 'typ'
      Size = 150
    end
    object ADOZRIQOperpaspN: TWideStringField
      FieldName = 'paspN'
      Size = 150
    end
    object ADOZRIQOpernumb: TWideStringField
      FieldName = 'numb'
      Size = 150
    end
    object ADOZRIQOperkateg: TIntegerField
      FieldName = 'kateg'
    end
    object ADOZRIQOperizgotDate: TWideStringField
      FieldName = 'izgotDate'
      Size = 10
    end
    object ADOZRIQOperizgotOKPO: TWideStringField
      FieldName = 'izgotOKPO'
      Size = 150
    end
    object ADOZRIQOperokpo: TWideStringField
      FieldName = 'okpo'
      Size = 50
    end
    object ADOZRIQOperKey: TWideStringField
      FieldName = 'Key'
      Size = 350
    end
  end
  object MTE_ZRI00: TMemTableEh
    AggregatesActive = True
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'Type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Passport'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IzgotDate'
        DataType = ftDate
      end
      item
        Name = 'Izgot'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Activn'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Kategory'
        DataType = ftSmallint
        Precision = 15
      end>
    Filter = '1=1'
    Filtered = True
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 160
    object MTE_ZRI00Type: TStringField
      FieldName = 'Type'
    end
    object MTE_ZRI00Number: TStringField
      FieldName = 'Number'
    end
    object MTE_ZRI00Passport: TStringField
      FieldName = 'Passport'
    end
    object MTE_ZRI00IzgotDate: TDateField
      FieldName = 'IzgotDate'
    end
    object MTE_ZRI00Izgot: TStringField
      FieldName = 'Izgot'
    end
    object MTE_ZRI00Activn: TFloatField
      DisplayWidth = 8
      FieldName = 'Activn'
    end
    object MTE_ZRI00Kategory: TSmallintField
      FieldName = 'Kategory'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object Type: TMTStringDataFieldEh
          FieldName = 'Type'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Number: TMTStringDataFieldEh
          FieldName = 'Number'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Passport: TMTStringDataFieldEh
          FieldName = 'Passport'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object IzgotDate: TMTDateTimeDataFieldEh
          FieldName = 'IzgotDate'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Izgot: TMTStringDataFieldEh
          FieldName = 'Izgot'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Activn: TMTNumericDataFieldEh
          FieldName = 'Activn'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Kategory: TMTNumericDataFieldEh
          FieldName = 'Kategory'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object OpDate1: TMTDateTimeDataFieldEh
          FieldName = 'OpDate1'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper1: TMTNumericDataFieldEh
          FieldName = 'Oper1'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org1: TMTStringDataFieldEh
          FieldName = 'Org1'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate2: TMTDateTimeDataFieldEh
          FieldName = 'OpDate2'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper2: TMTNumericDataFieldEh
          FieldName = 'Oper2'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org2: TMTStringDataFieldEh
          FieldName = 'Org2'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate3: TMTDateTimeDataFieldEh
          FieldName = 'OpDate3'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper3: TMTNumericDataFieldEh
          FieldName = 'Oper3'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org3: TMTStringDataFieldEh
          FieldName = 'Org3'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate4: TMTDateTimeDataFieldEh
          FieldName = 'OpDate4'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper4: TMTNumericDataFieldEh
          FieldName = 'Oper4'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org4: TMTStringDataFieldEh
          FieldName = 'Org4'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate5: TMTDateTimeDataFieldEh
          FieldName = 'OpDate5'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper5: TMTNumericDataFieldEh
          FieldName = 'Oper5'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org5: TMTStringDataFieldEh
          FieldName = 'Org5'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate6: TMTDateTimeDataFieldEh
          FieldName = 'OpDate6'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper6: TMTNumericDataFieldEh
          FieldName = 'Oper6'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org6: TMTStringDataFieldEh
          FieldName = 'Org6'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate7: TMTDateTimeDataFieldEh
          FieldName = 'OpDate7'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper7: TMTNumericDataFieldEh
          FieldName = 'Oper7'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org7: TMTStringDataFieldEh
          FieldName = 'Org7'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate8: TMTDateTimeDataFieldEh
          FieldName = 'OpDate8'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper8: TMTNumericDataFieldEh
          FieldName = 'Oper8'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org8: TMTStringDataFieldEh
          FieldName = 'Org8'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate9: TMTDateTimeDataFieldEh
          FieldName = 'OpDate9'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper9: TMTNumericDataFieldEh
          FieldName = 'Oper9'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org9: TMTStringDataFieldEh
          FieldName = 'Org9'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate10: TMTDateTimeDataFieldEh
          FieldName = 'OpDate10'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper10: TMTNumericDataFieldEh
          FieldName = 'Oper10'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org10: TMTStringDataFieldEh
          FieldName = 'Org10'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate11: TMTDateTimeDataFieldEh
          FieldName = 'OpDate11'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 18
        end
        object Oper11: TMTNumericDataFieldEh
          FieldName = 'Oper11'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org11: TMTStringDataFieldEh
          FieldName = 'Org11'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate12: TMTDateTimeDataFieldEh
          FieldName = 'OpDate12'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper12: TMTNumericDataFieldEh
          FieldName = 'Oper12'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org12: TMTStringDataFieldEh
          FieldName = 'Org12'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate13: TMTDateTimeDataFieldEh
          FieldName = 'OpDate13'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper13: TMTNumericDataFieldEh
          FieldName = 'Oper13'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org13: TMTStringDataFieldEh
          FieldName = 'Org13'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate14: TMTDateTimeDataFieldEh
          FieldName = 'OpDate14'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper14: TMTNumericDataFieldEh
          FieldName = 'Oper14'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org14: TMTStringDataFieldEh
          FieldName = 'Org14'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate15: TMTDateTimeDataFieldEh
          FieldName = 'OpDate15'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper15: TMTNumericDataFieldEh
          FieldName = 'Oper15'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org15: TMTStringDataFieldEh
          FieldName = 'Org15'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate16: TMTDateTimeDataFieldEh
          FieldName = 'OpDate16'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper16: TMTNumericDataFieldEh
          FieldName = 'Oper16'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org16: TMTStringDataFieldEh
          FieldName = 'Org16'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate17: TMTDateTimeDataFieldEh
          FieldName = 'OpDate17'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper17: TMTNumericDataFieldEh
          FieldName = 'Oper17'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org17: TMTStringDataFieldEh
          FieldName = 'Org17'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate18: TMTDateTimeDataFieldEh
          FieldName = 'OpDate18'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper18: TMTNumericDataFieldEh
          FieldName = 'Oper18'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org18: TMTStringDataFieldEh
          FieldName = 'Org18'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate19: TMTDateTimeDataFieldEh
          FieldName = 'OpDate19'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper19: TMTNumericDataFieldEh
          FieldName = 'Oper19'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org19: TMTStringDataFieldEh
          FieldName = 'Org19'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate20: TMTDateTimeDataFieldEh
          FieldName = 'OpDate20'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper20: TMTNumericDataFieldEh
          FieldName = 'Oper20'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org20: TMTStringDataFieldEh
          FieldName = 'Org20'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object DS_ZRI: TDataSource
    DataSet = MTE_ZRI
    Left = 392
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      #9'  z.[Kateg]'
      '      ,z.[PaspN]'
      '      ,z.[Typ]'
      '      ,z.[Nuclid]'
      '      ,z.[Numb]'
      '      ,z.[Sht]'
      '      ,z.[Activn]'
      '      ,z.[IzgotOKPO]'
      '      ,CONVERT(VarChar(50), z.[IzgotDate], 104) as '#39'Izgot_Date'#39
      ''
      '  FROM ('
      '  SELECT s.KOD_ORG'
      #9'  ,s.OKPO'
      #9'  ,s.NAME_SHORT'
      '      ,[OpCod]'
      '      ,CONVERT(VarChar(50), [OpDate], 104) as '#39'OpDate'#39
      '      ,[PaspN]'
      '      ,[Typ]'
      '      ,[Nuclid]'
      '      ,[Numb]'
      '      ,[Sht]'
      '      ,[Activn]'
      '      ,[IzgotOKPO]'
      '      ,CONVERT(VarChar(50), [IzgotDate], 104) as '#39'IzgotDate'#39
      '      ,[Kateg]'
      '      ,[Nss]'
      '      ,[DocVid]'
      '      ,[DocN]'
      '      ,CONVERT(VarChar(50), [DocDate], 104) as '#39'DocDate'#39
      '      ,[OkpoPIP]'
      '      ,[OkpoPrv]'
      '      ,[PrName]'
      '      ,[UktPrTyp]'
      '      ,[UktPrN]'
      ''
      '  FROM [dbo].[Zri] as r'
      'left join FORMP as F ON f.id = r.idf'
      'left join SprORG as s ON s.id = f.IDP'
      'where s.KOD_ORG = '#39'74047'#39
      '  ) as z'
      'where IzgotDate is not NULL'
      
        #9'group by Year([IzgotDate]), [Kateg], [Typ] ,[Nuclid],[Sht],[Act' +
        'ivn], [Numb], [PaspN], [IzgotDate],[IzgotOKPO]'
      #9'order by Year([IzgotDate]), [Kateg], [Typ], [Numb], [PaspN]')
    Left = 536
    Top = 402
    object ADOQuery2Kateg: TSmallintField
      FieldName = 'Kateg'
    end
    object ADOQuery2PaspN: TWideStringField
      FieldName = 'PaspN'
      Size = 100
    end
    object ADOQuery2Typ: TWideStringField
      FieldName = 'Typ'
      Size = 150
    end
    object ADOQuery2Nuclid: TWideStringField
      FieldName = 'Nuclid'
      Size = 255
    end
    object ADOQuery2Numb: TWideStringField
      FieldName = 'Numb'
      Size = 100
    end
    object ADOQuery2Sht: TIntegerField
      FieldName = 'Sht'
    end
    object ADOQuery2Activn: TFloatField
      FieldName = 'Activn'
    end
    object ADOQuery2IzgotOKPO: TWideStringField
      FieldName = 'IzgotOKPO'
      Size = 50
    end
    object ADOQuery2Izgot_Date: TStringField
      FieldName = 'Izgot_Date'
      ReadOnly = True
      Size = 50
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'izgotDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'typ'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 150
        Value = Null
      end
      item
        Name = 'kategory'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'numb'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'pasport'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '      s.Kod_Org'
      '      ,opCod'
      '      ,opdate'
      '      ,OkpoPIP'
      ''
      '  FROM [dbo].[Zri] as r'
      '      left join FORMP as F ON f.id = r.idf'
      '      left join SprORG as s ON s.id = f.IDP'
      'where'
      ' s.KOD_ORG = '#39'74047'#39
      '    and IzgotDate =  :izgotDate'
      '    and Typ = :typ '
      '    and Kateg = :kategory'
      '    and Numb = :numb'
      '    and PaspN = :pasport'
      'order by  opdate, OpCod'
      ''
      '')
    Left = 608
    Top = 402
    object ADOQuery3Kod_Org: TWideStringField
      FieldName = 'Kod_Org'
      Size = 5
    end
    object ADOQuery3opCod: TSmallintField
      FieldName = 'opCod'
    end
    object ADOQuery3opdate: TDateTimeField
      FieldName = 'opdate'
    end
    object ADOQuery3OkpoPIP: TWideStringField
      FieldName = 'OkpoPIP'
      Size = 50
    end
  end
  object ZRIQOper_MTE: TMemTableEh
    AggregatesActive = True
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'KOD_ORG'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'opCod'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'opdate'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'okpo'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'okpoPip'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'operationPriority'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'typ'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'paspN'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'numb'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'kateg'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'izgotDate'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'izgotOKPO'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'Key'
        DataType = ftWideString
        Size = 350
      end>
    Filter = '1=1'
    Filtered = True
    IndexDefs = <>
    Params = <>
    DataDriver = ZRIQOper_DDE
    StoreDefs = True
    Left = 560
    Top = 112
    object ZRIQOper_MTEKOD_ORG: TWideStringField
      FieldName = 'KOD_ORG'
      Size = 10
    end
    object ZRIQOper_MTEopCod: TIntegerField
      FieldName = 'opCod'
    end
    object ZRIQOper_MTEopdate: TWideStringField
      FieldName = 'opdate'
      Size = 10
    end
    object ZRIQOper_MTEokpo: TWideStringField
      FieldName = 'okpo'
      Size = 50
    end
    object ZRIQOper_MTEokpoPip: TWideStringField
      FieldName = 'okpoPip'
      Size = 150
    end
    object ZRIQOper_MTEoperationPriority: TIntegerField
      FieldName = 'operationPriority'
    end
    object ZRIQOper_MTEtyp: TWideStringField
      FieldName = 'typ'
      Size = 150
    end
    object ZRIQOper_MTEpaspN: TWideStringField
      FieldName = 'paspN'
      Size = 150
    end
    object ZRIQOper_MTEnumb: TWideStringField
      FieldName = 'numb'
      Size = 150
    end
    object ZRIQOper_MTEkateg: TIntegerField
      FieldName = 'kateg'
    end
    object ZRIQOper_MTEizgotDate: TWideStringField
      FieldName = 'izgotDate'
      Size = 10
    end
    object ZRIQOper_MTEizgotOKPO: TWideStringField
      FieldName = 'izgotOKPO'
      Size = 150
    end
    object ZRIQOper_MTEKey: TWideStringField
      FieldName = 'Key'
      Size = 350
    end
  end
  object ZRIQOper_DS: TDataSource
    DataSet = ZRIQOper_MTE
    Left = 560
    Top = 160
  end
  object ADOOrg: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'kodorg'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 14
        Value = Null
      end>
    SQL.Strings = (
      'SELECT KOD_ORG'
      '  ,OKPO'
      '  ,NAME_SHORT'
      ''
      '  FROM [dbo].[SprOrg]'
      '  where OKPO = :kodorg')
    Left = 320
    Top = 402
    object ADOOrgKOD_ORG: TWideStringField
      FieldName = 'KOD_ORG'
      Size = 5
    end
    object ADOOrgOKPO: TWideStringField
      FieldName = 'OKPO'
      Size = 14
    end
    object ADOOrgNAME_SHORT: TWideStringField
      FieldName = 'NAME_SHORT'
      Size = 150
    end
  end
  object MTE_ZRI: TMemTableEh
    AggregatesActive = True
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'idx'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Passport'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IzgotDate'
        DataType = ftDate
      end
      item
        Name = 'Izgot'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Errors'
        DataType = ftBoolean
      end
      item
        Name = 'Kategory'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Key'
        DataType = ftString
        Size = 20
      end>
    Filter = '1=1'
    Filtered = True
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 168
    object MTE_ZRIidx: TSmallintField
      FieldName = 'idx'
    end
    object MTE_ZRIErrors: TBooleanField
      FieldName = 'Errors'
    end
    object StringField1: TStringField
      DisplayWidth = 20
      FieldName = 'Type'
    end
    object StringField2: TStringField
      FieldName = 'Number'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Passport'
      Size = 50
    end
    object DateField1: TDateField
      FieldName = 'IzgotDate'
    end
    object StringField4: TStringField
      FieldName = 'Izgot'
    end
    object SmallintField1: TSmallintField
      FieldName = 'Kategory'
    end
    object MTE_ZRIKey: TStringField
      FieldName = 'Key'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object idx: TMTNumericDataFieldEh
          FieldName = 'idx'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Type: TMTStringDataFieldEh
          FieldName = 'Type'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Number: TMTStringDataFieldEh
          FieldName = 'Number'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Passport: TMTStringDataFieldEh
          FieldName = 'Passport'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object IzgotDate: TMTDateTimeDataFieldEh
          FieldName = 'IzgotDate'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Izgot: TMTStringDataFieldEh
          FieldName = 'Izgot'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Errors: TMTBooleanDataFieldEh
          FieldName = 'Errors'
          DisplayWidth = 20
        end
        object Kategory: TMTNumericDataFieldEh
          FieldName = 'Kategory'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Key: TMTStringDataFieldEh
          FieldName = 'Key'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object DS_ZRI_old: TDataSource
    DataSet = MTE_ZRI00
    Left = 320
    Top = 232
  end
  object MemTableEh1: TMemTableEh
    AggregatesActive = True
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'Type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Passport'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IzgotDate'
        DataType = ftDate
      end
      item
        Name = 'Izgot'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Activn'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Kategory'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'OpDate1'
        DataType = ftDate
      end
      item
        Name = 'Oper1'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate2'
        DataType = ftDate
      end
      item
        Name = 'Oper2'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate3'
        DataType = ftDate
      end
      item
        Name = 'Oper3'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate4'
        DataType = ftDate
      end
      item
        Name = 'Oper4'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate5'
        DataType = ftDate
      end
      item
        Name = 'Oper5'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate6'
        DataType = ftDate
      end
      item
        Name = 'Oper6'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org6'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate7'
        DataType = ftDate
      end
      item
        Name = 'Oper7'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org7'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate8'
        DataType = ftDate
      end
      item
        Name = 'Oper8'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org8'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate9'
        DataType = ftDate
      end
      item
        Name = 'Oper9'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org9'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate10'
        DataType = ftDate
      end
      item
        Name = 'Oper10'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org10'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate11'
        DataType = ftDate
      end
      item
        Name = 'Oper11'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org11'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate12'
        DataType = ftDate
      end
      item
        Name = 'Oper12'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org12'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate13'
        DataType = ftDate
      end
      item
        Name = 'Oper13'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org13'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate14'
        DataType = ftDate
      end
      item
        Name = 'Oper14'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org14'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate15'
        DataType = ftDate
      end
      item
        Name = 'Oper15'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org15'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate16'
        DataType = ftDate
      end
      item
        Name = 'Oper16'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org16'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate17'
        DataType = ftDate
      end
      item
        Name = 'Oper17'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org17'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate18'
        DataType = ftDate
      end
      item
        Name = 'Oper18'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org18'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate19'
        DataType = ftDate
      end
      item
        Name = 'Oper19'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org19'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OpDate20'
        DataType = ftDate
      end
      item
        Name = 'Oper20'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'Org20'
        DataType = ftString
        Size = 20
      end>
    Filter = '1=1'
    Filtered = True
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 296
    object StringField5: TStringField
      FieldName = 'Type'
    end
    object StringField6: TStringField
      FieldName = 'Number'
    end
    object StringField7: TStringField
      FieldName = 'Passport'
    end
    object DateField2: TDateField
      FieldName = 'IzgotDate'
    end
    object StringField8: TStringField
      FieldName = 'Izgot'
    end
    object FloatField2: TFloatField
      DisplayWidth = 8
      FieldName = 'Activn'
    end
    object SmallintField2: TSmallintField
      FieldName = 'Kategory'
    end
    object DateField3: TDateField
      FieldName = 'OpDate1'
    end
    object SmallintField3: TSmallintField
      FieldName = 'Oper1'
    end
    object StringField9: TStringField
      FieldName = 'Org1'
    end
    object DateField4: TDateField
      FieldName = 'OpDate2'
    end
    object SmallintField4: TSmallintField
      FieldName = 'Oper2'
    end
    object StringField10: TStringField
      FieldName = 'Org2'
    end
    object DateField5: TDateField
      FieldName = 'OpDate3'
    end
    object SmallintField5: TSmallintField
      FieldName = 'Oper3'
    end
    object StringField11: TStringField
      FieldName = 'Org3'
    end
    object DateField6: TDateField
      FieldName = 'OpDate4'
    end
    object SmallintField6: TSmallintField
      FieldName = 'Oper4'
    end
    object StringField12: TStringField
      FieldName = 'Org4'
    end
    object DateField7: TDateField
      FieldName = 'OpDate5'
    end
    object SmallintField7: TSmallintField
      FieldName = 'Oper5'
    end
    object StringField13: TStringField
      FieldName = 'Org5'
    end
    object DateField8: TDateField
      FieldName = 'OpDate6'
    end
    object SmallintField8: TSmallintField
      FieldName = 'Oper6'
    end
    object StringField14: TStringField
      FieldName = 'Org6'
    end
    object DateField9: TDateField
      FieldName = 'OpDate7'
    end
    object SmallintField9: TSmallintField
      FieldName = 'Oper7'
    end
    object StringField15: TStringField
      FieldName = 'Org7'
    end
    object DateField10: TDateField
      FieldName = 'OpDate8'
    end
    object SmallintField10: TSmallintField
      FieldName = 'Oper8'
    end
    object StringField16: TStringField
      FieldName = 'Org8'
    end
    object DateField11: TDateField
      FieldName = 'OpDate9'
    end
    object SmallintField11: TSmallintField
      FieldName = 'Oper9'
    end
    object StringField17: TStringField
      FieldName = 'Org9'
    end
    object DateField12: TDateField
      FieldName = 'OpDate10'
    end
    object SmallintField12: TSmallintField
      FieldName = 'Oper10'
    end
    object StringField18: TStringField
      FieldName = 'Org10'
    end
    object DateField13: TDateField
      FieldName = 'OpDate11'
    end
    object SmallintField13: TSmallintField
      FieldName = 'Oper11'
    end
    object StringField19: TStringField
      FieldName = 'Org11'
    end
    object DateField14: TDateField
      FieldName = 'OpDate12'
    end
    object SmallintField14: TSmallintField
      FieldName = 'Oper12'
    end
    object StringField20: TStringField
      FieldName = 'Org12'
    end
    object DateField15: TDateField
      FieldName = 'OpDate13'
    end
    object SmallintField15: TSmallintField
      FieldName = 'Oper13'
    end
    object StringField21: TStringField
      FieldName = 'Org13'
    end
    object DateField16: TDateField
      FieldName = 'OpDate14'
    end
    object SmallintField16: TSmallintField
      FieldName = 'Oper14'
    end
    object StringField22: TStringField
      FieldName = 'Org14'
    end
    object DateField17: TDateField
      FieldName = 'OpDate15'
    end
    object SmallintField17: TSmallintField
      FieldName = 'Oper15'
    end
    object StringField23: TStringField
      FieldName = 'Org15'
    end
    object DateField18: TDateField
      FieldName = 'OpDate16'
    end
    object SmallintField18: TSmallintField
      FieldName = 'Oper16'
    end
    object StringField24: TStringField
      FieldName = 'Org16'
    end
    object DateField19: TDateField
      FieldName = 'OpDate17'
    end
    object SmallintField19: TSmallintField
      FieldName = 'Oper17'
    end
    object StringField25: TStringField
      FieldName = 'Org17'
    end
    object DateField20: TDateField
      FieldName = 'OpDate18'
    end
    object SmallintField20: TSmallintField
      FieldName = 'Oper18'
    end
    object StringField26: TStringField
      FieldName = 'Org18'
    end
    object DateField21: TDateField
      FieldName = 'OpDate19'
    end
    object SmallintField21: TSmallintField
      FieldName = 'Oper19'
    end
    object StringField27: TStringField
      FieldName = 'Org19'
    end
    object DateField22: TDateField
      FieldName = 'OpDate20'
    end
    object SmallintField22: TSmallintField
      FieldName = 'Oper20'
    end
    object StringField28: TStringField
      FieldName = 'Org20'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object Type: TMTStringDataFieldEh
          FieldName = 'Type'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Number: TMTStringDataFieldEh
          FieldName = 'Number'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Passport: TMTStringDataFieldEh
          FieldName = 'Passport'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object IzgotDate: TMTDateTimeDataFieldEh
          FieldName = 'IzgotDate'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Izgot: TMTStringDataFieldEh
          FieldName = 'Izgot'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object Activn: TMTNumericDataFieldEh
          FieldName = 'Activn'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Kategory: TMTNumericDataFieldEh
          FieldName = 'Kategory'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object OpDate1: TMTDateTimeDataFieldEh
          FieldName = 'OpDate1'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper1: TMTNumericDataFieldEh
          FieldName = 'Oper1'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org1: TMTStringDataFieldEh
          FieldName = 'Org1'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate2: TMTDateTimeDataFieldEh
          FieldName = 'OpDate2'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper2: TMTNumericDataFieldEh
          FieldName = 'Oper2'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org2: TMTStringDataFieldEh
          FieldName = 'Org2'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate3: TMTDateTimeDataFieldEh
          FieldName = 'OpDate3'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper3: TMTNumericDataFieldEh
          FieldName = 'Oper3'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org3: TMTStringDataFieldEh
          FieldName = 'Org3'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate4: TMTDateTimeDataFieldEh
          FieldName = 'OpDate4'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper4: TMTNumericDataFieldEh
          FieldName = 'Oper4'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org4: TMTStringDataFieldEh
          FieldName = 'Org4'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate5: TMTDateTimeDataFieldEh
          FieldName = 'OpDate5'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper5: TMTNumericDataFieldEh
          FieldName = 'Oper5'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org5: TMTStringDataFieldEh
          FieldName = 'Org5'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate6: TMTDateTimeDataFieldEh
          FieldName = 'OpDate6'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper6: TMTNumericDataFieldEh
          FieldName = 'Oper6'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org6: TMTStringDataFieldEh
          FieldName = 'Org6'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate7: TMTDateTimeDataFieldEh
          FieldName = 'OpDate7'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper7: TMTNumericDataFieldEh
          FieldName = 'Oper7'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org7: TMTStringDataFieldEh
          FieldName = 'Org7'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate8: TMTDateTimeDataFieldEh
          FieldName = 'OpDate8'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper8: TMTNumericDataFieldEh
          FieldName = 'Oper8'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org8: TMTStringDataFieldEh
          FieldName = 'Org8'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate9: TMTDateTimeDataFieldEh
          FieldName = 'OpDate9'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper9: TMTNumericDataFieldEh
          FieldName = 'Oper9'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org9: TMTStringDataFieldEh
          FieldName = 'Org9'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate10: TMTDateTimeDataFieldEh
          FieldName = 'OpDate10'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper10: TMTNumericDataFieldEh
          FieldName = 'Oper10'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org10: TMTStringDataFieldEh
          FieldName = 'Org10'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate11: TMTDateTimeDataFieldEh
          FieldName = 'OpDate11'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 18
        end
        object Oper11: TMTNumericDataFieldEh
          FieldName = 'Oper11'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org11: TMTStringDataFieldEh
          FieldName = 'Org11'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate12: TMTDateTimeDataFieldEh
          FieldName = 'OpDate12'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper12: TMTNumericDataFieldEh
          FieldName = 'Oper12'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org12: TMTStringDataFieldEh
          FieldName = 'Org12'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate13: TMTDateTimeDataFieldEh
          FieldName = 'OpDate13'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper13: TMTNumericDataFieldEh
          FieldName = 'Oper13'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org13: TMTStringDataFieldEh
          FieldName = 'Org13'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate14: TMTDateTimeDataFieldEh
          FieldName = 'OpDate14'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper14: TMTNumericDataFieldEh
          FieldName = 'Oper14'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org14: TMTStringDataFieldEh
          FieldName = 'Org14'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate15: TMTDateTimeDataFieldEh
          FieldName = 'OpDate15'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper15: TMTNumericDataFieldEh
          FieldName = 'Oper15'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org15: TMTStringDataFieldEh
          FieldName = 'Org15'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate16: TMTDateTimeDataFieldEh
          FieldName = 'OpDate16'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper16: TMTNumericDataFieldEh
          FieldName = 'Oper16'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org16: TMTStringDataFieldEh
          FieldName = 'Org16'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate17: TMTDateTimeDataFieldEh
          FieldName = 'OpDate17'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper17: TMTNumericDataFieldEh
          FieldName = 'Oper17'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org17: TMTStringDataFieldEh
          FieldName = 'Org17'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate18: TMTDateTimeDataFieldEh
          FieldName = 'OpDate18'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper18: TMTNumericDataFieldEh
          FieldName = 'Oper18'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org18: TMTStringDataFieldEh
          FieldName = 'Org18'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate19: TMTDateTimeDataFieldEh
          FieldName = 'OpDate19'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper19: TMTNumericDataFieldEh
          FieldName = 'Oper19'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org19: TMTStringDataFieldEh
          FieldName = 'Org19'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object OpDate20: TMTDateTimeDataFieldEh
          FieldName = 'OpDate20'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object Oper20: TMTNumericDataFieldEh
          FieldName = 'Oper20'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object Org20: TMTStringDataFieldEh
          FieldName = 'Org20'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object MemTableEh3: TMemTableEh
    Params = <>
    Left = 544
    Top = 328
  end
  object ADOZRIQIzgot_Copy: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'izgot'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'year'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'kateg'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Year([IzgotDate]) as '#39'Year'#39
      #9'  ,[Kateg]'
      '      ,[PaspN]'
      '      ,[Typ]'
      '      ,[Numb]'
      '      ,[IzgotOKPO]'
      '      ,CONVERT(VarChar(50), [IzgotDate], 104) as '#39'Izgot_Date'#39
      ''
      '  FROM [dbo].[Zri]'
      '  where   '
      '--'#9'izgotOKPO in ('#39'08622474'#39', '#39'07622740'#39', '#39'20553876'#39', '#39'08624332'#39')'
      '--'#9'and year(IzgotDate) >= 2014'
      '--'#9'and Kateg in (1, 2, 3)'
      #9'izgotOKPO = :izgot'
      #9'and year(IzgotDate) = :year'
      #9'and Kateg = :kateg'
      ''
      
        #9'group by Year([IzgotDate]), [Kateg], [Typ] ,[Numb], [PaspN], [I' +
        'zgotDate],[IzgotOKPO]'
      #9'order by [Typ], [Numb], [PaspN]'
      ''
      
        '--'#9'group by Year([IzgotDate]), [Kateg], [Typ] ,[Nuclid],[Sht], [' +
        'Numb], [PaspN], [IzgotDate],[IzgotOKPO]'
      '--'#9'order by Year([IzgotDate]), [Kateg], [Typ], [Numb], [PaspN]')
    Left = 472
    Top = 418
    object IntegerField1: TIntegerField
      FieldName = 'Year'
      ReadOnly = True
    end
    object SmallintField23: TSmallintField
      FieldName = 'Kateg'
    end
    object WideStringField1: TWideStringField
      FieldName = 'PaspN'
      Size = 100
    end
    object WideStringField2: TWideStringField
      FieldName = 'Typ'
      Size = 150
    end
    object WideStringField3: TWideStringField
      FieldName = 'Numb'
      Size = 100
    end
    object WideStringField4: TWideStringField
      FieldName = 'IzgotOKPO'
      Size = 50
    end
    object StringField29: TStringField
      FieldName = 'Izgot_Date'
      ReadOnly = True
      Size = 50
    end
  end
  object ADOConnection2: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=QW12erty;Persist Security Info=True' +
      ';User ID=dev;Initial Catalog=CentralPart_ZRI;Data Source=SQL0'
    DefaultDatabase = 'CentralPart_Proc'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 90
  end
  object ZRIQOper_DDE: TADODataDriverEh
    ConnectionProvider = ZRIQOper_CPE
    DynaSQLParams.Options = []
    MacroVars.Macros = <>
    SelectCommand.CommandText.Strings = (
      'SELECT'
      '      [KOD_ORG]'
      '      ,opCod'
      '      ,opdate'
      '     ,okpo'
      '      ,okpoPip'
      '  ,operationPriority'
      '      ,[typ]'
      '      ,[paspN]'
      '      ,[numb]'
      '      ,[kateg]'
      '      ,[izgotDate]'
      '      ,[izgotOKPO]'
      '      , [Key]'
      ''
      '  FROM [dbo].[StaticSourceAllow]'
      'where'
      ' [Key]= :tokenKey'
      ''
      'order by  opdate, operationPriority desc, OpCod'
      '')
    SelectCommand.Parameters = <
      item
        Name = 'tokenKey'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 350
        Value = Null
      end>
    UpdateCommand.Parameters = <>
    InsertCommand.Parameters = <>
    DeleteCommand.Parameters = <>
    GetrecCommand.Parameters = <>
    Left = 560
    Top = 64
  end
  object ZRIQOper_CPE: TADOConnectionProviderEh
    Connection = ADOConnection2
    Left = 560
    Top = 16
  end
end
