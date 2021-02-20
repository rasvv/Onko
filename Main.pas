unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, EhLibADO,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.CheckLst, DateUtils;

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
    Button2: TButton;
    ProgressBar2: TProgressBar;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    Panel3: TPanel;
    CB_IzgotYear: TComboBox;
    CB_Izgot: TComboBox;
    CB_Kateg: TComboBox;
    Label1: TLabel;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CB_IzgotEnter(Sender: TObject);
    procedure CB_IzgotMouseEnter(Sender: TObject);
    procedure CB_IzgotYearMouseEnter(Sender: TObject);
    procedure CB_KategMouseEnter(Sender: TObject);
    procedure DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh2SortMarkingChanged(Sender: TObject);
    procedure CB_IzgotMouseLeave(Sender: TObject);
    procedure CB_IzgotYearMouseLeave(Sender: TObject);
    procedure CB_KategMouseLeave(Sender: TObject);
    procedure OrgColumnsVisible(Visible: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  function FillCell(var Background: TColor; Col: String): TColor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  i, balance, itogo, col, count, MaxPos: integer;

implementation

{$R *.dfm}

uses DataMod;



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


procedure TForm1.Button2Click(Sender: TObject);
var
j, k : integer;

begin
  for k := 0 to DBGridEh2.Columns.Count-1 do
  DBGridEh2.Columns[k].Visible := true;
  CheckBox1.Checked := True;

  if DM.ADOZRIQIzgot.Active then DM.ADOZRIQIzgot.Close;

  if (CB_Izgot.Text <> '') and (CB_Izgot.Text <> '�����������-������������') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Izgot').Value := CB_Izgot.Text;

  if (CB_IzgotYear.Text <> '') and (CB_IzgotYear.Text <> '��� ������������ ���������') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Year').Value := StrToInt(CB_IzgotYear.Text);


  if (CB_Kateg.Text <> '') and (CB_Kateg.Text <> '��������� ���������') then
    DM.ADOZRIQIzgot.Parameters.ParamByName('Kateg').Value := StrToInt(CB_Kateg.Text);



  DM.ADOZRIQIzgot.Open;
  if DM.ADOZRIQIzgot.RecordCount = 0 then
  Begin
    ShowMessage('������ �����������');
    Exit;
  End;

  DM.ADOZRIQIzgot.First;
  ProgressBar2.Max := DM.ADOZRIQIzgot.RecordCount;
  Label1.Caption := '�������: ' + IntToStr(DM.ADOZRIQIzgot.RecordCount);
  Form1.Repaint;
  ProgressBar2.Position := 0;
  If NOT DM.MTE_ZRI.Active then DM.MTE_ZRI.open;
  If DM.MTE_ZRI.RecordCount > 0 then
    DM.MTE_ZRI.EmptyTable;

  for I := 1 to DM.ADOZRIQIzgot.RecordCount do
//  for I := 1 to 15 do
  Begin
    DM.MTE_ZRI.Insert;
    DM.MTE_ZRIType.Value := DM.ADOZRIQIzgotTyp.Value;
    DM.MTE_ZRIPassport.Value := DM.ADOZRIQIzgotPaspN.Value;
    DM.MTE_ZRINumber.Value := DM.ADOZRIQIzgotNumb.Value;
    DM.MTE_ZRIKategory.Value := DM.ADOZRIQIzgotKateg.Value;
    DM.MTE_ZRIIzgotDate.Value := StrToDate(DM.ADOZRIQIzgotIzgot_Date.Value);
    DM.MTE_ZRIIzgot.Value := DM.ADOZRIQIzgotIzgotOKPO.Value;

    if DM.ADOZRIQOper.Active then DM.ADOZRIQOper.Close;
    DM.ADOZRIQOper.Parameters.ParamByName('Typ').Value := DM.ADOZRIQIzgotTyp.Value;
    DM.ADOZRIQOper.Parameters.ParamByName('IzgotDate').Value := DM.ADOZRIQIzgotIzgot_Date.Value;
    DM.ADOZRIQOper.Parameters.ParamByName('Kategory').Value := DM.ADOZRIQIzgotKateg.Value;
    DM.ADOZRIQOper.Parameters.ParamByName('numb').Value := DM.ADOZRIQIzgotNumb.Value;
    DM.ADOZRIQOper.Parameters.ParamByName('pasport').Value := DM.ADOZRIQIzgotPaspN.Value;
    DM.ADOZRIQOper.Open;
    DM.ADOZRIQOper.First;

    for j := 0 to DM.ADOZRIQOper.RecordCount -1 do
    Begin

      DM.MTE_ZRI.FieldByName('OpDate'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperopDate.Value;
      DM.MTE_ZRI.FieldByName('Oper'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperopCod.Value;
      DM.MTE_ZRI.FieldByName('Org'+IntToStr(j+1)).Value :=  DM.ADOZRIQOperKod_Org.Value;

      DM.ADOZRIQOper.Next;
    End;


    DM.MTE_ZRI.Post;
    DM.ADOZRIQIzgot.Next;
    ProgressBar2.Position := ProgressBar2.Position+1;

    for k := MaxPos*3+9 to DBGridEh2.Columns.Count-1 do
    DBGridEh2.Columns[k].Visible := false;
  End;

end;

procedure TForm1.CB_IzgotEnter(Sender: TObject);
begin
  CB_Izgot.DroppedDown := true;
end;

procedure TForm1.CB_IzgotMouseEnter(Sender: TObject);
begin
  CB_Izgot.DroppedDown := true;
end;

procedure TForm1.CB_IzgotMouseLeave(Sender: TObject);
begin
//  CB_Izgot.DroppedDown := False;
end;

procedure TForm1.CB_IzgotYearMouseEnter(Sender: TObject);
begin
  CB_IzgotYear.DroppedDown := true;
end;

procedure TForm1.CB_IzgotYearMouseLeave(Sender: TObject);
begin
//  CB_IzgotYear.DroppedDown := false;
end;

procedure TForm1.CB_KategMouseEnter(Sender: TObject);
begin
  CB_Kateg.DroppedDown := true;
end;

procedure TForm1.CB_KategMouseLeave(Sender: TObject);
begin
//  CB_Kateg.DroppedDown := false;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  OrgColumnsVisible(CheckBox1.Checked);
end;

procedure TForm1.OrgColumnsVisible(Visible: Boolean);
Var
I: Integer;
begin
  for I := 8 to DBGridEh2.Columns.Count-1 do
  if (I - 8) mod 3 = 0 then
  Begin
    DBGridEh2.Columns[i].Visible := Visible;
    If Visible and (MaxPos > 0) then
    Begin
      if (I < MaxPos * 3 + 9) then
      DBGridEh2.Columns[i].Visible := Visible;
    End;
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
begin
  color := Background;
  Background := clRed;

  if (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 67) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 81) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 22) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 46) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 72) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 71) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 98) or
  (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 10) then
  begin
    Background := color;
    if (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 72) or
    (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 71) or
    (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 98) then
      Background := clFuchsia;
    if (DM.MTE_ZRI.FieldByName('Oper' + Col).Value = 10) then
      if YearsBetween(now, (DM.MTE_ZRI.FieldByName('OpDate' + Col).Value)) > 1 then
        Background := clRed;
  end;
  result := Background;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MaxPos := 0;
end;

procedure TForm1.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
pos, k, j: Integer;
begin
  if DM.ADOZRIQOper.Active then


  for k := 1 to 10 do
    Begin
      if DM.MTE_ZRI.FieldByName('Oper' + IntToStr(k)).Value = null then Break;
      pos := k;
    End;

    if MaxPos < pos then MaxPos := pos;


//  pos := DM.ADOZRIQOper.RecordCount;
  case Column.Index of
    6: Begin
       if DM.MTE_ZRI.FieldByName('OpDate1').Value <> DM.MTE_ZRI.FieldByName('IzgotDate').Value then
       Background := clRed;
    End;
    7: Begin
       if (DM.MTE_ZRI.FieldByName('Oper1').Value <> 11) and (DM.MTE_ZRI.FieldByName('Oper1').Value <> 58) then
       Background := clRed;
       if DM.MTE_ZRI.FieldByName('Oper2').Value = null then
       Begin
         Background := FillCell(Background, '1');
       End;
    End;

    10: Begin
//      if (DM.MTE_ZRI.FieldByName('Oper3').Value = null) and
//      DM.MTE_ZRI.FieldByName('Oper2').Value <> null then
      if pos = 2 then
      Begin
        Background := FillCell(Background, '2');
      End;
    End;
    13: Begin
//      if (DM.MTE_ZRI.FieldByName('Oper4').Value = null) and
//      DM.MTE_ZRI.FieldByName('Oper3').Value <> null then
      if pos = 3 then
      Begin
        Background := FillCell(Background, '3');
      End;
    End;
    16: Begin
//      if (DM.MTE_ZRI.FieldByName('Oper5').Value = null) and
//      DM.MTE_ZRI.FieldByName('Oper4').Value <> null then
      if pos = 4 then
      Begin
        Background := FillCell(Background, '4');
      End;
    End;
    19: Begin
//      if (DM.MTE_ZRI.FieldByName('Oper6').Value = null) and
//      DM.MTE_ZRI.FieldByName('Oper5').Value <> null then
      if pos = 5 then
      Begin
        Background := FillCell(Background, '5');
      End;
    End;
    22: Begin
//      if (DM.MTE_ZRI.FieldByName('Oper7').Value = null) and
//      DM.MTE_ZRI.FieldByName('Oper6').Value <> null then
      if pos = 6 then
      Begin
        Background := FillCell(Background, '6');
      End;
    End;
    25: Begin
      if pos = 7 then
      Begin
        Background := FillCell(Background, '7');
      End;
    End;
    28: Begin
      if pos = 8 then
      Begin
        Background := FillCell(Background, '8');
      End;
    End;
    31: Begin
      if pos = 9 then
      Begin
        Background := FillCell(Background, '9');
      End;
    End;
    34: Begin
      if pos = 10 then
      Begin
        Background := FillCell(Background, '10');
      End;
    End;
    37: Begin
      if pos = 11 then
      Begin
        Background := FillCell(Background, '11');
      End;
    End;
    40: Begin
      if DM.ADOZRIQOper.RecordCount = 12 then
      Begin
        Background := FillCell(Background, '12');
      End;
    End;
  end;
end;



procedure TForm1.DBGridEh2SortMarkingChanged(Sender: TObject);
begin
  DBGridEh2.DefaultApplySorting;
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

end.