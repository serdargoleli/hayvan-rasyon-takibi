unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    baglanti: TADOConnection;
    table: TADOTable;
    Data: TDataSource;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    tableKayitId: TAutoIncField;
    tableKupeNo: TIntegerField;
    tableAsiKarti: TWideStringField;
    tableCA: TIntegerField;
    tableDT: TDateTimeField;
    tableRasyon: TIntegerField;
    tableLaktasyon: TIntegerField;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit3;

procedure TForm2.BitBtn1Click(Sender: TObject);
const
  Yol = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s; Persist Security Info=False';
var
  veriTabani: String;
begin
  if (Edit1.Text = 'emirfidan') and (Edit2.Text = '123456') then
  begin
    veriTabani := ExtractFilePath(Application.Exename) + 'rasyon.mdb';
    baglanti.ConnectionString := Format(Yol, [veriTabani]);
    baglanti.Connected := true;
    table.Active := true;
    Form2.Hide;
    Form3.Show;
  end
  else
    Application.MessageBox('Kullanýcý Adý Veya Þifre Hatalý', 'HATALI GÝRÝÞ',
      MB_OK + MB_ICONHAND);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then
    Edit2.PasswordChar := #0
  else
    Edit2.PasswordChar := '*';
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sorgu: Integer;
begin
  CanClose := false;
  sorgu := Application.MessageBox('Uygulama kapatýlsýn mý?', 'Kapat',
    MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    CanClose := true;
    Application.Terminate;
  end;
end;

end.
