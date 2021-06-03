unit libFilmFile;

interface

uses sysutils;

const STRSIZE = 127;

type TFilm = record
  name, genre, mainActor: string[STRSIZE];
  year, rating: integer;
  constructor create(_name, _genre, _mainActor: string; _year, _rating: integer);
end;

type TFilmArray = array of TFilm;

type TFilmFile = class
  num: integer;
  dataFile: file of TFilm;
  constructor create(filename: string);
  function update: TFilmArray;
  procedure add(_new: TFilm);
  procedure delete(_index: integer);
end;

implementation

constructor TFilm.create(_name: string; _genre: string; _mainActor: string; _year: Integer; _rating: Integer);
begin
  name := _name;
  genre := _genre;
  mainActor := _mainActor;
  year := _year;
  rating := _rating;
end;

constructor TFilmFile.create(filename: string);
begin
  assignfile(dataFile, filename);
  if not sysutils.fileexists(filename) then begin
    rewrite(dataFile);
    closefile(dataFile);
  end;
end;

function TFilmFile.update: TFilmArray;
var
  temp: TFilmArray;
  t: TFilm;
begin
  reset(dataFile);
  setlength(temp, 0);
  num := 0;
  while not eof(dataFile) do begin
    setlength(temp, num + 1);
    read(dataFile, temp[num]);
    inc(num);
  end;
  result := temp;
  closefile(dataFile);
end;

procedure TFilmFile.add(_new: TFilm);
var
  temp: TFilm;
  i, ins: integer;
begin
  reset(dataFile);
  if eof(dataFile) then
    write(dataFile, _new)
  else begin
    read(dataFile, temp);
    while ((not eof(dataFile)) and (compareStr(temp.name, _new.name) < 0)) do
      read(dataFile, temp);
    ins := filepos(dataFile);
    if temp.name > _new.name then begin
      dec(ins);
      for i := num - 1 downto ins do begin
        seek(dataFile, i);
        read(dataFile, temp);
        seek(dataFile, i + 1);
        write(dataFile, temp);
      end;
      seek(dataFile, ins);
    end;
    write(dataFile, _new);
  end;
  closefile(dataFile);
end;

procedure TFilmFile.delete(_index: integer);
var
  temp: TFilm;
begin
  reset(dataFile);
  seek(dataFile, _index + 1);
  while not eof(dataFile) do begin
    read(dataFile, temp);
    seek(dataFile, filepos(dataFile) - 2);
    write(dataFile, temp);
    seek(dataFile, filepos(dataFile) + 2);
  end;
  seek(dataFile, num - 1);
  truncate(dataFile);
  closefile(dataFile);
end;

end.
