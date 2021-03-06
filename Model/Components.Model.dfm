object dmComponentes: TdmComponentes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 632
  Width = 805
  object TrayIcon1: TTrayIcon
    BalloonFlags = bfInfo
    Left = 730
    Top = 47
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\SOFTWARE\windows\dx7\Sistemas Teste\Replicador\Win32' +
        '\Debug\DB\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 55
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 55
    Top = 160
  end
  object FDEventAlerter1: TFDEventAlerter
    Connection = FDConnection
    Names.Strings = (
      'REPLICAR')
    Left = 56
    Top = 224
  end
  object qryReplication: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '  SELECT ID, DADOS, TIPO, TABELA'
      '  FROM REPLICACAO'
      ''
      ''
      '')
    Left = 339
    Top = 33
    object qryReplicationID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryReplicationDADOS: TStringField
      FieldName = 'DADOS'
      Origin = 'DADOS'
    end
    object qryReplicationTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 2
    end
    object qryReplicationTABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
    end
  end
  object dspReplication: TDataSetProvider
    DataSet = qryReplication
    Left = 339
    Top = 97
  end
  object cdsReplication: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReplication'
    Left = 339
    Top = 161
    object cdsReplicationID: TStringField
      FieldName = 'ID'
    end
    object cdsReplicationDADOS: TStringField
      FieldName = 'DADOS'
    end
    object cdsReplicationTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 2
    end
    object cdsReplicationTABELA: TStringField
      FieldName = 'TABELA'
    end
  end
  object cdsClient: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'UUID'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspClient'
    Left = 253
    Top = 162
    object cdsClientUUID: TStringField
      FieldName = 'UUID'
    end
    object cdsClientIDROTA: TIntegerField
      FieldName = 'IDROTA'
    end
    object cdsClientNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsClientFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object cdsClientTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsClientCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsClientENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsClientNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 6
    end
    object cdsClientBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object cdsClientCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClientTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object cdsClientCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 14
    end
    object cdsClientBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      FixedChar = True
      Size = 1
    end
    object cdsClientULTIMA_COMPRA: TDateField
      FieldName = 'ULTIMA_COMPRA'
    end
    object cdsClientUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsClientMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 50
    end
    object cdsClientLAT: TStringField
      FieldName = 'LAT'
      Size = 50
    end
    object cdsClientLNG: TStringField
      FieldName = 'LNG'
      Size = 50
    end
  end
  object dspClient: TDataSetProvider
    DataSet = qryClient
    Left = 253
    Top = 98
  end
  object qryClient: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cliente'
      'where UUID = :UUID'
      '')
    Left = 253
    Top = 34
    ParamData = <
      item
        Name = 'UUID'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object qryClientUUID: TStringField
      FieldName = 'UUID'
      Origin = 'UUID'
    end
    object qryClientIDROTA: TIntegerField
      FieldName = 'IDROTA'
      Origin = 'IDROTA'
    end
    object qryClientNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryClientFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 50
    end
    object qryClientTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object qryClientCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 18
    end
    object qryClientENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryClientNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 6
    end
    object qryClientBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 25
    end
    object qryClientCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryClientTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 14
    end
    object qryClientCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 14
    end
    object qryClientBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      FixedChar = True
      Size = 1
    end
    object qryClientULTIMA_COMPRA: TDateField
      FieldName = 'ULTIMA_COMPRA'
      Origin = 'ULTIMA_COMPRA'
    end
    object qryClientUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryClientMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Size = 50
    end
    object qryClientLAT: TStringField
      FieldName = 'LAT'
      Origin = 'LAT'
      Size = 50
    end
    object qryClientLNG: TStringField
      FieldName = 'LNG'
      Origin = 'LNG'
      Size = 50
    end
  end
  object qryProduct: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto'
      'where ID = :ID'
      ''
      '')
    Left = 175
    Top = 34
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryProductID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryProductNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryProductIDCATEGORIA: TIntegerField
      FieldName = 'IDCATEGORIA'
      Origin = 'IDCATEGORIA'
    end
    object qryProductUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryProductPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object dspProduct: TDataSetProvider
    DataSet = qryProduct
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 175
    Top = 98
  end
  object cdsProduct: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspProduct'
    Left = 175
    Top = 162
    object cdsProductID: TIntegerField
      FieldName = 'ID'
    end
    object cdsProductNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsProductIDCATEGORIA: TIntegerField
      FieldName = 'IDCATEGORIA'
    end
    object cdsProductUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProductPRECO: TBCDField
      FieldName = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://192.168.1.7/api'
    Params = <>
    Left = 40
    Top = 397
  end
  object RESTRequestClient: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Name = 'param'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponseClient
    SynchronizedEvents = False
    Left = 144
    Top = 397
  end
  object RESTResponseClient: TRESTResponse
    Left = 144
    Top = 469
  end
  object RESTRequestProduct: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Name = 'param'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponseProduct
    SynchronizedEvents = False
    Left = 288
    Top = 397
  end
  object RESTResponseProduct: TRESTResponse
    ContentType = 'application/json'
    Left = 288
    Top = 468
  end
end
