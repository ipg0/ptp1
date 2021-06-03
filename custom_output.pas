unit custom_output;

interface

uses
  libFilmFile, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type TFilterOption = (actorFlt, genreFlt);

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    FilmFile: libFilmFile.TFilmFile;
    filter: TFilterOption;
    fltString: string;
    ratingThreshold: integer;
  public
    procedure SetParameters(c: string; _filter: TFilterOption = actorFlt; t: integer = -1);
    procedure SetFilmFile(f: libFilmFile.TFilmFile);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
var
  i, c: integer;
  temp: libFilmFile.TFilmArray;
begin
  temp := FilmFile.update();
  StringGrid1.RowCount := 0;
  c := 1;
  StringGrid1.Cells[0, 0] := 'Name';
  StringGrid1.Cells[1, 0] := 'Genre';
  StringGrid1.Cells[2, 0] := 'Main Actor';
  StringGrid1.Cells[3, 0] := 'Year';
  StringGrid1.Cells[4, 0] := 'Rating';
  for i := 0 to length(temp) - 1 do
    if ((filter = genreFlt) and (temp[i].genre = fltString)
        or (filter = actorFlt) and (temp[i].mainActor = fltString))
        and ((ratingThreshold < 0) or
        (temp[i].rating >= ratingThreshold)) then begin
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[0, c] := temp[i].name;
      StringGrid1.Cells[1, c] := temp[i].genre;
      StringGrid1.Cells[2, c] := temp[i].mainActor;
      StringGrid1.Cells[3, c] := intToStr(temp[i].year);
      StringGrid1.Cells[4, c] := intToStr(temp[i].rating);

      inc(c);
    end;
end;

procedure TForm3.SetFilmFile(f: libFilmFile.TFilmFile);
begin
  FilmFile := f;
end;

procedure TForm3.SetParameters(c: string; _filter: TFilterOption = actorFlt; t: integer = -1);
begin
  filter := _filter;
  fltString := c;
  ratingThreshold := t;

end;

end.
