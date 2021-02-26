unit DataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, MemTableDataEh,
  MemTableEh, Vcl.Dialogs,Winapi.Messages;

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
    MTE_ZRI: TMemTableEh;
    DS_ZRI: TDataSource;
    MTE_ZRIType: TStringField;
    MTE_ZRINumber: TStringField;
    MTE_ZRIPassport: TStringField;
    MTE_ZRIIzgotDate: TDateField;
    MTE_ZRIIzgot: TStringField;
    MTE_ZRIKategory: TSmallintField;
    MTE_ZRIOpDate1: TDateField;
    MTE_ZRIOper1: TSmallintField;
    MTE_ZRIOpDate2: TDateField;
    MTE_ZRIOper2: TSmallintField;
    MTE_ZRIOpDate3: TDateField;
    MTE_ZRIOper3: TSmallintField;
    MTE_ZRIOpDate4: TDateField;
    MTE_ZRIOper4: TSmallintField;
    MTE_ZRIOpDate5: TDateField;
    MTE_ZRIOper5: TSmallintField;
    MTE_ZRIOpDate6: TDateField;
    MTE_ZRIOper6: TSmallintField;
    MTE_ZRIOpDate7: TDateField;
    MTE_ZRIOper7: TSmallintField;
    MTE_ZRIOpDate8: TDateField;
    MTE_ZRIOper8: TSmallintField;
    MTE_ZRIOpDate9: TDateField;
    MTE_ZRIOper9: TSmallintField;
    MTE_ZRIOpDate10: TDateField;
    MTE_ZRIOper10: TSmallintField;
    MTE_ZRIOrg1: TStringField;
    MTE_ZRIOrg2: TStringField;
    MTE_ZRIOrg3: TStringField;
    MTE_ZRIOrg4: TStringField;
    MTE_ZRIOrg5: TStringField;
    MTE_ZRIOrg6: TStringField;
    MTE_ZRIOrg7: TStringField;
    MTE_ZRIOrg8: TStringField;
    MTE_ZRIOrg9: TStringField;
    MTE_ZRIOrg10: TStringField;
    ADOZRIQIzgotYear: TIntegerField;
    ADOZRIQIzgotKateg: TSmallintField;
    ADOZRIQIzgotPaspN: TWideStringField;
    ADOZRIQIzgotTyp: TWideStringField;
    ADOZRIQIzgotNuclid: TWideStringField;
    ADOZRIQIzgotNumb: TWideStringField;
    ADOZRIQIzgotSht: TIntegerField;
    ADOZRIQIzgotActivn: TFloatField;
    ADOZRIQIzgotIzgotOKPO: TWideStringField;
    ADOZRIQIzgotIzgot_Date: TStringField;
    ADOZRIQOperKod_Org: TWideStringField;
    ADOZRIQOperopCod: TSmallintField;
    ADOZRIQOperopdate: TDateTimeField;
    MTE_ZRIOpDate11: TDateField;
    MTE_ZRIOper11: TSmallintField;
    MTE_ZRIOrg11: TStringField;
    MTE_ZRIOpDate12: TDateField;
    MTE_ZRIOper12: TSmallintField;
    MTE_ZRIOrg12: TStringField;
    MTE_ZRIOpDate13: TDateField;
    MTE_ZRIOper13: TSmallintField;
    MTE_ZRIOrg13: TStringField;
    MTE_ZRIOpDate14: TDateField;
    MTE_ZRIOper14: TSmallintField;
    MTE_ZRIOrg14: TStringField;
    MTE_ZRIOpDate15: TDateField;
    MTE_ZRIOper15: TSmallintField;
    MTE_ZRIOrg15: TStringField;
    MTE_ZRIOpDate16: TDateField;
    MTE_ZRIOper16: TSmallintField;
    MTE_ZRIOrg16: TStringField;
    MTE_ZRIOpDate17: TDateField;
    MTE_ZRIOper17: TSmallintField;
    MTE_ZRIOrg17: TStringField;
    MTE_ZRIOpDate18: TDateField;
    MTE_ZRIOper18: TSmallintField;
    MTE_ZRIOrg18: TStringField;
    MTE_ZRIOpDate19: TDateField;
    MTE_ZRIOper19: TSmallintField;
    MTE_ZRIOrg19: TStringField;
    MTE_ZRIOpDate20: TDateField;
    MTE_ZRIOper20: TSmallintField;
    MTE_ZRIOrg20: TStringField;
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

  except
    ShowMessage('���-�� ����� �� ���!');
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
