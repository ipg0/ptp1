program life_is_a_function;

uses
  Vcl.Forms,
  libFilmFile in 'libFilmFile.pas',
  add_dialog in 'add_dialog.pas' {Form2},
  custom_output in 'custom_output.pas' {Form3},
  main in 'main.pas' {Form1},
  plot in 'plot.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
