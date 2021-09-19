unit Client.Model;

interface

uses
  System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TClientModel = class
  private
    [JSONName('cli_Bairro')]
    FCliBairro: string;
    [JSONName('cli_Bloqueado')]
    FCliBloqueado: string;
    [JSONName('cli_Celular')]
    FCliCelular: string;
    [JSONName('cli_Cep')]
    FCliCep: string;
    [JSONName('cli_CnpjCpf')]
    FCliCnpjCpf: string;
    [JSONName('cli_Endereco')]
    FCliEndereco: string;
    [JSONName('cli_Fantasia')]
    FCliFantasia: string;
    [JSONName('cli_Id')]
    FCliId: string;
    [JSONName('cli_IdRota')]
    FCliIdRota: Integer;
    [JSONName('cli_Lat')]
    FCliLat: string;
    [JSONName('cli_Lng')]
    FCliLng: string;
    [JSONName('cli_Municipio')]
    FCliMunicipio: string;
    [JSONName('cli_Nome')]
    FCliNome: string;
    [JSONName('cli_Numero')]
    FCliNumero: string;
    [JSONName('cli_Telefone')]
    FCliTelefone: string;
    [JSONName('cli_TipoPessoa')]
    FCliTipoPessoa: string;
    [JSONName('cli_UF')]
    FCliUF: string;
    [JSONName('cli_UltimaCompra')]
    FCliUltimaCompra: TDateTime;
  published
    property CliBairro: string read FCliBairro write FCliBairro;
    property CliBloqueado: string read FCliBloqueado write FCliBloqueado;
    property CliCelular: string read FCliCelular write FCliCelular;
    property CliCep: string read FCliCep write FCliCep;
    property CliCnpjCpf: string read FCliCnpjCpf write FCliCnpjCpf;
    property CliEndereco: string read FCliEndereco write FCliEndereco;
    property CliFantasia: string read FCliFantasia write FCliFantasia;
    property CliId: string read FCliId write FCliId;
    property CliIdRota: Integer read FCliIdRota write FCliIdRota;
    property CliLat: string read FCliLat write FCliLat;
    property CliLng: string read FCliLng write FCliLng;
    property CliMunicipio: string read FCliMunicipio write FCliMunicipio;
    property CliNome: string read FCliNome write FCliNome;
    property CliNumero: string read FCliNumero write FCliNumero;
    property CliTelefone: string read FCliTelefone write FCliTelefone;
    property CliTipoPessoa: string read FCliTipoPessoa write FCliTipoPessoa;
    property CliUF: string read FCliUF write FCliUF;
    property CliUltimaCompra: TDateTime read FCliUltimaCompra write FCliUltimaCompra;
  end;

implementation

end.
