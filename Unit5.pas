unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and
    (DBEdit5.Text <> '') and (DBEdit6.Text <> '') then
  begin
    form2.table.edit;
    form2.table.FieldByName('DT').AsDateTime := DateTimePicker1.Date;
    form2.table.refresh;
    Application.MessageBox('Kayýt bilgisi baþarýlý bir güncellendi',
      'Güncelleme', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox('Tüm alanlarý doldurunuz', 'HATA',
      MB_OK + MB_ICONERROR);
  end;

end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Form5.Hide;
  form3.Show;
  form2.table.Cancel;
end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
  DateTimePicker1.Date := DBGrid1.Fields[3].AsDateTime;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sorgu: Integer;
begin
  CanClose := false;
  sorgu := Application.MessageBox('Uygulama kapatýlsýn mý?', 'Kapat',
    MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    CanClose := True;
    Application.Terminate;
  end;
end;

end.
