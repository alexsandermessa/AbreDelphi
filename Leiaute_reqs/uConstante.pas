unit uConstante;

interface

uses
  uAtributoEnumerado;

  { Dados do Sistema }
Type
  [TEnumeradoValores('0,1')]
  [TEnumeradoDescricoes('Leiaute para Requisições,LR')]
  TTIpoEnumeradoNomeProjeto = (tenExtenso, tenAbreviado);

  [TEnumeradoValores('0,1,2,3,4')]
  [TEnumeradoDescricoes('Skin Amaralo,Skin Azul,Skin Laranja,Skin Roxo,Skin Verde')]
  TTIpoEnumeradoSkin = (tesAmarelo, tesAzul, tesLaranja, tesRoxo, tesVerde);


const
  {  CONFIGURAÇÕES  }
  cArquivoConfig = 'config.ini';
  cConfig        = 'CONFIG';
  cData          = 'DATA';
  cTipo          = 'TIPO';
  cPosicao       = 'POSICAO';
  cNome          = 'NOME';
  cColor         = 'COR';
  cSkinName      = 'SKIN';

  { Skin }
  cSkinAmarelo = 'dxSkin_DC_Amarelo';
  cSkinAzul    = 'dxSkin_DC_Azul';
  cSkinLaranja = 'dxSkin_DC_Laranja';
  cSkinRoxo    = 'dxSkin_DC_Roxo';
  cSkinVerde   = 'dxSkin_DC_Verde';

  {  Texto  }
  cArrayFormatoData: array [0..1] of String = ('dd/mm/yyyy','dd/mm/yy');
  cArrayCor: array [0..1] of String         = ('Amarelo','Branco');

  cAtencao             = 'A T E N Ç Ã O !';
  cTextoNomeComputador = 'Nome do computador';
  cTextoVersao         = 'Versão';
  cTextoPreview        = 'Pré-visualizar';
  cTextoEditar         = 'Editar';
  cTextoCopiar         = 'Copiar';
  cTextoLimpar         = 'Limpar';
  cTextoConfig         = 'Configurações';
  cTextoAcrescentar    = 'Colar';
  cTextoSuporte        = 'Suporte';
  cTextoHistorico      = 'Histórico';

  {  MENSAGEM  }
  cMensagemClipBoard  = 'Existe texto na Área de Transferência.';
  cMesangemCampoVazio = 'Campo vazio! Por favor, preencha o campo de texto e tente novamente!';

  {  RECURSOS  }
  QuebraLinha = #13#10;
  cSeparador  = '----------------------------------------------------------------------';

  { CAMINHOS }
  cSuporte = '\\FileServer\Scripts\-SUPORTE.vbs';

implementation

end.
