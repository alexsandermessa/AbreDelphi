unit uFormHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pForm, System.ImageList, Vcl.ImgList,
  cxClasses, cxLookAndFeels, dxSkinsForm, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormHistorico = class(TFormSistema)
    MemoHistorico: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistorico: TFormHistorico;

implementation

{$R *.dfm}

end.
