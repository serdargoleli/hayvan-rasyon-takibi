unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    yeni: TBitBtn;
    MonthCalendar1: TMonthCalendar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure yeniClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

Uses Unit2, Unit4, Unit5;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  ara: Boolean;
  i: Integer;
begin
  ara := form2.table.Locate('KupeNo', Edit1.Text, []);
  if (not ara) then
   Application.MessageBox('Kayýt bulunamadý.Eksiksiz yazýðýnýzdan emin olun', 'Arama', MB_OK + MB_ICONHAND);

  Edit1.Text := '';
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  Form3.Hide;
  form4.show;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
  delete: Integer;
begin
  delete := Application.MessageBox('Seçilen kayýt silinsin mi?', 'Silme Ýþlemi',
    MB_YESNO + MB_ICONQUESTION);
  if delete = idYes then
  begin
    Form2.table.delete;
  end;

end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
  Form3.Hide;
  form5.show;
end;

procedure TForm3.yeniClick(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
