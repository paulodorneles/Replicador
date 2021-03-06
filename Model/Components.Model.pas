unit Components.Model;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, Vcl.ExtCtrls, Vcl.Dialogs, REST.Types;

type
  TdmComponentes = class(TDataModule)
    TrayIcon1: TTrayIcon;
    FDConnection: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDEventAlerter1: TFDEventAlerter;
    qryReplication: TFDQuery;
    qryReplicationID: TStringField;
    qryReplicationDADOS: TStringField;
    qryReplicationTIPO: TStringField;
    qryReplicationTABELA: TStringField;
    dspReplication: TDataSetProvider;
    cdsReplication: TClientDataSet;
    cdsReplicationID: TStringField;
    cdsReplicationDADOS: TStringField;
    cdsReplicationTIPO: TStringField;
    cdsReplicationTABELA: TStringField;
    cdsClient: TClientDataSet;
    dspClient: TDataSetProvider;
    qryClient: TFDQuery;
    qryProduct: TFDQuery;
    dspProduct: TDataSetProvider;
    cdsProduct: TClientDataSet;
    RESTClient1: TRESTClient;
    RESTRequestClient: TRESTRequest;
    RESTResponseClient: TRESTResponse;
    RESTRequestProduct: TRESTRequest;
    RESTResponseProduct: TRESTResponse;
    qryProductID: TIntegerField;
    qryProductNOME: TStringField;
    qryProductIDCATEGORIA: TIntegerField;
    qryProductUNIDADE: TStringField;
    qryProductPRECO: TBCDField;
    cdsProductID: TIntegerField;
    cdsProductNOME: TStringField;
    cdsProductIDCATEGORIA: TIntegerField;
    cdsProductUNIDADE: TStringField;
    cdsProductPRECO: TBCDField;
    qryClientUUID: TStringField;
    qryClientIDROTA: TIntegerField;
    qryClientNOME: TStringField;
    qryClientFANTASIA: TStringField;
    qryClientTIPO_PESSOA: TStringField;
    qryClientCNPJCPF: TStringField;
    qryClientENDERECO: TStringField;
    qryClientNUMERO: TStringField;
    qryClientBAIRRO: TStringField;
    qryClientCEP: TStringField;
    qryClientTELEFONE: TStringField;
    qryClientCELULAR: TStringField;
    qryClientBLOQUEADO: TStringField;
    qryClientULTIMA_COMPRA: TDateField;
    qryClientUF: TStringField;
    qryClientMUNICIPIO: TStringField;
    qryClientLAT: TStringField;
    qryClientLNG: TStringField;
    cdsClientUUID: TStringField;
    cdsClientIDROTA: TIntegerField;
    cdsClientNOME: TStringField;
    cdsClientFANTASIA: TStringField;
    cdsClientTIPO_PESSOA: TStringField;
    cdsClientCNPJCPF: TStringField;
    cdsClientENDERECO: TStringField;
    cdsClientNUMERO: TStringField;
    cdsClientBAIRRO: TStringField;
    cdsClientCEP: TStringField;
    cdsClientTELEFONE: TStringField;
    cdsClientCELULAR: TStringField;
    cdsClientBLOQUEADO: TStringField;
    cdsClientULTIMA_COMPRA: TDateField;
    cdsClientUF: TStringField;
    cdsClientMUNICIPIO: TStringField;
    cdsClientLAT: TStringField;
    cdsClientLNG: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConnectionParameters;
    procedure UrlDefault;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmComponentes: TdmComponentes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmComponentes.DataModuleCreate(Sender: TObject);
begin
  ConnectionParameters;
  UrlDefault;
end;

procedure TdmComponentes.UrlDefault;
begin
  RESTClient1.BaseURL := 'http://192.168.1.35/api';
end;

procedure TdmComponentes.ConnectionParameters;
begin
  try
    FDConnection.Params.clear;
    FDConnection.Connected       := false;
    FDConnection.Params.Database := ExtractFilePath(ParamStr(0)) +'\DB\DADOS.FDB';
    FDConnection.Params.UserName := 'SYSDBA';
    FDConnection.Params.Password := 'masterkey';
    FDConnection.Params.DriverID := 'FB';
    FDConnection.Params.Add('Port=3050');
    FDConnection.Connected       := true;
  except
    on E: Exception do
    begin
      showMessage('Problemas de conex?o: ' + E.Message);
      exit;
    end;
  end;
end;

end.
