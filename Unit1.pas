unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sayac: Integer;

implementation

{$R *.dfm}
Uses Unit2;

procedure TForm1.FormCreate(Sender: TObject);
begin
     (Image1.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position := sayac;
  if(sayac >= 100) then
  begin
    form2.show;
    form1.AlphaBlend:=true;
    form1.AlphaBlendValue:=0;
    timer1.Enabled := false;
  end;
  Inc(sayac);
end;

end.
