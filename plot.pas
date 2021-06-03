unit plot;

interface

uses
  libFilmFile, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type TIntArray = array of integer;

type
  TForm4 = class(TForm)
    Image1: TImage;
    function structure(var startYear: integer; var endYear: integer; var min: integer; var max: integer): TIntArray;
    procedure FormShow(Sender: TObject);
  private
    FilmFile: libFilmFile.TFilmFile;
  public
    procedure SetFilmFile(f: libFilmFile.TFilmFile);
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

function TForm4.structure(var startYear: integer; var endYear: integer; var min: integer; var max: integer): TIntArray;
var
  temp: libFilmFile.TFilmArray;
  i: integer;
begin
  temp := FilmFile.update;
  if length(temp) < 2 then
    raise Exception.Create('Not enough records to plot!');
  startYear := temp[0].year;
  endYear := temp[0].year;
  for i := 0 to length(temp) - 1 do begin
    if temp[i].rating < 8 then continue;
    if temp[i].year < startYear then
      startYear := temp[i].year;
    if temp[i].year > endYear then
      endYear := temp[i].year;
  end;
  setlength(result, endYear - startYear + 1);
  for i := 0 to length(temp) - 1 do
    if temp[i].rating >= 8 then
      inc(result[temp[i].year - startYear]);
  max := result[0];
  min := result[0];
  for i := 0 to length(result) - 1 do begin
    if result[i] > max then
      max := result[i];
    if result[i] < min then
      min := result[i];
  end;
end;

procedure TForm4.SetFilmFile(f: libFilmFile.TFilmFile);
begin
  FilmFile := f;
end;

procedure TForm4.FormShow(Sender: TObject);
var
  temp: TIntArray;
  i, xmax, xmin, ymax, ymin: integer;
begin
  temp := structure(xmin, xmax, ymin, ymax);
  if length(temp) < 2 then
    raise Exception.Create('Not enough span to plot!');
  Image1.Canvas.FillRect(TRect.Create(0, 0, Image1.Width, Image1.Height));
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.MoveTo(40, 0);
  Image1.Canvas.LineTo(45, 10);
  Image1.Canvas.MoveTo(40, 0);
  Image1.Canvas.LineTo(35, 10);
  Image1.Canvas.MoveTo(40, 0);
  Image1.Canvas.LineTo(40, 310);
  Image1.Canvas.MoveTo(40, 310);
  Image1.Canvas.LineTo(610, 310);
  Image1.Canvas.MoveTo(610, 310);
  Image1.Canvas.LineTo(600, 305);
  Image1.Canvas.MoveTo(610, 310);
  Image1.Canvas.LineTo(600, 315);
  Image1.Canvas.MoveTo(40, 310);
  Image1.Canvas.Pen.Color := RGB(0, 115, 207);
  Image1.Canvas.Pen.Width := 3;
  Image1.Canvas.MoveTo(40,
                  round(310 - ((temp[0] - ymin) / (ymax - ymin)) * 300));
  for i := 1 to length(temp) - 1 do begin
    Image1.Canvas.LineTo(round(40 + ((i) / (xmax - xmin)) * 560),
                  round(310 - ((temp[i] - ymin) / (ymax - ymin)) * 300));
  end;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Pen.Color := RGB(200, 200, 200);
  for i := 0 to length(temp) - 1 do begin
    Image1.Canvas.MoveTo(round(40 + ((i) / (xmax - xmin)) * 560), 310);
    Image1.Canvas.LineTo(round(40 + ((i) / (xmax - xmin)) * 560), 10);
    Image1.Canvas.TextOut(round(35 + ((i) / (xmax - xmin)) * 560), 320, intToStr(i + xmin));
  end;
  for i := ymin to ymax do begin
    Image1.Canvas.MoveTo(600, round(310 - ((i - ymin) / (ymax - ymin)) * 300));
    Image1.Canvas.LineTo(40, round(310 - ((i - ymin) / (ymax - ymin)) * 300));
    Image1.Canvas.TextOut(20, round(305 - ((i - ymin) / (ymax - ymin)) * 300), intToStr(i));
  end;
end;

end.
