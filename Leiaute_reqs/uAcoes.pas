unit uAcoes;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, uConstante, inifiles, Vcl.Forms, dxSkinsCore,
  dxSkin_DC_Amarelo, dxSkin_DC_Azul, dxSkin_DC_Laranja, dxSkin_DC_Roxo,
  dxSkin_DC_Verde, dxSkinsDefaultPainters, cxClasses, cxLookAndFeels,
  dxSkinsForm, Winapi.TlHelp32;

type
//  TAcoes = class(TObject)
  TAcoes = class

    private
     { private declarations }

//    protected
     { protected declarations }
    public
     { public declarations }
    procedure WinV;
    procedure GravaNome(const ANome: String);
    procedure GravaOpcaoTipoTexto(const AOpcaoTipoTexto: Integer);
    procedure GravaOpcaoPosicaoTexto(const ApOpcaoPosicaoTexto: Integer);
    procedure GravaOpcaoFormatoData(const AOpcaoTipoFormatoData: Integer);
    procedure GravaOpcaoCor(const AColor: integer);
    procedure GravaSkinName(const ASkinName: Integer);
    function GetNomeComputador : String;
    function GetDataFormatada : String;
    function LerNomeConfigurado : String;
    function LerOpcaoTipoTexto : Integer;
    function LerOpcaoPosicaoTexto : Integer;
    function LerOpcaoFormatoData : Integer;
    function LerOpcaoCor : Integer;
    function LerSkinName : TdxSkinName;
    function LerSkinIndex : integer;
    function TextoDaObservacao(const AText, AData, ANome: String) : String;
    function RemoveAcento(const AText: String) : String;
    function ArquivoIni : TIniFile;
    function ProgramaRodando(ANomeProcesso: string): Boolean;

//    published
     { published declarations }
    end;

implementation

{ TAcoes }

function TAcoes.GetDataFormatada: String;
begin
  case LerOpcaoFormatoData of
    0: Result := FormatDateTime(cArrayFormatoData[0], Now);
    1: Result := FormatDateTime(cArrayFormatoData[1], Now);
  end;
end;

function TAcoes.GetNomeComputador: String;
const
  cBuff_Size = MAX_COMPUTERNAME_LENGTH + 1;
var
  lpBuffer : PChar;
  nSize : DWord;
begin
  nSize    := cBuff_Size;
  lpBuffer := StrAlloc(cBuff_Size);
  GetComputerName(lpBuffer, nSize);
  Result   := String(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TAcoes.GravaNome(const ANome: String);
begin
  ArquivoIni.WriteString(cConfig, cNome, UpperCase(RemoveAcento(ANome)));
end;

procedure TAcoes.GravaOpcaoCor(const AColor: integer);
begin
  ArquivoIni.WriteString(cConfig, cColor, IntToStr(AColor));
end;

procedure TAcoes.GravaOpcaoFormatoData(const AOpcaoTipoFormatoData: Integer);
begin
  ArquivoIni.WriteString(cConfig, cData, IntToStr(AOpcaoTipoFormatoData));
end;

procedure TAcoes.GravaOpcaoPosicaoTexto(const ApOpcaoPosicaoTexto: Integer);
begin
  ArquivoIni.WriteString(cConfig, cPosicao, IntToStr(ApOpcaoPosicaoTexto));
end;

procedure TAcoes.GravaOpcaoTipoTexto(const AOpcaoTipoTexto: Integer);
begin
  ArquivoIni.WriteString(cConfig, cTipo, IntToStr(AOpcaoTipoTexto));
end;

procedure TAcoes.GravaSkinName(const ASkinName: Integer);
begin
  ArquivoIni.WriteString(cConfig, cSkinName, IntToStr(ASkinName));
end;

function TAcoes.ArquivoIni: TIniFile;
begin
  Result := TIniFile.Create(ExtractFilePath(Application.ExeName) + cArquivoConfig);
end;

function TAcoes.LerSkinIndex: integer;
begin
  if not ArquivoIni.ValueExists(cConfig, cSkinName) then
    GravaSkinName(1);
  Result := StrToInt(ArquivoIni.ReadString(cConfig, cSkinName, ''))
end;

function TAcoes.LerNomeConfigurado: String;
begin
  if not ArquivoIni.ValueExists(cConfig, cNome) then
    GravaNome(GetNomeComputador);
  Result := UpperCase(RemoveAcento(ArquivoIni.ReadString(cConfig, cNome, '')));
end;

function TAcoes.LerOpcaoCor: Integer;
begin
  if not ArquivoIni.ValueExists(cConfig, cColor) then
    GravaOpcaoCor(0);
  Result := StrToInt(ArquivoIni.ReadString(cConfig, cColor, ''));
end;

function TAcoes.LerOpcaoFormatoData: Integer;
begin
  if not ArquivoIni.ValueExists(cConfig, cData) then
    GravaOpcaoFormatoData(0);
  Result := StrToInt(ArquivoIni.ReadString(cConfig, cData, ''));
end;

function TAcoes.LerOpcaoPosicaoTexto: Integer;
begin
  if not ArquivoIni.ValueExists(cConfig, cPosicao) then
    GravaOpcaoPosicaoTexto(0);
  Result := StrToInt(ArquivoIni.ReadString(cConfig, cPosicao, ''));
end;

function TAcoes.LerOpcaoTipoTexto: Integer;
begin
  if not ArquivoIni.ValueExists(cConfig, cTipo) then
    GravaOpcaoPosicaoTexto(0);
  Result := StrToInt(ArquivoIni.ReadString(cConfig, cTipo, ''));
end;

function TAcoes.LerSkinName: TdxSkinName;
begin
  if not ArquivoIni.ValueExists(cConfig, cSkinName) then
    GravaSkinName(1);

  Result := cSkinAzul;

  case StrToInt(ArquivoIni.ReadString(cConfig, cSkinName, '')) of
    0:
      Result := cSkinAmarelo;
    1:
      Result := cSkinAzul;
    2:
      Result := cSkinLaranja;
    3:
      Result := cSkinRoxo;
    4:
      Result := cSkinVerde;
  end
end;

function TAcoes.ProgramaRodando(ANomeProcesso: string): Boolean;
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

function TAcoes.RemoveAcento(const AText: String): String;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(AText));
end;

function TAcoes.TextoDaObservacao(const AText, AData, ANome: String): String;
begin
  Result := '[' + AData + ']' + ' ' + ANome + ': ' + AText;
end;

procedure TAcoes.WinV;
begin
  { Mantém pressionada a tecla WINDOWS }
  keybd_event(VK_LWIN, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);

  { Pressiona a tecla V }
  keybd_event($56, 0, 0, 0);

  { Libera (solta) a tecla WINDOWS }
  keybd_event(VK_LWIN, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
end;

end.
