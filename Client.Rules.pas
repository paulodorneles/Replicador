unit Client.Rules;

interface

uses
  Rules.Interfaces, Components.Model, REST.Json,
  SysUtils, REST.Types, Vcl.Dialogs, Client.Model;

type
  TClientRules = class(TInterfacedObject, iRules)
    private
      json : String;
      clientModel : TClientModel;
      procedure Send(pOperation : String);
    public
      constructor Create;
      destructor Destroy; override;
      procedure Generate(pId, pOperation : String);
  end;

implementation

{ TClientRules }


constructor TClientRules.Create;
begin

end;

destructor TClientRules.Destroy;
begin

  inherited;
end;

procedure TClientRules.Generate(pId, pOperation : String);
begin
  with dmComponentes do
  begin
    cdsClient.Close;
    cdsClient.Params.ParamByName('UUID').Value := pId;
    cdsClient.Open;
    clientModel                 := TClientModel.Create;
    clientModel.CliBairro       := cdsClientBAIRRO.Value;
    clientModel.CliBloqueado    := cdsClientBLOQUEADO.Value;
    clientModel.CliCelular      := cdsClientCELULAR.Value;
    clientModel.CliCep          := cdsClientCEP.Value;
    clientModel.CliCnpjCpf      := cdsClientCNPJCPF.Value;
    clientModel.CliEndereco     := cdsClientENDERECO.Value;
    clientModel.CliFantasia     := cdsClientFANTASIA.Value;
    clientModel.CliId           := cdsClientUUID.Value;
    clientModel.CliIdRota       := cdsClientIDROTA.Value;
    clientModel.CliLat          := cdsClientLAT.Value;
    clientModel.CliLng          := cdsClientLNG.Value;
    clientModel.CliMunicipio    := cdsClientMUNICIPIO.Value;
    clientModel.CliNome         := cdsClientNOME.Value;
    clientModel.CliNumero       := cdsClientNUMERO.Value;
    clientModel.CliTelefone     := cdsClientTELEFONE.Value;
    clientModel.CliTipoPessoa   := cdsClientTIPO_PESSOA.Value;
    clientModel.CliUF           := cdsClientUF.Value;
    clientModel.CliUltimaCompra := cdsClientULTIMA_COMPRA.Value;


    json := TJson.ObjectToJsonString(clientModel);
  end;
  send(pOperation);
end;

procedure TClientRules.Send(pOperation : String);
begin
  try
    with dmComponentes do
    begin
      if pOperation = 'DE' then
        RESTRequestClient.Method := rmDELETE;
      if pOperation = 'UP' then
        RESTRequestClient.Method := rmPUT;
      if pOperation = 'IN' then
        RESTRequestClient.Method := rmPost;

      RESTRequestClient.Resource := 'Cliente';
      RESTRequestClient.Params.ParameterByName('param').Value := json;
      RESTRequestClient.Execute;
      if (RESTResponseClient.StatusText <> 'HTTP/1.1 200 OK') then
        ShowMessage('Erro' + RESTResponseClient.StatusText);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro' + E.Message);
    end;
  end;
end;

end.
