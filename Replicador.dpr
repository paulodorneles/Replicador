program Replicador;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Components.Model in 'Model\Components.Model.pas' {dmComponentes: TDataModule},
  Rules.Interfaces in 'Rules.Interfaces.pas',
  Product.Rules in 'Product.Rules.pas',
  Client.Rules in 'Client.Rules.pas',
  Client.Model in 'Model\Client.Model.pas',
  Product.Model in 'Model\Product.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmComponentes, dmComponentes);
  Application.Run;
end.
