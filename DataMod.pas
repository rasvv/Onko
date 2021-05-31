unit DataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, MemTableDataEh,
  MemTableEh, Vcl.Dialogs,Winapi.Messages, DataDriverEh, ADODataDriverEh;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQ10: TADOQuery;
    ADOQ10NAME_SHORT: TWideStringField;
    ADOQ10Kateg: TSmallintField;
    ADOQ10kolvo: TIntegerField;
    ADOQ10Year: TIntegerField;
    ADOQTo: TADOQuery;
    ADOQFrom: TADOQuery;
    ADOQIn: TADOQuery;
    ADOQOut: TADOQuery;
    ADOQInvent: TADOQuery;
    ADOQ10opdate: TDateTimeField;
    ADOQInventopdate: TDateTimeField;
    ADOQInventSht: TIntegerField;
    ADOQTokolvo: TIntegerField;
    ADOQFromkolvo: TIntegerField;
    ADOQInkolvo: TIntegerField;
    ADOQOutkolvo: TIntegerField;
    MTE_Onko: TMemTableEh;
    DS_Onko: TDataSource;
    MTE_Onkonumber: TSmallintField;
    MTE_OnkoYear: TSmallintField;
    MTE_OnkoOrganization: TStringField;
    MTE_OnkoKategory: TSmallintField;
    MTE_OnkoInventDate: TDateField;
    MTE_OnkoInvent: TSmallintField;
    MTE_OnkoTo: TSmallintField;
    MTE_OnkoFrom: TSmallintField;
    MTE_OnkoIn: TSmallintField;
    MTE_OnkoOut: TSmallintField;
    MTE_OnkoBalance: TSmallintField;
    MTE_OnkonextInvent: TSmallintField;
    MTE_OnkonextInventDate: TDateField;
    ADOQuery1: TADOQuery;
    ADOZRIQIzgot: TADOQuery;
    ADOZRIQOper: TADOQuery;
    MTE_ZRI00: TMemTableEh;
    DS_ZRI: TDataSource;
    MTE_ZRI00Type: TStringField;
    MTE_ZRI00Number: TStringField;
    MTE_ZRI00Passport: TStringField;
    MTE_ZRI00IzgotDate: TDateField;
    MTE_ZRI00Izgot: TStringField;
    MTE_ZRI00Kategory: TSmallintField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery2Kateg: TSmallintField;
    ADOQuery2PaspN: TWideStringField;
    ADOQuery2Typ: TWideStringField;
    ADOQuery2Nuclid: TWideStringField;
    ADOQuery2Numb: TWideStringField;
    ADOQuery2Sht: TIntegerField;
    ADOQuery2Activn: TFloatField;
    ADOQuery2IzgotOKPO: TWideStringField;
    ADOQuery2Izgot_Date: TStringField;
    ZRIQOper_MTE: TMemTableEh;
    ADOQuery3Kod_Org: TWideStringField;
    ADOQuery3opCod: TSmallintField;
    ADOQuery3opdate: TDateTimeField;
    ZRIQOper_DS: TDataSource;
    ADOQuery3OkpoPIP: TWideStringField;
    MTE_ZRI00Activn: TFloatField;
    ADOOrg: TADOQuery;
    ADOOrgKOD_ORG: TWideStringField;
    ADOOrgOKPO: TWideStringField;
    ADOOrgNAME_SHORT: TWideStringField;
    MTE_ZRI: TMemTableEh;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateField1: TDateField;
    StringField4: TStringField;
    SmallintField1: TSmallintField;
    DS_ZRI_old: TDataSource;
    MemTableEh1: TMemTableEh;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateField2: TDateField;
    StringField8: TStringField;
    FloatField2: TFloatField;
    SmallintField2: TSmallintField;
    DateField3: TDateField;
    SmallintField3: TSmallintField;
    StringField9: TStringField;
    DateField4: TDateField;
    SmallintField4: TSmallintField;
    StringField10: TStringField;
    DateField5: TDateField;
    SmallintField5: TSmallintField;
    StringField11: TStringField;
    DateField6: TDateField;
    SmallintField6: TSmallintField;
    StringField12: TStringField;
    DateField7: TDateField;
    SmallintField7: TSmallintField;
    StringField13: TStringField;
    DateField8: TDateField;
    SmallintField8: TSmallintField;
    StringField14: TStringField;
    DateField9: TDateField;
    SmallintField9: TSmallintField;
    StringField15: TStringField;
    DateField10: TDateField;
    SmallintField10: TSmallintField;
    StringField16: TStringField;
    DateField11: TDateField;
    SmallintField11: TSmallintField;
    StringField17: TStringField;
    DateField12: TDateField;
    SmallintField12: TSmallintField;
    StringField18: TStringField;
    DateField13: TDateField;
    SmallintField13: TSmallintField;
    StringField19: TStringField;
    DateField14: TDateField;
    SmallintField14: TSmallintField;
    StringField20: TStringField;
    DateField15: TDateField;
    SmallintField15: TSmallintField;
    StringField21: TStringField;
    DateField16: TDateField;
    SmallintField16: TSmallintField;
    StringField22: TStringField;
    DateField17: TDateField;
    SmallintField17: TSmallintField;
    StringField23: TStringField;
    DateField18: TDateField;
    SmallintField18: TSmallintField;
    StringField24: TStringField;
    DateField19: TDateField;
    SmallintField19: TSmallintField;
    StringField25: TStringField;
    DateField20: TDateField;
    SmallintField20: TSmallintField;
    StringField26: TStringField;
    DateField21: TDateField;
    SmallintField21: TSmallintField;
    StringField27: TStringField;
    DateField22: TDateField;
    SmallintField22: TSmallintField;
    StringField28: TStringField;
    MemTableEh3: TMemTableEh;
    MTE_ZRIErrors: TBooleanField;
    ADOZRIQIzgot_Copy: TADOQuery;
    IntegerField1: TIntegerField;
    SmallintField23: TSmallintField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    StringField29: TStringField;
    ADOConnection2: TADOConnection;
    ADOZRIQIzgotKey: TWideStringField;
    ADOZRIQOperKOD_ORG: TWideStringField;
    ADOZRIQOperopCod: TIntegerField;
    ADOZRIQOperopdate: TWideStringField;
    ADOZRIQOperokpoPip: TWideStringField;
    ADOZRIQOperoperationPriority: TIntegerField;
    ADOZRIQOpertyp: TWideStringField;
    ADOZRIQOperpaspN: TWideStringField;
    ADOZRIQOpernumb: TWideStringField;
    ADOZRIQOperkateg: TIntegerField;
    ADOZRIQOperizgotDate: TWideStringField;
    ADOZRIQOperizgotOKPO: TWideStringField;
    ADOZRIQOperokpo: TWideStringField;
    MTE_ZRIidx: TSmallintField;
    ADOZRIQOperKey: TWideStringField;
    MTE_ZRIKey: TStringField;
    ZRIQOper_DDE: TADODataDriverEh;
    ZRIQOper_CPE: TADOConnectionProviderEh;
    ZRIQOper_MTEKOD_ORG: TWideStringField;
    ZRIQOper_MTEopCod: TIntegerField;
    ZRIQOper_MTEopdate: TWideStringField;
    ZRIQOper_MTEokpo: TWideStringField;
    ZRIQOper_MTEokpoPip: TWideStringField;
    ZRIQOper_MTEoperationPriority: TIntegerField;
    ZRIQOper_MTEtyp: TWideStringField;
    ZRIQOper_MTEpaspN: TWideStringField;
    ZRIQOper_MTEnumb: TWideStringField;
    ZRIQOper_MTEkateg: TIntegerField;
    ZRIQOper_MTEizgotDate: TWideStringField;
    ZRIQOper_MTEizgotOKPO: TWideStringField;
    ZRIQOper_MTEKey: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure MTE_Add_Columns(ColumnsCount: Integer);
  private
    procedure AddMemField(I: Integer; FldName: String; FldType: TFieldType);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
  ADOConnection1.Connected := true;
  ADOConnection2.Connected := true;

  except
    ShowMessage('Что-то пошло не так!');
  end;
end;


procedure TDM.MTE_Add_Columns(ColumnsCount: Integer);
var
I, j: Integer;
F: TField;
fldDef: TFieldDef;
begin

  if MTE_ZRI.Active then MTE_ZRI.Close;

  for I := 17 to ColumnsCount do
  Begin
    AddMemField(I, 'OpDate', ftDate);

  End;

  MTE_ZRI.Open;
end;

procedure TDM.AddMemField(I: Integer; FldName: String; FldType: TFieldType);
var
  fldDef: TFieldDef;
  fld: TField;
  ff, fff: Integer;
begin
  ff := MTE_ZRI.FieldDefList.Count;
  fff := MTE_ZRI.Fields.Count;
  fldDef := MTE_ZRI.FieldDefs.AddFieldDef;
  fldDef.Name := FldName + IntToStr(I);
  fldDef.DataType := FldType;
//  if FldType = ftString then fldDef.Size := 20;

  fld := fldDef.CreateField(MTE_ZRI);
  fld.FieldName := FldName + IntToStr(I);
  fld.Name := FldName + IntToStr(I);
  if FldType = ftString then fld.Size := 20;
  fld.DataSet := MTE_ZRI;

  ff := MTE_ZRI.FieldDefList.Count;
  fff := MTE_ZRI.Fields.Count;


//  fld.DataType := FldType;



end;

end.
