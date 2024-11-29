unit AbreDelphi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.ShellAPI, Vcl.StdCtrls,
  Vcl.AppEvnts, Vcl.Buttons, uDTCTipos, uAtributoEnumerado, uSystemUtils,
  System.Generics.Collections, uDtcForms, uDTCHeader, Vcl.ExtCtrls, Vcl.FileCtrl,
  Vcl.ComCtrls;

type
  [TEnumeradoValores('65,66,67')]
  [TEnumeradoDescricoes('"Bin.Dtc", "Bin.Liberacao", "Bin.Separado"')]
  TTipoBin = (tbDTC, tbLiberacao, tbSeparado);

  [TEnumeradoValores('27,65,66,67,49,70,82,76,68,85,78,80,84,69,72,89,79,73,90,83,98,99,71,81,77,75')]
  [TEnumeradoDescricoesCurtas('W,A,B,C,1,F,R,L,D,U,N,P,T,E,H,Y,O,I,Z,S,2,3,G,Q,M,K')]
  TTipoEventoExecutar = (teeFechar,
                         teeAmbienteDTC,
                         teeAmbienteLiberacao,
                         teeAmbienteSeparado,
                         teeAbreDelphi,
                         teeFechaDelphi,
                         teeRestaurarRegistro_Desativado,
                         teeScriptLogon,
                         teeDCDados,
                         teeDCAuditoria,
                         teeReabrirSend,
                         teeSuporte,
                         teeTestcomplete,
                         teeLibDelphi,
                         teeLibDelphiCompleto,
                         teeLimparOutput,
                         teeCopiaOutPut,
                         teeLibDelphiImagens,
                         teePersonalizador,
                         teePrioridadesNucleo,
                         teeUpdate,
                         teeCommit,
                         teeTestaDCCOmparaEstrutura,
                         teeCheckForModification,
                         teeAbrirRequisicao,
                         teeTypeScanner);

  TFormAbreDelphiAmbientes = class(TForm)
    lbl1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelA: TLabel;
    LabelB: TLabel;
    LabelC: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    DTCHeaderExecutar: TDTCHeader;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TimerBinAtual: TTimer;
    Label11: TLabel;
    DirectoryListBoxLimpaOutput: TDirectoryListBox;
    Label12: TLabel;
    TimerDestacarAtalho: TTimer;
    LabelArquivosOutPut: TLabel;
    LabelLibDelphiImagens: TLabel;
    LabelDelphiAberto: TLabel;
    TimerDelphiAberto: TTimer;
    LabelPersonalizador: TLabel;
    LabelPrioridades: TLabel;
    LabelUpdate: TLabel;
    LabelCommit: TLabel;
    LabelTestaDCComparaEstrutura: TLabel;
    PanelEmTesteDTC: TPanel;
    Label1: TLabel;
    LabelRequisicao: TLabel;
    LabelTypeScanner: TLabel;
    TimerTypeScanner: TTimer;
    LabelClassComponent: TLabel;
    Labeljanela: TLabel;
    LabelNomeClasse: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function DelphiAberto(ATipoEventoExecutar: TTipoEventoExecutar): Boolean;
    function DelphiRodando: Boolean;
    function TestCompleteAberto: Boolean;
    function ProgramaRodando(ANomeProcesso: string): Boolean;

    procedure FormShow(Sender: TObject);
    procedure TimerDelphiAbertoTimer(Sender: TObject);
    procedure TimerBinAtualTimer(Sender: TObject);
    procedure TimerDestacarAtalhoTimer(Sender: TObject);
    procedure TimerTypeScannerTimer(Sender: TObject);
  private
    FLabelDestacado: TLabel;
    FListaTeclas: TDictionary<Word,TTipoEventoExecutar>;
    FShiftState: TShiftState;

    FLocalBinSelecionado: String;
    FTipoBinSelecionado: TTipoBin;
    procedure ConfigurarFavoritosWelcomePageDelphi12;
    procedure SetTipoBinSelecionado(const Value: TTipoBin);
    property TipoBinSelecionado: TTipoBin read FTipoBinSelecionado write SetTipoBinSelecionado;
    procedure AlterarAmbiente(ATipoBin : TTipoBin);
    procedure AbrirDelphi;

    procedure VerificarDelphiAberto;
    procedure DestacarLabel(ATipoEventoExecutar : TTipoEventoExecutar);

    procedure ConsultarVariavelDelphiSVN;
    procedure CarregarListaTeclas;
    procedure ExecutarEvento(ATeclaPressionada: Word);
    function PressionouShift: Boolean;
    function PressionouCtrl: Boolean;
    function RetornaCaminhoAtalhosIDE: string;
    function RetornaCaminhoOutPut: string;
    procedure LimparOutput;
    procedure CopiaArquivosOutPut;
    function RetornaCaminhoBat(ANomeArquivoBat: string): string;
    procedure TypeScanner(Sender: TObject);

    const cArquivoIniciaAmbiente = 'MeuIniciaEmbiente.bat';
    const cArquivoLimparOutput = 'LimparOutput.bat';
    const cArquivoAbreDelphi = 'AbreDelphi.bat';
    const cArquivosCopiaOutPut = 'CopiaOutPut.bat';
    const cCaptionEmTesteDTC = 'Em Teste DTC: ';
    const cVariavelEmTesteDTC = 'EM_TESTE_DTC';
    const cValorVariavelEmTesteDTC = 'SIM';
    const cArquivoRegistroEmbarcadero = 'G:\RegistroEmbarcadero\RegistroEmbarcadero.reg';
    const cArquivoRegistroEmbarcaderoRenomear = 'G:\RegistroEmbarcadero\RegistroEmbarcadero_%s.reg';
    const cRegistroEmbarcadero = '"HKEY_CURRENT_USER\Software\Embarcadero"';
    const cRegistroRestaurarDepoisAbrirDelphi = 'C:\Users\%s\RegistrosRestaurarAposDelphi.reg';

    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  FormAbreDelphiAmbientes: TFormAbreDelphiAmbientes;

implementation

uses
  Winapi.TlHelp32, uStringManipulacao, uArquivoManipulacao, System.RegularExpressions;

{$R *.dfm}

procedure TFormAbreDelphiAmbientes.AbrirDelphi;
var
  vArquivoBat: TStrings;
  vCaminhoAbreDelphi: string;
  vCaminhoRegistroRestaurar: string;
begin
  vArquivoBat := TStringList.Create;

  vArquivoBat.Add('@Echo OFF');

  if PressionouShift then
    vArquivoBat.Add('@call '+RetornaCaminhoAtalhosIDE+'Abre_IDE_Delphi_SemProjetos.bat')
  else
    vArquivoBat.Add('@call '+RetornaCaminhoAtalhosIDE+'Abre_IDE_Delphi.bat');

  vCaminhoRegistroRestaurar := Format(cRegistroRestaurarDepoisAbrirDelphi, [TSystemUtils.NomeUsuario]);

  if FileExists(vCaminhoRegistroRestaurar) then
    vArquivoBat.Add('call REGEDIT /s "'+vCaminhoRegistroRestaurar+'"');

  vCaminhoAbreDelphi := RetornaCaminhoBat(cArquivoAbreDelphi);

  if FileExists(vCaminhoAbreDelphi) then
    DeleteFile(vCaminhoAbreDelphi);

  vArquivoBat.SaveToFile(vCaminhoAbreDelphi);
  TSystemUtils.FreeAndNilDtc(vArquivoBat);

  ShellExecute(Handle, 'Open', PWideChar(vCaminhoAbreDelphi), nil, PWideChar('C:'), SW_SHOWNORMAL);

  if not PressionouShift then
    Self.Close;
end;

procedure TFormAbreDelphiAmbientes.AfterConstruction;
begin
  inherited;
  //TDtcForms.MessageDtc('criou');
end;

procedure TFormAbreDelphiAmbientes.AlterarAmbiente(ATipoBin: TTipoBin);
var
  vArquivoBat: TStrings;
  vCaminhoPastaAmbiente: string;
begin

  TipoBinSelecionado := ATipoBin;
  vArquivoBat := TStringList.Create;
  vArquivoBat.Add('@Echo OFF');
  vArquivoBat.Add('call C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\IniciaAmbiente_Forcado.bat');

  if PressionouShift then
    vArquivoBat.Add('call '+RetornaCaminhoAtalhosIDE+'Abre_IDE_Delphi.bat');

  vCaminhoPastaAmbiente := RetornaCaminhoBat(cArquivoIniciaAmbiente);

  if FileExists(vCaminhoPastaAmbiente) then
    DeleteFile(vCaminhoPastaAmbiente);

  vArquivoBat.SaveToFile(vCaminhoPastaAmbiente);
  TSystemUtils.FreeAndNilDtc(vArquivoBat);

  ShellExecute(Handle, 'Open', PWideChar(vCaminhoPastaAmbiente), nil, PWideChar('C:'), SW_SHOWNORMAL);

  ConfigurarFavoritosWelcomePageDelphi12;
end;

procedure TFormAbreDelphiAmbientes.BeforeDestruction;
begin
  inherited;
  //TDtcForms.MessageDtc('destruiu');
end;

procedure TFormAbreDelphiAmbientes.FormCreate(Sender: TObject);
begin
  VerificarDelphiAberto;
  CarregarListaTeclas;
  DTCHeaderExecutar.Font.Color := clRed;
  FShiftState := [];
  TimerDelphiAberto.Enabled := True;
end;

procedure TFormAbreDelphiAmbientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FShiftState := Shift;
  ExecutarEvento(Key);
end;

function TFormAbreDelphiAmbientes.DelphiAberto(ATipoEventoExecutar: TTipoEventoExecutar): Boolean;
begin
  Result := False;

  if ATipoEventoExecutar in [teeAmbienteDTC,teeAmbienteLiberacao, teeAmbienteSeparado, teeAbreDelphi,teeLibDelphi, teeLibDelphiCompleto, teeLibDelphiImagens] then
  begin
    Result := DelphiRodando;

    if Result then
      TDtcForms.MessageDtc('O Delphi está aberto.', BotoesMsgAviso);
  end;
end;

function TFormAbreDelphiAmbientes.DelphiRodando: Boolean;
begin
  Result := ProgramaRodando('bds.exe');
end;

procedure TFormAbreDelphiAmbientes.DestacarLabel(ATipoEventoExecutar: TTipoEventoExecutar);
var
  vInd: Integer;
  vAtalho: string;
begin
  vAtalho := TEnumeradoDescricoesCurtas.Descricao<TTipoEventoExecutar>(ATipoEventoExecutar);
  for vInd := 0 to self.ComponentCount -1 do
  begin
    if self.Components[vInd] is TLabel then
    begin
      FLabelDestacado := (self.Components[vInd] as TLabel);
      if Copy(FLabelDestacado.Caption, 1, 1) = vAtalho then
      begin
        FLabelDestacado.Font.Size := 15;
        FLabelDestacado.Font.Color := clRed;
        FLabelDestacado.Update;

        TimerDestacarAtalho.Enabled := True;
        Break;
      end;
    end;
  end;

end;

procedure TFormAbreDelphiAmbientes.SetTipoBinSelecionado(const Value: TTipoBin);
begin
  FTipoBinSelecionado := Value;
  FLocalBinSelecionado := TEnumeradoDescricoes.Descricao<TTipoBin>(FTipoBinSelecionado);

  LabelA.Font.Color := clLime;
  LabelA.Font.Style := [];
  LabelA.Update;
  LabelB.Font.Color := clLime;
  LabelB.Font.Style := [];
  LabelB.Update;
  LabelC.Font.Color := clLime;
  LabelC.Font.Style := [];
  LabelC.Update;
end;

function TFormAbreDelphiAmbientes.TestCompleteAberto: Boolean;
begin
  Result := ProgramaRodando('TestComplete.exe');
end;

procedure TFormAbreDelphiAmbientes.CarregarListaTeclas;
var
  vTipoEventoExecutar : TTipoEventoExecutar;
begin
  FListaTeclas := TDictionary<Word,TTipoEventoExecutar>.Create;

  for vTipoEventoExecutar := Low(TTipoEventoExecutar) to High(TTipoEventoExecutar) do
    FListaTeclas.Add(TEnumeradoValores.ValorInteiro<TTipoEventoExecutar>(vTipoEventoExecutar), vTipoEventoExecutar);

  FListaTeclas.Add(97, teeAbreDelphi);
  FListaTeclas.Add(87, teeFechar);

  FListaTeclas.Add(50, teeUpdate);
  FListaTeclas.Add(51, teeCommit);
end;

procedure TFormAbreDelphiAmbientes.ConfigurarFavoritosWelcomePageDelphi12;
var
  vCaminhoRegistroRestaurar : string;
  vArquivoRegistroLeitura : TStrings;
  vArquivoRegistroSalvar : TStrings;
  vLinha: string;
  vLinhaSalvar: string;
  vEncontrouFavoritos: Boolean;
  vMatch : TMatch;
  vBin: string;
const
  cExpressaoBin = '(?<=C:\\\\Bin\.)\w+';
  cExpressaoInicioLinhaFavoritos = 'File_\d.=';
begin
  vEncontrouFavoritos := false;
  vCaminhoRegistroRestaurar := Format(cRegistroRestaurarDepoisAbrirDelphi, [TSystemUtils.NomeUsuario]);
  vArquivoRegistroSalvar := TStringList.Create;
  vArquivoRegistroLeitura := TStringList.Create;
  vBin := texto(FLocalBinSelecionado).TextoDepoisDe('.');

  if FileExists(vCaminhoRegistroRestaurar) then
  begin
    vArquivoRegistroLeitura.LoadFromFile(vCaminhoRegistroRestaurar);

    for vLinha in vArquivoRegistroLeitura do
    begin
      vLinhaSalvar := vLinha;
      if vLinhaSalvar.Contains('Favorite Projects') then
        vEncontrouFavoritos := true;

      if vEncontrouFavoritos then
      begin
        vMatch := TRegEx.Match(vLinhaSalvar, cExpressaoInicioLinhaFavoritos, [roIgnoreCase, roSingleLine]);

        if vMatch.Success then
          vMatch := TRegEx.Match(vLinhaSalvar, cExpressaoBin, [roIgnoreCase, roSingleLine]);

        if vMatch.Success then
          vLinhaSalvar := TRegEx.Replace(vLinhaSalvar, cExpressaoBin, vBin);
      end;

      vArquivoRegistroSalvar.Add(vLinhaSalvar);
    end;


    if vEncontrouFavoritos and (vArquivoRegistroSalvar.Count > 0) then
      vArquivoRegistroSalvar.SaveToFile(vCaminhoRegistroRestaurar);
  end;
end;

procedure TFormAbreDelphiAmbientes.ConsultarVariavelDelphiSVN;
var
  vValorVariavel : PCHAR;
  vTipoBin: TTipoBin;
  vPastaBin: string;
begin
  vValorVariavel := StrAlloc(500);

  if GetEnvironmentVariable('DELPHI_SVN', vValorVariavel, 500) > 0 then
  begin
    for vTipoBin := Low(TTipoBin) to High(TTipoBin) do
    begin
      vPastaBin := UpperCase(TEnumeradoDescricoes.Descricao<TTipoBin>(vTipoBin));
      if Pos(vPastaBin, UpperCase(vValorVariavel)) > 0 then
      begin
        TipoBinSelecionado := vTipoBin;
        Break;
      end;
    end;
  end;

  vValorVariavel := nil;
  StrDispose(vValorVariavel);
end;


procedure TFormAbreDelphiAmbientes.CopiaArquivosOutPut;
var
  vCaminhoBat: string;
  vArquivoBat : TStrings;
const
  cSiglasValidas = 'CW, LW, PW, GE, WM, WN, WL, XI, WP';

  function MontaBat: Boolean;
  var
    vDELPHI_LIB_TERC_RT: string;
    vDELPHI_BATS : string;
    vSiglaSistema: string;
  begin
    vSiglaSistema := InputBox('Copia arquivos OutPut', 'Digite a sigla do sistema:', '');

    Result := Pos(vSiglaSistema, cSiglasValidas) > 0;

    if not Result then
      TDtcForms.MessageDtc('Sigla inválida', BotoesMsgAviso)
    else
    begin
      vCaminhoBat         := RetornaCaminhoBat(cArquivosCopiaOutPut);
      vDELPHI_LIB_TERC_RT := 'C:\'+FLocalBinSelecionado+'\Delphi\Output\LibTerceirosRuntime';
      vDELPHI_BATS        := 'C:\'+FLocalBinSelecionado+'\Delphi\Fontes\Principal\Bats';

      vArquivoBat := TStringList.Create;
      vArquivoBat.Add('@ECHO OFF');
      vArquivoBat.Add(':SET_PARAMETROS_EXECUCAO');
      vArquivoBat.Add('SET vSigla='+vSiglaSistema);
      vArquivoBat.Add('SET vTestComplete=%2');
      vArquivoBat.Add('SET vDestinoCopia='+RetornaCaminhoOutPut);
      vArquivoBat.Add('SET vMensagemExibir=A');
      vArquivoBat.Add(':DEF_SISTEMA_COPIA');
      vArquivoBat.Add('IF /I %vSigla%.==. (');
      vArquivoBat.Add('   SET SET vMensagemExibir=A');
      vArquivoBat.Add('   GOTO :AJUDA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==CW (');
      vArquivoBat.Add('   SET vSistema=ContabMillenium');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==LW (');
      vArquivoBat.Add('   SET vSistema=WinLalur');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==PW (');
      vArquivoBat.Add('   SET vSistema=WinPatrimonio');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==GE (');
      vArquivoBat.Add('   SET vSistema=WinContas');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==WM (');
      vArquivoBat.Add('   SET vSistema=DataMoney');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==WN (');
      vArquivoBat.Add('   SET vSistema=WinCaixaNew');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==WL (');
      vArquivoBat.Add('   SET vSistema=WinLivros');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==XI (');
      vArquivoBat.Add('   SET vSistema=XML_Importer');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vSigla%==WP (');
      vArquivoBat.Add('   SET vSistema=WinDP');
      vArquivoBat.Add('   GOTO :DEF_DESTINO_COPIA');
      vArquivoBat.Add(')');
      vArquivoBat.Add('SET vMensagemExibir=E');
      vArquivoBat.Add('GOTO :AJUDA');
      vArquivoBat.Add(':DEF_DESTINO_COPIA');
      vArquivoBat.Add('IF %vTestComplete%.==. (');
      vArquivoBat.Add('   SET vTestComplete=F');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vTestComplete%==F (');
      vArquivoBat.Add('   SET vDestinoCopia=%vDestinoCopia%\%vSistema%');
      vArquivoBat.Add('   GOTO :INICIO');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF /I %vTestComplete%==T (');
      vArquivoBat.Add('   SET vDestinoCopia=%vDestinoCopia%\%vSistema%_TestComplete');
      vArquivoBat.Add('   GOTO :INICIO');
      vArquivoBat.Add(')');
      vArquivoBat.Add('SET vMensagemExibir=E');
      vArquivoBat.Add('GOTO :AJUDA');
      vArquivoBat.Add(':INICIO');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO Copiando arquivos para o sistema %vSistema%....');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('IF NOT EXIST "%vDestinoCopia%" (MD "%vDestinoCopia%")');
      vArquivoBat.Add('SET vArquivosFirebird=fbclient.dll');
      vArquivoBat.Add('SET vArquivosResource=PackageResourcesExtraDTC.bpl');
      vArquivoBat.Add('SET vArquivosDLLsBasicas=iconv.dll, libxml2.dll, msvcr71.dll, msvcr71.dll, zlib1.dll');
      vArquivoBat.Add('SET vArquivosSegurancaOpenSSL=libeay32.dll, ssleay32.dll, msvcr120.dll');
      vArquivoBat.Add('SET vArquivosAssinaturaXMLSha256=libcharset-1.dll, libexslt-0.dll, libgcc_s_dw2-1.dll, libiconv-2.dll, libintl-8.dll, libltdl-7.dll, libwinpthread-1.dll, libxml2-2.dll, libxmlsec1.dll, libxmlsec1-openssl.dll, libxslt-1.dll, zlib1.dll');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Arquivos Firebird ............................................... ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO [ "C:\'+FLocalBinSelecionado+'\Delphi\Fontes\Principal\Projetos\InstalacaoFireBird\Arquivos para Instalacao\Win32\bin\" ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO { %vArquivosFirebird% }');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('FOR %%A IN (%vArquivosFirebird%) DO XCOPY "C:\'+FLocalBinSelecionado+'\Delphi\Fontes\Principal\Projetos\InstalacaoFireBird\Arquivos para Instalacao\Win32\bin\%%A" "%vDestinoCopia%\" /Y /I /Q');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Aquivos de resource ............................................. ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO [ "'+vDELPHI_LIB_TERC_RT+'\" ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO { %vArquivosResource% }');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('FOR %%A IN (%vArquivosResource%) DO XCOPY "'+vDELPHI_LIB_TERC_RT+'\%%A" "%vDestinoCopia%\" /Y /I /Q');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Arquivos basicos ................................................ ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO [ "'+vDELPHI_BATS+'\DLLs\" ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO { %vArquivosDLLsBasicas% }');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('FOR %%A IN (%vArquivosDLLsBasicas%) DO XCOPY "'+vDELPHI_BATS+'\DLLs\%%A" "%vDestinoCopia%\" /Y /I /Q');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Arquivos necessarios para seguranca OpenSSL (Criptografias) ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO [ "'+vDELPHI_BATS+'\DLLs\OpenSSL_x86\" ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO { %vArquivosSegurancaOpenSSL% }');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('FOR %%A IN (%vArquivosSegurancaOpenSSL%) DO XCOPY "'+vDELPHI_BATS+'\DLLs\OpenSSL_x86\%%A" "%vDestinoCopia%\" /Y /I /Q');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Arquivos necessarios para assinatura XML Sha256 .................. ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO [ "C:\'+FLocalBinSelecionado+'\Delphi\Fontes\Terceiros\ACBr\DLLs\XMLSec\MinGW\32\" ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO { %vArquivosAssinaturaXMLSha256% }');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('FOR %%A IN (%vArquivosAssinaturaXMLSha256%) DO XCOPY "C:\'+FLocalBinSelecionado+'\Delphi\Fontes\Terceiros\ACBr\DLLs\XMLSec\MinGW\32\%%A" "%vDestinoCopia%\" /Y /I /Q');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: Personalizacao .................................................. ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO Gerando personalizacao para o sistema %vSistema%.');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('CALL %UNC_ATUAL%\--Encrip.all\Personalizador.exe %vSigla% "%vDestinoCopia%" /TesteInterno /AutoExecuta /Oculto');
      vArquivoBat.Add('ECHO Processos finalizados!');
      vArquivoBat.Add(':AJUDA');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO :: ========================================================================== ::');
      vArquivoBat.Add('ECHO ::              Versao atual .......... : 1.0a                                ::');
      vArquivoBat.Add('ECHO ::              Ultima modificacao .... : 21/12/2018 ( @Werner )              ::');
      vArquivoBat.Add('ECHO ::              Data da sua criacao ... : 21/12/2018 ( @Werner )              ::');
      vArquivoBat.Add('ECHO :: ========================================================================== ::');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO ATENCAO:');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('IF %vMensagemExibir%==A (');
      vArquivoBat.Add('   ECHO   Script de copia dos arquivos basicos necessarios para execucao dos sistemas.');
      vArquivoBat.Add('   ECHO   Por enquanto somente e possivel passar UMA sigla para execucao deste script.');
      vArquivoBat.Add('   ECHO   Como destino da copia dos arquivos e utilizado o ambiente atual do SVN.');
      vArquivoBat.Add('   ECHO.');
      vArquivoBat.Add('   ECHO   { Ambiente atual do SVN: C:\'+FLocalBinSelecionado+'\ }');
      vArquivoBat.Add(')');
      vArquivoBat.Add('IF %vMensagemExibir%==E (');
      vArquivoBat.Add('   ECHO   Parametros invalidos! Verifique.');
      vArquivoBat.Add('   ECHO.');
      vArquivoBat.Add('   ECHO   Parametro 1 : %vSigla%');
      vArquivoBat.Add('   ECHO   Parametro 2 : %vTestComplete%');
      vArquivoBat.Add(')');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO SINTAXE:');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO   ArquivosCopiarOutput.bat + SIGLA + TESTCOMPLETE');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO PARAMETROS:');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO   [ SIGLA ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO     Valores aceitos : CW, LW, PW, GE, WM, WN, WL, XI, WP.');
      vArquivoBat.Add('ECHO     Valor defaul    : Nao ha.');
      vArquivoBat.Add('ECHO     Obrigatorio     : Sim.');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO   [ TESTCOMPLETE ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO     Valores aceitos : T, F.');
      vArquivoBat.Add('ECHO     Valor default   : F.');
      vArquivoBat.Add('ECHO     Obrigatorio     : Nao.');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO EXEMPLO:');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO   [ CHAMADA ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO     I:\ArquivosCopiarOutput.bat CW');
      vArquivoBat.Add('ECHO     I:\ArquivosCopiarOutput.bat CW T');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO   [ RESULTADO ]');
      vArquivoBat.Add('ECHO.');
      vArquivoBat.Add('ECHO     '+RetornaCaminhoOutPut+'\ContabMillenium\');
      vArquivoBat.Add('ECHO     '+RetornaCaminhoOutPut+'\ContabMillenium_TestComplete\');
      vArquivoBat.SaveToFile(vCaminhoBat);
    end;
  end;

begin
  vArquivoBat := nil;
  if MontaBat then
    ShellExecute(Handle, 'Open', PWideChar(vCaminhoBat), nil, PWideChar('C:'), SW_SHOWNORMAL);
  TSystemUtils.FreeAndNilDtc(vArquivoBat);
end;

procedure TFormAbreDelphiAmbientes.ExecutarEvento(ATeclaPressionada: Word);
var
  vTipoEventoExecutar : TTipoEventoExecutar;
  vTipoBin: TTipoBin;
  vCaminhoBinExecutar: PWideChar;
  vCaminhoAnsi: PAnsiChar;
  vLinkReqAdm: string;
  vNumeroReq: Texto;
  vCaminhoArquivoReqs: String;
const
  cOperacao = 'open';
begin
  if FListaTeclas.TryGetValue(ATeclaPressionada, vTipoEventoExecutar) then
  begin
    if not DelphiAberto(vTipoEventoExecutar) then
    begin
      DestacarLabel(vTipoEventoExecutar);
      case vTipoEventoExecutar of
        teeFechar:
          begin
            Self.Close;
          end;

        teeAmbienteDTC, teeAmbienteLiberacao, teeAmbienteSeparado:
          begin
            vTipoBin := TEnumeradoValores.Valor<TTipoBin>(ATeclaPressionada.ToString);
            AlterarAmbiente(vTipoBin);
          end;
        teeAbreDelphi:
          begin
            AbrirDelphi;
          end;
        teeFechaDelphi:
          begin
            ShellExecute(Handle, cOperacao, PWideChar('I:\FecharDelphi.bat'), nil, PWideChar('I:'), SW_SHOWNORMAL);
          end ;
        teeScriptLogon:
          begin
            ShellExecute(Handle, cOperacao, PWideChar('\\FileServer\Scripts\ScriptLogon.vbs'), nil, PWideChar('I:'), SW_SHOWNORMAL);
          end;
        teeDCDados:
          begin
            vCaminhoBinExecutar := PWideChar('C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\Executaveis\_Outros_Projetos\DCDados.bat');
            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, 'C:', SW_SHOWNORMAL);
            Self.Close;
          end;
        teeDCAuditoria:
          begin
            vCaminhoBinExecutar := PWideChar('C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\Executaveis\_Outros_Projetos\DCDadosAuditoria.bat');
            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, 'C:', SW_SHOWNORMAL);
            Self.Close;
          end;
        teeReabrirSend:
          begin
            ShellExecute(Handle, cOperacao, PWideChar('I:\ReabrirSend.bat'), nil, PWideChar('I:'), SW_SHOWNORMAL);
            Self.Close;
          end;
        teeSuporte:
          begin
            if PressionouShift then
              ShellExecute(Handle, cOperacao, PWideChar('\\FileServer\Scripts\-SUPORTE.vbs'), PWideChar('PAR'), PWideChar(''), SW_SHOWNORMAL)
            else
              ShellExecute(Handle, cOperacao, PWideChar('\\FileServer\Scripts\-SUPORTE.vbs'), nil, PWideChar(''), SW_SHOWNORMAL);

            Self.Close;
          end;
        teeTestcomplete:
        begin
          begin
            if not TestCompleteAberto then
              ShellExecute(Handle, cOperacao, PWideChar('C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\TestComplete\IDE\Abrir_IDE.bat'), nil, PWideChar('C:'), SW_SHOWNORMAL)
            else
              ShellExecute(Handle, cOperacao, PWideChar('C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\TestComplete\IDE\Liberar_IDE.bat'), nil, PWideChar('C:'), SW_SHOWNORMAL);

            Self.Close;
          end;
        end;
        teeLibDelphi:
          begin
            if PressionouShift then
              vCaminhoBinExecutar := PWideChar(RetornaCaminhoAtalhosIDE+'LibDelphi com Delphi.bat')
            else
              vCaminhoBinExecutar := PWideChar(RetornaCaminhoAtalhosIDE+'LibDelphi.bat');

            //ShowMessage(vCaminhoBinExecutar);

            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, PWideChar('C:'), SW_SHOWNORMAL);
          end;
        teeLibDelphiCompleto:
          begin
            if PressionouShift then
              vCaminhoBinExecutar := PWideChar(RetornaCaminhoAtalhosIDE+'LibDelphiCompleto com Delphi.bat')
            else
              vCaminhoBinExecutar := PWideChar(RetornaCaminhoAtalhosIDE+'LibDelphiCompleto.bat');

            //ShowMessage(vCaminhoBinExecutar);

            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, PWideChar('C:'), SW_SHOWNORMAL);
          end;
        teeLimparOutput:
          begin
            LimparOutput;
          end;
        teeCopiaOutPut:
          begin
            CopiaArquivosOutPut;
          end;
        teeLibDelphiImagens:
          begin
            vCaminhoBinExecutar := PWideChar(RetornaCaminhoAtalhosIDE+'LibDelphi_Imagens.bat');
            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, PWideChar('C:'), SW_SHOWNORMAL);
          end;
        teePersonalizador:
          begin
            ShellExecute(Handle, cOperacao, PWideChar('t:\--ENCRIP.ALL\Personalizador.exe'), nil, PWideChar(''), SW_SHOWNORMAL);
          end;
        teePrioridadesNucleo:
          begin
            if PressionouShift then
              ShellExecute(Handle, cOperacao, PWideChar('R:\NUCLEO FISCAL\Cronogramas\Prioridades Nucleo Fiscal.xlsx'), nil, PWideChar(''), SW_SHOWNORMAL)
            else if PressionouCtrl then
              ShellExecute(Handle, cOperacao, PWideChar('https://adm.datacempro.com.br/Qualidade/Kanban/Compartilhado?nucleo=202877&projeto=18024027'), nil, PWideChar(''), SW_SHOWNORMAL)
            else
              ShellExecute(Handle, cOperacao, PWideChar('https://adm.datacempro.com.br/Qualidade/Kanban/Compartilhado?nucleo=202877&projeto=17995188'), nil, PWideChar(''), SW_SHOWNORMAL);
          end;
       teeUpdate:
         begin
           vCaminhoAnsi := PAnsiChar(AnsiString('C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe /command:update /path:"C:\'+FLocalBinSelecionado+'\Delphi" /logmsg:"" /closeonend:0'));
           WinExec(vCaminhoAnsi, SW_NORMAL);
         end;
       teeCommit:
         begin
           vCaminhoAnsi := PAnsiChar(AnsiString('C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe /command:commit /path:"C:\'+FLocalBinSelecionado+'\Delphi" /logmsg:"" /closeonend:0'));
           WinExec(vCaminhoAnsi, SW_NORMAL);
         end;
       teeTestaDCCOmparaEstrutura:
         begin
            vCaminhoBinExecutar := PWideChar('C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\Executaveis\TestesUnitarios\TestaDCComparaEstruturas.bat');
            ShellExecute(Handle, cOperacao, vCaminhoBinExecutar, nil, 'C:', SW_SHOWNORMAL);
            Self.Close;
         end;

       teeCheckForModification:
         begin
            vCaminhoAnsi := PAnsiChar(AnsiString('C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe /command:repostatus /path:"C:\'+FLocalBinSelecionado+'\Delphi" /logmsg:"" /closeonend:0'));
            WinExec(vCaminhoAnsi, SW_NORMAL);
         end;

       teeTypeScanner:
         begin
           PanelEmTesteDTC.Visible     := not PanelEmTesteDTC.Visible;
           LabelTypeScanner.Caption    := TSystemUtils.Iif(PanelEmTesteDTC.Visible, 'K - TypeScanner', 'K - TypeScanner (Habilitado)');
           Self.Height                 := TSystemUtils.Iif(PanelEmTesteDTC.Visible, Self.Height - (18 * 4), Self.Height + (18 * 4));

           LabelTypeScanner.Font.Color := TSystemUtils.IifGeneric<TColor>(not PanelEmTesteDTC.Visible, clRed, clLime);
           Self.FormStyle              := TSystemUtils.IifGeneric<TFormStyle>(PanelEmTesteDTC.Visible, fsNormal, fsStayOnTop);

           Labeljanela.Visible         := not PanelEmTesteDTC.Visible;
           LabelNomeClasse.Visible     := not PanelEmTesteDTC.Visible;
           LabelClassComponent.Visible := not PanelEmTesteDTC.Visible;

           TimerTypeScanner.Enabled    := not PanelEmTesteDTC.Visible;
         end;

       teeAbrirRequisicao:
         begin
           vNumeroReq := InputBox('Manutenção de Requisição ADM', 'Digite o número da requisição:', '');

           if not vNumeroReq.Vazio then
           begin
             if vNumeroReq <> vNumeroReq.SomenteNumeros then
               TDtcForms.MessageDtc('Digite apenas números')
             else
             begin

               if ((PressionouShift) or (PressionouCtrl)) then
               begin
                 vCaminhoArquivoReqs := Format('Q:\Arquivos para Requisicoes\%s', [vNumeroReq.ToString]);
                 if DirectoryExists(AnsiString(vCaminhoArquivoReqs)) then
                   ShellExecute(Handle, cOperacao, PWideChar(vCaminhoArquivoReqs), nil, 'Q:', SW_SHOWNORMAL);
               end;

               if not PressionouCtrl then
               begin
                 vLinkReqAdm := Format('https://adm.datacempro.com.br/Requisicoes/Home/Compartilhado/%s', [vNumeroReq.ToString]);
                 ShellExecute(Handle, cOperacao, PWideChar(vLinkReqAdm), nil, PWideChar(''), SW_SHOWNORMAL);
               end;
             end;

             Self.Close;
           end;
         end;
      end;
      //if PressionouShift and (vTipoEventoExecutar <> teeLimparOutput) then

      if PressionouShift and not (vTipoEventoExecutar in [teeLimparOutput, teePrioridadesNucleo]) then
        Self.Close;
    end
  end
end;

procedure TFormAbreDelphiAmbientes.FormShow(Sender: TObject);
var
  vValorVariavelEmTesteDTC: string;
begin
  ConsultarVariavelDelphiSVN;
  TimerBinAtual.Enabled := True;

  vValorVariavelEmTesteDTC := TStringManipulacao.PrimeiraLetraMaiuscula(TSystemUtils.ConteudoVariavelAmbiente(cVariavelEmTesteDTC));

  PanelEmTesteDTC.Caption := cCaptionEmTesteDTC+vValorVariavelEmTesteDTC;

  PanelEmTesteDTC.Font.Color := clYellow;
  if UpperCase(vValorVariavelEmTesteDTC) <> UpperCase(cValorVariavelEmTesteDTC) then
    PanelEmTesteDTC.Font.Color := clFuchsia;
end;

procedure TFormAbreDelphiAmbientes.LimparOutput;
var
  vQdtPastas : Integer;
  vArquivoBat: TStrings;
  vPastaSistema: string;
  vInd: Integer;
  vListaPastasNaoExcluir: TStrings;
  vCaminhoPastaBat : string;
begin
  vArquivoBat := nil;
  vListaPastasNaoExcluir := TStringList.Create;

  vListaPastasNaoExcluir.Add('Lib');
  vListaPastasNaoExcluir.Add('LibTerceiros');
  vListaPastasNaoExcluir.Add('LibTerceirosRuntime');
  vListaPastasNaoExcluir.Add('LibRuntime');
  vCaminhoPastaBat := RetornaCaminhoBat(cArquivoLimparOutput);

  vArquivoBat := TStringList.Create;
  vArquivoBat.Add('@Echo OFF');
  vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\*.exe');
  vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\*.map');
  vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\*.rsm');

  DirectoryListBoxLimpaOutput.Directory := RetornaCaminhoOutPut;

  //ShowMessage(DirectoryListBoxLimpaOutput.Directory);

  vQdtPastas := TStringManipulacao.OcorrenciasString(DirectoryListBoxLimpaOutput.Directory, '\') + 1;

  for vInd := vQdtPastas to DirectoryListBoxLimpaOutput.Count-1 do
  begin
    vPastaSistema := DirectoryListBoxLimpaOutput.Items.Strings[vInd];

    if PressionouShift or (vListaPastasNaoExcluir.IndexOf(vPastaSistema) = -1) then
    begin
      if Pos('_TestComplete', vPastaSistema) > 0 then
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.*')
      else
      begin
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.dcu');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.bpl');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.dfm');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.res');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.rc');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.base.dcp');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.dados.dcp');
        vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.acao.dcp');

        if (vListaPastasNaoExcluir.IndexOf(vPastaSistema) >= 0) then
        begin
          vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.dcp');
          vArquivoBat.Add('del /s /q '+RetornaCaminhoOutPut+'\'+vPastaSistema+'\*.dcr');
        end;

      end;
    end;
  end;
  if FileExists(vCaminhoPastaBat) then
    DeleteFile(vCaminhoPastaBat);

  vArquivoBat.SaveToFile(vCaminhoPastaBat);
  ShellExecute(Handle, 'Open', PWideChar(vCaminhoPastaBat), nil, PWideChar('C:'), SW_SHOWNORMAL);

  TSystemUtils.FreeAndNilDtc(vArquivoBat);
  TSystemUtils.FreeAndNilDtc(vListaPastasNaoExcluir);
end;

function TFormAbreDelphiAmbientes.PressionouCtrl: Boolean;
begin
  Result := FShiftState = [ssCtrl];
end;

function TFormAbreDelphiAmbientes.PressionouShift: Boolean;
begin
  Result := FShiftState = [ssShift];
end;

function TFormAbreDelphiAmbientes.ProgramaRodando(ANomeProcesso: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ANomeProcesso)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ANomeProcesso))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
end;

function TFormAbreDelphiAmbientes.RetornaCaminhoAtalhosIDE: string;
begin
  Result := 'C:\'+FLocalBinSelecionado+'\Delphi\Atalhos\IDE\';
end;

function TFormAbreDelphiAmbientes.RetornaCaminhoBat(ANomeArquivoBat: string): string;
begin
  Result := ExtractFilePath(Application.ExeName)+ANomeArquivoBat;
end;

function TFormAbreDelphiAmbientes.RetornaCaminhoOutPut: string;
begin
  Result := 'C:\'+FLocalBinSelecionado+'\Delphi\OutPut';
end;

procedure TFormAbreDelphiAmbientes.TimerDelphiAbertoTimer(Sender: TObject);
begin
  VerificarDelphiAberto;
end;

procedure TFormAbreDelphiAmbientes.TimerBinAtualTimer(Sender: TObject);
var
  vLabel: TLabel;
begin
  vLabel := nil;

  case FTipoBinSelecionado of
    tbDTC       : vLabel := LabelA;
    tbLiberacao : vLabel := LabelB;
    tbSeparado  : vLabel := LabelC;
  end;
  if vLabel.Font.Color = clRed then
    vLabel.Font.Color := clLime
  else
    vLabel.Font.Color := clRed;

  vLabel.Font.Style := [fsBold];
  vLabel.Update;
end;

procedure TFormAbreDelphiAmbientes.TimerDestacarAtalhoTimer(Sender: TObject);
begin
  FLabelDestacado.Font.Size := 13;
  FLabelDestacado.Font.Color := clLime;
  FLabelDestacado.Update;
  TimerDestacarAtalho.Enabled := False;
end;

procedure TFormAbreDelphiAmbientes.TimerTypeScannerTimer(Sender: TObject);
begin
  TypeScanner(Self);
end;

procedure TFormAbreDelphiAmbientes.TypeScanner(Sender: TObject);
var
  H, hWnd: THandle;
  CrPos: TPoint;
  nomejanela,
  nomeclasse, ClassName,
  nomeobjeto,
  senha: array[0..255] of Char;
  vAux: String;
begin
  try
    GetCursorPos(CrPos); // Identifica a posicao do mouse
    hWnd := WindowFromPoint(CrPos); // Pega o Handle do controle na posição do mouse
    H := GetForegroundWindow;

    if H <> 0 then
    begin
      GetClassName(H, ClassName, SizeOf(ClassName));
    end;

    if hwnd <> 0 then
    begin

      //preenche o conteúdo do vetor com char zeros
      FillChar(nomejanela, 255, #0);
      FillChar(nomeclasse, 255, #0);
      FillChar(nomeobjeto, 255, #0);

      //pega o nome da janela
      GetWindowText(hWnd, NomeJanela, 255);
      //pega o nome da classe
      GetClassName(hWnd, nomeclasse, 255);

      //GetProp()
      GetClassName(hWnd, nomeclasse, 255);

      //manda uma mensagem para o handle da janela
      //perguntando se ele possui um password char
      if SendMessage(hWnd, EM_GETPASSWORDCHAR, 0, 0) <> 0 then
      begin
        FillChar(senha, 255, #0);
        //Caso positivo manda a mensagem WM_GETTEXT
        SendMessage(hWnd, WM_GETTEXT, 255, integer(@senha)); //o integer aqui faz com que o parâmetro seja passado como ponteiro em vez de vetor
        //lbSenha.Caption := string(senha);
        //Caso positivo seta o passwordchar para #0
        //o problema de fazer isso é que vai entrar uma vez só no if
        SendMessage(hWnd, EM_SETPASSWORDCHAR, Ord('?'), 0);
      end;

      //preenche os campos
      Labeljanela.Caption := string(nomejanela);

      vAux := string(nomeclasse);
      if(UpperCase(vAux[1]) = 'T')then
        vAux := Copy(vAux, 2,Length(vAux))
      else
        vAux := Copy(vAux, 1,Length(vAux));

      LabelNomeClasse.Caption := String(ClassName);

      LabelClassComponent.Caption := vAux;
    end;

  except
  end;
end;

procedure TFormAbreDelphiAmbientes.VerificarDelphiAberto;
begin
  if DelphiRodando then
  begin
    LabelDelphiAberto.Height      := 20;
    LabelDelphiAberto.Margins.Top := 10;
    Label7.Height                 := 0;
    Label7.Margins.Top            := 0;
  end
  else
  begin
    LabelDelphiAberto.Height      := 0;
    LabelDelphiAberto.Margins.Top := 0;
    Label7.Height                 := 20;
    Label7.Margins.Top            := 10;
  end;
end;

end.

