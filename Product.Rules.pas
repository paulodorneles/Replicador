unit Product.Rules;

interface

uses
  Rules.Interfaces, Components.Model, REST.Json,
  SysUtils, REST.Types, Vcl.Dialogs, Product.Model;

type
  TProductRules = class(TInterfacedObject, iRules)
    private
      json : String;
      prodModel : TProductModel;
      procedure Send(pOperation : String);
    public
      constructor Create;
      destructor Destroy; override;
      procedure Generate(pId, pOperation : String);
  end;

implementation

{ TProductRules }

constructor TProductRules.Create;
begin

end;

destructor TProductRules.Destroy;
begin

  inherited;
end;

procedure TProductRules.Generate(pId, pOperation : String);
begin
  with dmComponentes do
  begin
    cdsProduct.Close;
    cdsProduct.Params.ParamByName('ID').Value := pId;
    cdsProduct.Open;
    prodModel                := TProductModel.Create;
    prodModel.ProId          := cdsProductID.Value;
    prodModel.ProIdCategoria := cdsProductIDCATEGORIA.Value;
    prodModel.ProNome        := cdsProductNOME.Value;
    prodModel.ProPreco       := cdsProductPRECO.Value;
    prodModel.ProUnidade     := cdsProductUNIDADE.AsString;

    json := TJson.ObjectToJsonString(prodModel);
  end;
  send(pOperation);
end;

procedure TProductRules.Send(pOperation : String);
begin
  try
    with dmComponentes do
    begin
      if pOperation = 'DE' then
        RESTRequestProduct.Method := rmDELETE;
      if pOperation = 'UP' then
        RESTRequestProduct.Method := rmPUT;
      if pOperation = 'IN' then
        RESTRequestProduct.Method := rmPost;

      RESTRequestProduct.Resource := 'Produto';
      RESTRequestProduct.Params.ParameterByName('param').Value := json;
      RESTRequestProduct.Execute;
      if (RESTResponseProduct.StatusText <> 'HTTP/1.1 200 OK') then
        ShowMessage('Erro' + RESTResponseProduct.StatusText);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro' + E.Message);
    end;
  end;
end;


end.
