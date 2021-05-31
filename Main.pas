unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, EhLibADO,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.CheckLst, DateUtils, EhLibMTE, DBGridEhImpExp, XlsMemFilesEh, Data.Win.ADODB,
  MemTableEh, MemTableDataEh;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    btnGetZRI: TButton;
    ProgressBar2: TProgressBar;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    CB_IzgotYear: TComboBox;
    CB_Izgot: TComboBox;
    CB_Kateg: TComboBox;
    Panel4: TPanel;
    StatusBar1: TStatusBar;
    btnExportToExcel: TButton;
    SaveDialog1: TSaveDialog;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    Label1: TLabel;
    Button3: TButton;
    ProgressBar3: TProgressBar;
    DBGridEh3: TDBGridEh;
    Button4: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox4: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ErrorsZRI: TStringGrid;
    Splitter1: TSplitter;
    Panel6: TPanel;
    DBGridEh4: TDBGridEh;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnGetZRIClick(Sender: TObject);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CB_IzgotEnter(Sender: TObject);
    procedure DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh2SortMarkingChanged(Sender: TObject);
    procedure OrgColumnsVisible(CB: Integer; Visible: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CB_IzgotYearEnter(Sender: TObject);
    procedure CB_KategEnter(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGridEh2CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure CheckBox2Click(Sender: TObject);
    procedure AddColumns(FMemDS: TMemTableEh);
    procedure Button6Click(Sender: TObject);
    procedure DBGridEh4CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure DBGridEh4TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    function FillCell(var Background: TColor; Col: String): TColor;
    function StringToASCII(S:string):string;
    procedure AddNewField(FMemDS: TMemTableEh;
       FldName, DisplName, Komment: string;
       FieldType: TFieldType; Size, Num, Width:integer;
       Grid: TDBGridEh; Color: TColor; FName: String);
    procedure CheckColumn(ColNom: Integer; ColTitle: String; ColField: String);
    procedure SetParameters(qTarget: TADOQuery; Key: String);
    procedure SetValues(qTarget: TMemTableEh; qSource: TADOQuery; idx: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;



const
  FixedColumns: integer = 7;
  AddColumnsCount: integer = 5;
  AddBlocksCount: integer = 35;

var
  ColIndex: array of integer;
//    ColIndex: array[0..34] of integer;
  ColIndexCheck: array[0..34] of integer;
//  ErrorsZRI: TStringList;
  ErrorsAr: array[0..100000] of boolean;
  vvv, Errors: Boolean;
  i, balance, itogo, col, count, MaxPos, TekPos: integer;
  FirstOper, LastOper: Integer;
  FirstDate, LastDate: TDate;

implementation

{$R *.dfm}

uses DataMod;


procedure TForm1.btnExportToExcelClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS, DBGridEh2,
      SaveDialog1.FileName, True);
end;

procedure TForm1.Button1Click(Sender: TObject);
  var
  dateFrom, dateTo: TDate;

begin
  DM.ADOQ10.Open;
  DM.ADOQ10.First;
  ProgressBar1.Max := DM.ADOQ10.RecordCount;
  ProgressBar1.Position := 0;
  if NOT DM.MTE_Onko.Active then DM.MTE_Onko.Open;

  for I := 1 to DM.ADOQ10.RecordCount do
  begin
    DM.MTE_Onko.Insert;
    DM.MTE_Onkonumber.Value := i;
    DM.MTE_OnkoYear.Value := DM.ADOQ10Year.Value;
    DM.MTE_OnkoOrganization.Value := DM.ADOQ10NAME_SHORT.Value;
    DM.MTE_OnkoKategory.Value := DM.ADOQ10Kateg.Value;
    DM.MTE_OnkoInventDate.Value := DM.ADOQ10OpDate.Value;
    DM.MTE_OnkoInvent.Value := DM.ADOQ10kolvo.Value;

    if DM.ADOQInvent.Active then DM.ADOQInvent.Close;
    DM.ADOQInvent.Parameters.ParamByName('name').Value := DM.ADOQ10NAME_SHORT.Value;
    DM.ADOQInvent.Parameters.ParamByName('opdate').Value := DM.ADOQ10OpDate.Value;
    DM.ADOQInvent.Parameters.ParamByName('kateg').Value := DM.ADOQ10Kateg.Value;
    DM.ADOQInvent.Open;
    DM.ADOQInvent.First;
    if DM.ADOQInvent.RecordCount > 0 then
    Begin
      dateFrom := DM.ADOQ10OpDate.Value;
      dateTo := DM.ADOQInventOpDate.Value;

      if DM.ADOQTo.Active then DM.ADOQTo.Close;
      DM.ADOQTo.Parameters.ParamByName('name').Value := DM.ADOQ10NAME_SHORT.Value;
      DM.ADOQTo.Parameters.ParamByName('date1').Value := dateFrom;
      DM.ADOQTo.Parameters.ParamByName('date2').Value := dateTo;
      DM.ADOQTo.Parameters.ParamByName('kateg').Value := DM.ADOQ10Kateg.Value;
      DM.ADOQTo.Open;
      DM.MTE_OnkoTo.Value := DM.ADOQTokolvo.Value;

      if DM.ADOQFrom.Active then DM.ADOQFrom.Close;
      DM.ADOQFrom.Parameters.ParamByName('name').Value := DM.ADOQ10NAME_SHORT.Value;
      DM.ADOQFrom.Parameters.ParamByName('date1').Value := dateFrom;
      DM.ADOQFrom.Parameters.ParamByName('date2').Value := dateTo;
      DM.ADOQFrom.Parameters.ParamByName('kateg').Value := DM.ADOQ10Kateg.Value;
      DM.ADOQFrom.Open;
      DM.MTE_OnkoFrom.Value := DM.ADOQFromkolvo.Value;

      if DM.ADOQIn.Active then DM.ADOQIn.Close;
      DM.ADOQIn.Parameters.ParamByName('name').Value := DM.ADOQ10NAME_SHORT.Value;
      DM.ADOQIn.Parameters.ParamByName('date1').Value := dateFrom;
      DM.ADOQIn.Parameters.ParamByName('date2').Value := dateTo;
      DM.ADOQIn.Parameters.ParamByName('kateg').Value := DM.ADOQ10Kateg.Value;
      DM.ADOQIn.Open;
      DM.MTE_OnkoIn.Value := DM.ADOQInkolvo.Value;

      if DM.ADOQOut.Active then DM.ADOQOut.Close;
      DM.ADOQOut.Parameters.ParamByName('name').Value := DM.ADOQ10NAME_SHORT.Value;
      DM.ADOQOut.Parameters.ParamByName('date1').Value := dateFrom;
      DM.ADOQOut.Parameters.ParamByName('date2').Value := dateTo;
      DM.ADOQOut.Parameters.ParamByName('kateg').Value := DM.ADOQ10Kateg.Value;
      DM.ADOQOut.Open;
      DM.MTE_OnkoOut.Value := DM.ADOQOutkolvo.Value;

      balance := DM.ADOQ10kolvo.Value + DM.ADOQTokolvo.Value - DM.ADOQFromkolvo.Value + DM.ADOQInkolvo.Value - DM.ADOQOutkolvo.Value;
      DM.MTE_OnkoBalance.Value := balance;

      itogo := DM.ADOQInventSht.Value;

      DM.MTE_OnkonextInvent.Value := itogo;
      DM.MTE_OnkonextInventDate.Value := dateTo;
    End;

    DM.MTE_Onko.Post;
    DM.ADOQ10.Next;
    ProgressBar1.Position := ProgressBar1.Position+1;
  end;
    DM.ADOQ10.First;
end;

function ConvertStrToDate(input: String): TDate;
var
wYear, wMonth, wDay: Integer;
begin
  wYear := StrToInt(Copy(input, 1, 4));
  wMonth := StrToInt(Copy(input, 6, 2));
  wDay := StrToInt(Copy(input, 9, 2));
  // or in whatever order you need...

  result := EncodeDate(wYear, wMonth, wDay);
end;

procedure TForm1.SetParameters(qTarget: TADOQuery; Key: String);
begin
  if qTarget.Active then qTarget.Close;
  qTarget.Parameters.ParamByName('tokenKey').Value := Key;
  qTarget.Open;
  qTarget.First;
end;

procedure TForm1.SetValues(qTarget: TMemTableEh; qSource: TADOQuery; idx: Integer);
Begin
  qTarget.Insert;
  qTarget.FieldByName('idx').Value := idx;
  qTarget.FieldByName('Key').Value := qSource.FieldByName('Key').Value;
  qTarget.FieldByName('Type').Value := qSource.FieldByName('Typ').Value;
  qTarget.FieldByName('Passport').Value := qSource.FieldByName('PaspN').Value;
  qTarget.FieldByName('Number').Value := qSource.FieldByName('Numb').Value;
//  qTarget.FieldByName('Activn').Value := qSource.FieldByName('Activn').Value;
  qTarget.FieldByName('Kategory').Value := qSource.FieldByName('Kateg').Value;
  qTarget.FieldByName('IzgotDate').Value := ConvertStrToDate(qSource.FieldByName('izgotDate').Value);
  qTarget.FieldByName('Izgot').Value := qSource.FieldByName('IzgotOKPO').Value;
  qTarget.FieldByName('Errors').Value := False;

  
End;

function TForm1.StringToASCII(S:string):string;
var
i, len, tek:integer;
tekS: char;
begin
  Result:='';
  len := length(S);
  for i:=1 to len do
  begin
    tekS := S[i];
    Result:=Result+IntToStr(Ord(tekS))+' ';
  end;
end;


procedure TForm1.btnGetZRIClick(Sender: TObject);
var
j, k, timeLost : integer;
TimeBegin, TimeEnd: TTime;
tempPaspN, tempTyp, tempNumb: String;
errorPaspN, errorTyp, errorNumb: Boolean;

ColEh: TColumnEh;
begin
  TimeBegin := now;
  ErrorsZRI.RowCount := 0;

  if DBGridEh2.Columns.Count < 10 then AddColumns(DM.MTE_ZRI);
  MaxPos := 0;
  vvv := DM.MTE_ZRI.IsSequenced;
  for k := 0 to DBGridEh2.Columns.Count-1 do
  DBGridEh2.Columns[k].Visible := true;
  CheckBox1.Checked := True;

  if DM.ADOZRIQIzgot.Active then DM.ADOZRIQIzgot.Close;

  if (CB_Izgot.Text <> '') and (CB_Izgot.Text <> 'Организация-изготовитель') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Izgot').Value :=  Copy(CB_Izgot.Text, 0, 8);

  if (CB_IzgotYear.Text <> '') and (CB_IzgotYear.Text <> 'Год изготовления источника') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Year').Value := StrToInt(CB_IzgotYear.Text);

  if (CB_Kateg.Text <> '') and (CB_Kateg.Text <> 'Категория источника') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Kateg').Value := StrToInt(CB_Kateg.Text);

  DM.ADOZRIQIzgot.Open;
  if DM.ADOZRIQIzgot.RecordCount = 0 then
  Begin
    ShowMessage('Данные отсутствуют');
    Exit;
  End;

  DM.ADOZRIQIzgot.First;
  ProgressBar2.Max := DM.ADOZRIQIzgot.RecordCount;
  StatusBar1.Panels[0].Text := 'Записей: ' + IntToStr(DM.ADOZRIQIzgot.RecordCount);
  Form1.Repaint;
  ProgressBar2.Position := 0;
  If NOT DM.MTE_ZRI.Active then DM.MTE_ZRI.Open;
  If DM.MTE_ZRI.RecordCount > 0 then DM.MTE_ZRI.EmptyTable;

  ErrorsZRI.RowCount := DM.ADOZRIQIzgot.RecordCount;
  for I := 1 to DM.ADOZRIQIzgot.RecordCount do
  Begin
    Errors:= False;
    SetParameters(DM.ADOZRIQOper, DM.ADOZRIQIzgotKey.Value);
    SetValues(DM.MTE_ZRI, DM.ADOZRIQOper, i);

    TekPos := DM.ADOZRIQOper.RecordCount;
    DM.ADOZRIQOper.First;
    errorPaspN := false;
    errorTyp := false;
    errorNumb := false;
    tempPaspN := DM.ADOZRIQOperPaspN.Value;
    tempTyp := DM.ADOZRIQOperTyp.Value;
    tempNumb := DM.ADOZRIQOperNumb.Value;
    for j := 0 to TekPos -1 do
    Begin
      if ((not(errorPaspN)) and (DM.ADOZRIQOperPaspN.Value <> tempPaspN)) then errorPaspN := True;
      if ((not(errorTyp)) and (DM.ADOZRIQOperTyp.Value <> tempTyp)) then errorTyp := True;
      if ((not(errorNumb)) and (DM.ADOZRIQOperNumb.Value <> tempNumb)) then errorNumb := True;

      DM.ADOZRIQOper.Next;
    End;
      ErrorsZRI.Cells[0, i] := errorPaspN.ToString;
      ErrorsZRI.Cells[1, i] := errorTyp.ToString;
      ErrorsZRI.Cells[2, i] := errorNumb.ToString;
    DM.ADOZRIQOper.First;

    for j := 0 to TekPos -1 do
    Begin
      DM.MTE_ZRI.FieldByName('OpDate'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperopDate.Value;
      DM.MTE_ZRI.FieldByName('Oper'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperopCod.Value;
      DM.MTE_ZRI.FieldByName('Org'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperKOD_ORG.Value;
      DM.MTE_ZRI.FieldByName('OrgOKPO'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperokpo.Value;
      DM.MTE_ZRI.FieldByName('OKPOKontr'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperOKPOPiP.Value;

      DM.ADOZRIQOper.Next;
    End;

    DM.MTE_ZRI.Post;
    DM.ADOZRIQIzgot.Next;
    ProgressBar2.Position := ProgressBar2.Position+1;
    btnExportToExcel.Enabled := True;

    Form1.Repaint;
  End;

  for k := MaxPos*AddColumnsCount+FixedColumns to DBGridEh2.Columns.Count-1 do
  DBGridEh2.Columns[k].Visible := false;

  TimeEnd := now;
  timeLost := SecondsBetween(TimeBegin, TimeEnd);
  StatusBar1.Panels[2].Text := 'Время: ' + IntToStr(timeLost) + ' c.';
//  if vvv then DBGridEh2. .Color := clRed;

  DM.MTE_ZRI.first;
  for I := 0 to DM.ADOZRIQIzgot.RecordCount-1 do
  Begin

  //  if ErrorsAr[I] = true then
  //  Begin
  //    DM.MTE_ZRI.Edit;
  //    DM.MTE_ZRI.Fields.FieldByName('Errors').Value := true;
  //    DM.MTE_ZRI.Post;
  //  End;
  //  DM.MTE_ZRI.Next;

  End;
  

end;

procedure TForm1.Button3Click(Sender: TObject);
var
db, de, dp: TDate;
op, j: Integer;
inv: Boolean;
begin
  DM.ADOQuery2.Open;
    DM.ADOQuery2.First;
    ProgressBar3.Max := DM.ADOQuery2.RecordCount-1;
    ProgressBar3.Position := 1;
    if Not DM.MTE_ZRI.Active  then  DM.MTE_ZRI.Open;
    If DM.MTE_ZRI.RecordCount > 0 then DM.MTE_ZRI.EmptyTable;
  for I := 0 to DM.ADOQuery2.RecordCount-1 do
  Begin
//    SetParameters(DM.ADOQuery3, DM.ADOQuery2);

    db := DM.ADOQuery3OpDate.value;
    Op := DM.ADOQuery3OpCod.value;

    if DM.ADOQuery3.RecordCount = 1 then
      de := now
    else
    Begin
      DM.ADOQuery3.Last;
      de := DM.ADOQuery3OpDate.value;
    End;

    if daysBetween(db, de) > 365 then
    Begin
        inv := False;
        DM.ADOQuery3.First;

        for j := 0 to DM.ADOQuery3.RecordCount -1 do
        Begin
          if DM.ADOQuery3opCod.Value = 10 then
          Begin
            inv := true;

            break;
          End;
          DM.ADOQuery3.Next;
        End;

        if NOT inv then
        Begin
          DM.ADOQuery3.First;
          SetValues(DM.MTE_ZRI, DM.ADOQuery2, I);

          for j := 0 to DM.ADOQuery3.RecordCount -1 do
          Begin
            DM.MTE_ZRI.FieldByName('OpDate'+IntToStr(j+1)).Value :=  DM.ADOQuery3opDate.Value;
            DM.MTE_ZRI.FieldByName('Oper'+IntToStr(j+1)).Value :=  DM.ADOQuery3opCod.Value;
            DM.MTE_ZRI.FieldByName('Org'+IntToStr(j+1)).Value :=  DM.ADOQuery3OkpoPIP.Value;
//            DM.MTE_ZRI.FieldByName('Org'+IntToStr(j+1)).Value :=  IntToStr(daysBetween(dp, DM.ADOQuery3opDate.Value));
            dp := DM.ADOQuery3opDate.Value;
            DM.ADOQuery3.Next;
          End;
          DM.MTE_ZRI.Post;
          Form1.Repaint;
        End;
    End;
    DM.ADOQuery2.Next;
    ProgressBar3.Position := ProgressBar3.Position +1;
  End;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS, DBGridEh2,
      SaveDialog1.FileName, True);
end;

procedure TForm1.AddNewField(FMemDS: TMemTableEh;
   FldName, DisplName, Komment: string;
   FieldType: TFieldType; Size, Num, Width:integer;
   Grid: TDBGridEh; Color: TColor; FName: String);
var Col: TColumnEh;
Fld: TField;
II : Integer;
SS: String;
fldDef: TFieldDef;
DataField: TMTDataFieldEh;
begin

  fldDef:=FMemDS.FieldDefs.AddFieldDef;
  fldDef.DataType := FieldType;
  fldDef.Name := FldName;
  fldDef.Size := Width;
//  fldDef := FMemDS.FieldDefs.Add(FldName, FieldType, Width, false);
  fldDef.DisplayName := FldName;

  Fld := fldDef.CreateField(FMemDS);
//  Fld := FMemDS.FieldDefs[FMemDS.FieldDefList.Count-1].CreateField(FMemDS);
//  Fld.Create(FMemDS);
  Fld.FieldName := FldName;
//  Fld.DisplayName := FldName;
  Fld.Name := FName;
  SS := Fld.FullName;
  FMemDS.FieldDefList.Update;
  FMemDS.FieldList.Update;
  II := FMemDS.Fields.Count;

  Col := Grid.Columns.Add;
  Col.FieldName := FldName;
  Col.Title.Caption := DisplName;
  Col.Width := Size;
  Col.Color := Color;
end;

procedure TForm1.AddColumns(FMemDS: TMemTableEh);
var Col: TColumnEh;
Fld: TField;
Color: TColor;
StrF, IntF, DatF: Integer;


begin
  StrF := 4;
  IntF := 1;
  DatF := 1;
  for I := 1 to AddBlocksCount do
  Begin
    if I mod 2 <> 0  then
      Color := clGradientInactiveCaption
    else
      Color := clWhite;
    AddNewField(FMemDS, 'Oper'+IntToStr(I), 'Операция'+IntToStr(I)+'|Опер', '', ftInteger, 36, I, 0, DBGridEh2, Color, 'SmallIntField'+IntToStr(IntF+I));
    AddNewField(FMemDS, 'OpDate'+IntToStr(I), 'Операция'+IntToStr(I)+'|Дата', '', ftDate, 60, I, 0, DBGridEh2, Color, 'DateField'+IntToStr(DatF+I));
    inc(StrF);
    AddNewField(FMemDS, 'Org'+IntToStr(I), 'Операция'+IntToStr(I)+'|Организация|Рег№', '', ftString, 50, I, 10, DBGridEh2, Color, 'StringField'+IntToStr(StrF));
    inc(StrF);
    AddNewField(FMemDS, 'OrgOKPO'+IntToStr(I), 'Операция'+IntToStr(I)+'|Организация|ОКПО', '', ftString, 80, I, 20, DBGridEh2, Color, 'StringField'+IntToStr(StrF));
    inc(StrF);
    AddNewField(FMemDS, 'OKPOKontr'+IntToStr(I), 'Операция'+IntToStr(I)+'|Контрагент', '', ftString, 80, I, 20, DBGridEh2, Color, 'StringField'+IntToStr(StrF));
  End;
  FMemDS.CreateDataSet;
  FMemDS.FieldList.Update;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//  AddColumns(DM.MemTableEh3);
  AddColumns(DM.MTE_ZRI);
//  DM.MTE_ZRI.Open;
//  DM.MemTableEh3.Open;
end;

procedure TForm1.CB_IzgotEnter(Sender: TObject);
begin
//  CB_Izgot.DroppedDown := true;
end;

procedure TForm1.CB_IzgotYearEnter(Sender: TObject);
begin
//  CB_IzgotYear.DroppedDown := true;
end;

procedure TForm1.CB_KategEnter(Sender: TObject);
begin
//  CB_Kateg.DroppedDown := true;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  OrgColumnsVisible((Sender as TCheckBox).Tag, (Sender as TCheckBox).Checked);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then DBGridEh2.Columns[5].DisplayFormat := '0.00E+00'
  else DBGridEh2.Columns[5].DisplayFormat := '';
end;

procedure TForm1.OrgColumnsVisible(CB: Integer; Visible: Boolean);
Var
I: Integer;
begin
  for I := FixedColumns+1+ CB to DBGridEh2.Columns.Count-1 do
  if (I - FixedColumns-1- CB) mod AddColumnsCount = 0 then
  Begin
    If Visible and (MaxPos > 0) then
    Begin
      if (I < MaxPos * AddColumnsCount + FixedColumns) then
      DBGridEh2.Columns[i].Visible := Visible;
    End
    Else
    DBGridEh2.Columns[i].Visible := Visible;
  End;
end;

procedure TForm1.DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if ((balance = itogo) and (Column.Index = 10)) then Background := clGreen;
end;

procedure TForm1.DBGridEh1SortMarkingChanged(Sender: TObject);
begin
  DBGridEh1.DefaultApplySorting;
end;

procedure TForm1.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if col = ACol then
  Begin
    count := count+1;
    case count mod 2 of
      1:begin
        DM.MTE_Onko.SortOrder := Column.FieldName + ' desc';
      end;
      0:begin
        DM.MTE_Onko.SortOrder := Column.FieldName;
      end;
    end;
  End
    else
    DM.MTE_Onko.SortOrder := Column.FieldName;
  col := ACol;
end;

function TForm1.FillCell(var Background: TColor; Col: String): TColor;
var
  color: Integer;
  val: Byte;

begin
  color := Background;
  Background := clRed;

  If DM.MTE_ZRI.FieldByName('Oper' + Col).Value = null then
  Begin
    result := Background;
    Exit;
  End;

    LastOper := DM.MTE_ZRI.FieldByName('Oper' + Col).Value;
    LastDate := DM.MTE_ZRI.FieldByName('OpDate' + Col).Value;

  val := LastOper;

  if (val In [10, 22, 31, 32, 35, 37, 38, 39, 41, 46, 53, 67, 71, 72, 81, 98]) then
  begin
    Background := color;
    if (val In [71, 72, 98]) then Background := clFuchsia;
    if (val in [10, 31, 32, 35, 37, 38, 39, 41, 53]) then
      if YearsBetween(now, LastDate) >= 1 then
      Begin
        Background := clRed;
        Errors := true;
      End;
  end;
  result := Background;
end;

procedure TForm1.CheckColumn(ColNom: Integer; ColTitle: String; ColField: String);
var
  ColEh: TColumnEh;
begin
  ColEh := DBGridEh2.Columns.Add;
  ColEh.Title.Caption := 'Операция' + IntToStr(ColNom) + ColTitle;
  ColEh.FieldName := ColField + IntToStr(ColNom);
  if (ColNom mod 2) = 1 then
    ColEh.Color := clGradientInactiveCaption;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MaxPos := 0;
  SetLength(ColIndex, AddBlocksCount-1);
  for I := 1 to AddBlocksCount-1 do
    ColIndex[I-1] := FixedColumns + I * AddColumnsCount
//    ColIndexCheck
end;

procedure TForm1.DBGridEh2CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
  var
  str: String;
begin
  if Cell.X < 1 then Exit;
  if DM.MTE_ZRI.Fields[Cell.X-1].Value = null then Exit;

  if Cell.X in [1, 2, 3] then
  Begin
    if DM.ZRIQOper_MTE.Active then DM.ZRIQOper_MTE.Close;

    Panel6.Visible := True;
    Splitter1.Visible := True;
//    SetParameters(DM.ADODataDriverEh1, DM.MTE_ZRI.Fields.FieldByName('Key').Value);

//    if DM.ADODataDriverEh1. .Active then DM.ADODataDriverEh1.Close;
    DM.ZRIQOper_DDE.SelectCommand.Parameters.ParamByName('tokenKey').Value := DM.MTE_ZRI.Fields.FieldByName('Key').Value;
    DM.ZRIQOper_MTE.Open;
  End
  Else
  Begin
    Splitter1.Visible := False;
    Panel6.Visible := False;
  End;


//  str := DBGridEh2.Columns[Cell.X - 1].FieldName .DataSource.DataSet.FI DM.MTE_ZRI.Fields.FieldByName() [].Value;
  str := DM.MTE_ZRI.Fields.FieldByName(DBGridEh2.Columns[Cell.X].FieldName).Value;

  StatusBar1.Panels[4].Text := '';
  if (Cell.X >=10)
  and ((((Cell.X+2-FixedColumns) mod AddColumnsCount = 0) and CheckBox2.Checked)
  or ((Cell.X+1-FixedColumns) mod AddColumnsCount = 0) and CheckBox3.Checked)
  and (str <> '') then
  Begin
    if DM.ADOOrg.Active then DM.ADOOrg.Close;
    DM.ADOOrg.Parameters.ParamByName('kodorg').Value := Str;
    DM.ADOOrg.Open;
    StatusBar1.Panels[4].Text := 'Рег.№: ' + DM.ADOOrgKOD_ORG.Value;
    StatusBar1.Panels[5].Text := 'Организация: ' + DM.ADOOrgNAME_SHORT.Value;
  End;


  StatusBar1.Panels[3].Text := 'Кодировка под курсором: ' + StringToASCII(Str);
end;

function CheckInArroy(input: Integer): Boolean;
var I: Integer;
  res: Boolean;
begin
  res := False;
  for I := 0 to Length(ColIndex) - 1 do
  Begin
    if ColIndex[I] = input then res := true
  End;
  result := res;
end;


procedure TForm1.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
 vv, k: Integer;
 txt: String;
begin
  Errors := False;


//  if DM.ADOZRIQOper.Active then TekPos := DM.ADOZRIQOper.RecordCount;
  for k := 1 to AddBlocksCount do
  Begin
    if DM.MTE_ZRI.FieldByName('Oper' + IntToStr(k)).Value = null then Break;
    TekPos := k;
  End;

  if MaxPos < TekPos then
  Begin
    MaxPos := TekPos;
    StatusBar1.Panels[1].Text := 'Операций: ' + IntToStr(MaxPos);
  End;

  if Column.Index in [1, 2, 3] then
  Begin
    if (DM.MTE_ZRI.FieldByName('idx').Value <> null) then
    Begin
      txt := ErrorsZRI.Cells[Column.Index-1, DM.MTE_ZRI.FieldByName('idx').Value];
      if txt = '-1' then Background := clRed;
    End;
  End;

//  if (Column.Index = 2) then
//  Begin
//    if ErrorsZRI.Cells[1, DBGridEh2.Row] = 'true' then Background := clRed;
//  End;
//
//  if (Column.Index = 3) then
//  Begin
//    if ErrorsZRI.Cells[DBGridEh2.Row, 2] = 'true' then Background := clRed;
//  End;

//  if (Column.Index in [7, 8])
  if (CheckInArroy(Column.Index) or (Column.Index in [7, 8]))
  and (TekPos > 0) then
  Begin
    if Column.Index in [FixedColumns, FixedColumns+1] then
    Begin
      FirstOper := DM.MTE_ZRI.FieldByName('Oper1').Value;
      FirstDate := DM.MTE_ZRI.FieldByName('OpDate1').Value;
      case Column.Index of
        8: Begin
           if (FirstOper = 11) and (FirstDate <> DM.MTE_ZRI.FieldByName('IzgotDate').Value) then
           Begin
             Errors := true;
             Background := clRed;
           End;
        End;
        7: Begin
           if (FirstOper <> 11) and (FirstOper <> 58) then
           Begin
             Errors := true;
             Background := clRed;
           End;
        End;
      end;
    End;

    if CheckInArroy(Column.Index)
    and (TekPos > 0)
    and (Column.Index = (TekPos-1)*AddColumnsCount + FixedColumns) then
//    if Column.Index = TekPos*AddColumnsCount + FixedColumns then

    Begin
  //    If TekPos > 0 then
  //    if Column.Index - TekPos*AddColumnsCount + 5 = FixedColumns then
      Begin
//        StatusBar1.Panels[3].Text := IntToStr(Column.Index) + ' : ' + IntToStr(TekPos);
        Background := FillCell(Background, intToStr(TekPos));
        if Background = clRed then Errors := true;

//          if Errors then
//            ErrorsAr[DM.ADOZRIQIzgot.RecNo] := true
//          else
//            ErrorsAr[DM.ADOZRIQIzgot.RecNo] := false
      End;
    End;
  End;
  

end;

procedure TForm1.DBGridEh2SortMarkingChanged(Sender: TObject);
begin
//  DBGridEh2.DefaultApplySorting;
end;

procedure TForm1.DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if col = ACol then
  Begin
    count := count+1;
    case count mod 2 of
      1:begin
        DM.MTE_ZRI.SortOrder := Column.FieldName + ' desc';
      end;
      0:begin
        DM.MTE_ZRI.SortOrder := Column.FieldName;
      end;
    end;
  End
    else
    DM.MTE_ZRI.SortOrder := Column.FieldName;
  col := ACol;
end;

procedure TForm1.DBGridEh4CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
  var str: String;
begin
  if Cell.X < 1 then Exit;
  if DM.ZRIQOper_MTE.Fields[Cell.X-1].Value = null then Exit;

//  str := DBGridEh2.Columns[Cell.X - 1].FieldName .DataSource.DataSet.FI DM.MTE_ZRI.Fields.FieldByName() [].Value;
  str := DM.ZRIQOper_MTE.Fields.FieldByName(DBGridEh4.Columns[Cell.X-1].FieldName).Value;

  StatusBar1.Panels[4].Text := '';
  if (Cell.X in [8,7]) then
  Begin
    if DM.ADOOrg.Active then DM.ADOOrg.Close;
    DM.ADOOrg.Parameters.ParamByName('kodorg').Value := Str;
    DM.ADOOrg.Open;
    StatusBar1.Panels[4].Text := 'Рег.№: ' + DM.ADOOrgKOD_ORG.Value;
    StatusBar1.Panels[5].Text := 'Организация: ' + DM.ADOOrgNAME_SHORT.Value;
  End;

  StatusBar1.Panels[3].Text := 'Кодировка под курсором: ' + StringToASCII(Str);
end;

procedure TForm1.DBGridEh4TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if col = ACol then
  Begin
    count := count+1;
    case count mod 2 of
      1:begin
        DM.ZRIQOper_MTE.SortOrder := Column.FieldName + ' desc';
      end;
      0:begin
        DM.ZRIQOper_MTE.SortOrder := Column.FieldName;
      end;
    end;
  End
    else
    DM.ZRIQOper_MTE.SortOrder := Column.FieldName;
  col := ACol;
end;

end.
