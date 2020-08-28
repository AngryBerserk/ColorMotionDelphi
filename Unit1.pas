unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    Pihcha,
    Pihcha2:TBitmap;
    PArr,
    PArr2:Array of PByteArray;
    PP:PByteArray;
    Dx,
    Dx1,
    Dx2,
    Dx3:Shortint;
    Rx,
    Gx,
    Bx:Double;
    Spread1,
    Spread2,
    Spread3:Byte;
    S,
    S1,
    S2,
    S3:Byte;
    Rx_Cos,
    Rx_Sin:Double;
    Gx_Cos,
    Gx_Sin:Double;
    Bx_Cos,
    Bx_Sin:Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Const Spread = 10;Rad=pi/180;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
Dx:=1;
Dx1:=1;
Dx2:=1;
Dx3:=1;
S1:=0;
S2:=0;
s3:=0;
Pihcha:=TBitmap.Create;
Pihcha2:=TBitmap.Create;
Canvas.CopyMode:=cmSrcCopy;
Pihcha.PixelFormat:=Pf24bit;
Pihcha.LoadFromFile('1.bmp');
Pihcha2.PixelFormat:=Pf24bit;
Pihcha2.Width:=Pihcha.Width;
Pihcha2.Height:=Pihcha.Height;
Form1.ClientWidth:=Pihcha.Width-2*Spread;
Form1.ClientHeight:=Pihcha.Height-2*Spread;
end;

procedure TForm1.FormPaint(Sender: TObject);
 Var Z:Word;
begin
 // Canvas.Draw(0,0,Pihcha);
  SetLength(Parr,Pihcha.Height);
  SetLength(Parr2,Pihcha2.Height);
  For Z:=0 to Pihcha.Height-1 Do
   Begin
    Parr[Z]:=Pihcha.ScanLine[Z];
    Parr2[Z]:=Pihcha2.ScanLine[Z]
   End
end;

procedure TForm1.Timer1Timer(Sender: TObject);
 Var x0,y0,x,y:Integer;
begin
//S:=40;
If S=0 then
  Begin
    Rx:=Random(360)*Rad;
    Rx_Cos:=Cos(Rx);
    Rx_Sin:=Sin(Rx);
    Gx:=Random(360)*Rad;
    Gx_Cos:=Cos(Gx);
    Gx_Sin:=Sin(Gx);
    Bx:=Random(360)*Rad;
    Bx_Cos:=Cos(Bx);
    Bx_Sin:=Sin(Bx);
    Dx:=1;
  End;
{
If S1=0 then
  Begin
    Spread1:=Random(30);
    Rx:=Random(360)*Rad;
    Rx_Cos:=Cos(Rx);
    Rx_Sin:=Sin(Rx);
    Dx1:=1;
  End;
If S2=0 then
  Begin
    Spread2:=Random(30);
    Gx:=Random(360)*Rad;
    Gx_Cos:=Cos(Gx);
    Gx_Sin:=Sin(Gx);
    Dx2:=1;
  End;
If S3=0 then
  Begin
    Spread3:=Random(30);
    Bx:=Random(360)*Rad;
    Bx_Cos:=Cos(Bx);
    Bx_Sin:=Sin(Bx);
    Dx3:=1;
  End;
}
   If S=Spread Then Dx:=-1;
// If S1=Spread1 Then Dx1:=-1;
// If S2=Spread2 Then Dx2:=-1;
// If S3=Spread3 Then Dx3:=-1;
  For y0:=0 to (Pihcha.Height-1) Do Begin
    For x0:= 0 to (Pihcha.Width-1) Do
        Begin
          x:=Round(x0*3+Rx_Cos*S);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Rx_Sin*S);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3];

          x:=Round(x0*3+1+Gx_Cos*S);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Gx_Sin*S);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3+1];

          x:=Round(x0*3+2+Bx_Cos*S);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Bx_Sin*S);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3+2]
 {
          x:=Round(x0*3+Rx_Cos*S1);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Rx_Sin*S1);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3];

          x:=Round(x0*3+1+Gx_Cos*S2);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Gx_Sin*S2);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3+1];

          x:=Round(x0*3+2+Bx_Cos*S3);
          If x<0 Then x:=x0 Else If x>Pihcha.Width*3 Then x:=x0;
          y:=Round(y0-Bx_Sin*S3);
          If y<0 Then y:=y0 Else If y>Pihcha.Height-1 Then y:=y0;
          Parr2[y,x]:=Parr[y0,x0*3+2]
}
        End;
  End;
  S:=S+Dx;
// S1:=S1+Dx1;
// S2:=S2+Dx2;
// S3:=S3+Dx3;
 Canvas.CopyRect(Rect(0 ,0,Pihcha.Width-Spread,Pihcha.Height-Spread),Pihcha2.canvas,Rect(Spread,Spread,Pihcha.Width-Spread,Pihcha.Height-Spread))
end;

end.
