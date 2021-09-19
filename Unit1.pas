unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ADSWrapper, FireDAC.Stan.Async,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ADS;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    FDADSRestore1: TFDADSRestore;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure ListMount;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Components.Model, Client.Rules, Product.Rules;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.Hide;
  Self.WindowState := wsMinimized;
  if not Assigned(dmComponentes) then
    dmComponentes := TdmComponentes.Create(Application);
  dmComponentes.TrayIcon1.Visible := true;
  dmComponentes.FDEventAlerter1.Active := true;
 // ListMount;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ListMount;
end;

procedure TForm1.ListMount;
var
  prodRules : TProductRules;
  clientRules : TClientRules;
begin
  with dmComponentes do
  begin
    cdsReplication.Close;
    cdsReplication.Open;
    if cdsReplication.RecordCount > 0 then
    begin
      cdsReplication.First;
      while not cdsReplication.Eof do
      begin
        if cdsReplicationTABELA.AsString = 'PRODUTOS' then
        begin
          prodRules := TProductRules.Create;
          prodRules.Generate(cdsReplicationDADOS.AsString, cdsReplicationTIPO.AsString);
        end;
        if cdsReplicationTABELA.AsString = 'CLIENTE' then
        begin
          clientRules := TClientRules.Create;
          clientRules.Generate(cdsReplicationDADOS.AsString, cdsReplicationTIPO.AsString);
        end;

        cdsReplication.Next;
      end;
    end;
  end;
end;



end.
