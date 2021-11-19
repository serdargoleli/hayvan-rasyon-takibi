unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
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
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and
    (DBEdit5.Text <> '') and (DBEdit6.Text <> '') then
  begin
    form2.table.edit;
    form2.table.FieldByName('DT').AsDateTime := DateTimePicker1.Date;
    form2.table.Post;
    Application.MessageBox('Yeni kayýt baþarýlý bir þekilde eklendi',
      'Kayýt Ýþlemi', MB_OK + MB_ICONINFORMATION);
    form2.table.Insert;
    DateTimePicker1.Date := Now;
  end
  else begin
      Application.MessageBox('Tüm alanlarý doldurunuz',
      'HATA', MB_OK + MB_ICONERROR);
  end;

end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  Form4.Hide;
  form3.show;
  form2.table.cancel;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TForm4.FormShow(Sender: TObject);
begin
  form2.table.Insert;
end;

end.
