unit add_dialog;

interface

uses
  libFilmFile, main, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    FilmFile: libFilmFile.TFilmFile;
  public
    procedure SetFilmFile(f: TFilmFile);
  end;

var
  Form2: TForm2;

implementation

procedure TForm2.SetFilmFile(f: libFilmFile.TFilmFile);
begin
  FilmFile := f;
end;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FilmFile.add(libFilmFile.TFilm.Create(Edit1.Text, Edit2.Text, Edit3.Text, strToInt(Edit4.Text), strToInt(Edit5.Text)));
  main.Form1.GridUpdate;
end;

end.
