unit Product.Model;

interface

uses
  System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TProductModel = class
  private
    [JSONName('pro_Id')]
    FProId: Integer;
    [JSONName('pro_IdCategoria')]
    FProIdCategoria: Integer;
    [JSONName('pro_Nome')]
    FProNome: string;
    [JSONName('pro_Preco')]
    FProPreco: Double;
    [JSONName('pro_Unidade')]
    FProUnidade: string;
  published
    property ProId: Integer read FProId write FProId;
    property ProIdCategoria: Integer read FProIdCategoria write FProIdCategoria;
    property ProNome: string read FProNome write FProNome;
    property ProPreco: Double read FProPreco write FProPreco;
    property ProUnidade: string read FProUnidade write FProUnidade;
  end;

implementation

end.
