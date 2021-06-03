unit main;

interface

uses libFilmFile, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.Classes;

type TForm1 = class(TForm)
  StringGrid1: TStringGrid;
  Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Edit4: TEdit;
  procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
private
  FilmFile: libFilmFile.TFilmFile;
public
  procedure GridUpdate;
end;

var
  Form1: TForm1;

implementation

uses
 add_dialog, custom_output, plot;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  add_dialog.Form2.SetFilmFile(FilmFile);
  add_dialog.Form2.Show;
end;


procedure TForm1.GridUpdate;
var
  FilmArray: libFilmFile.TFilmArray;
  i: integer;
  leastRatedFilm: TFilm;
begin
  FilmArray := FilmFile.update;
  leastRatedFilm.rating := 1000;
  StringGrid1.RowCount := length(FilmArray) + 1;
  for i := 0 to length(FilmArray) - 1 do begin
    if FilmArray[i].rating < leastRatedFilm.rating then
      leastRatedFilm := FilmArray[i];
    StringGrid1.Cells[0, i + 1] := FilmArray[i].name;
    StringGrid1.Cells[1, i + 1] := FilmArray[i].genre;
    StringGrid1.Cells[2, i + 1] := FilmArray[i].mainActor;
    StringGrid1.Cells[3, i + 1] := intToStr(FilmArray[i].year);
    StringGrid1.Cells[4, i + 1] := intToStr(FilmArray[i].rating);
  end;
  Edit4.Text := leastRatedFilm.genre;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if StringGrid1.Selection.Top = 0 then
    raise Exception.Create('Wrong Selection!')
  else begin
    FilmFile.delete(StringGrid1.Selection.Top - 1);
    GridUpdate;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.SetFilmFile(filmFile);
  Form3.SetParameters(Edit1.Text, genreFlt, strToInt(Edit2.Text));
  Form3.Show();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form3.SetFilmFile(filmFile);
  Form3.SetParameters(Edit3.Text);
  Form3.Show();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form4.SetFilmFile(filmFile);
  Form4.Show();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FilmFile := libFilmFile.TFilmFile.Create('data.bin');
  GridUpdate;
  StringGrid1.Cells[0, 0] := 'Name';
  StringGrid1.Cells[1, 0] := 'Genre';
  StringGrid1.Cells[2, 0] := 'Main Actor';
  StringGrid1.Cells[3, 0] := 'Year';
  StringGrid1.Cells[4, 0] := 'Rating';
end;

end.
