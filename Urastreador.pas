unit Urastreador;

{   / )|                                 |( \
   / / |           Charles Silva         | \ \
 _( (_ |   _ [www.charlessilva.com.br]  _  | _) )_
(((\ \)|_/ )___________________________( \_|(/ /)))
(\\\\ \_/ /                             \ \_/ ////)
 \       /                               \       /
  \    _/                                 \_    /
  /   /                                     \   \


Autor   : Charles Silva (suporte@charlessilva.com.br)
Linguagen : Delphi 2007 (Object Pascal)
twitter: http://twitter.com/charlessilva_
GitHub: https://github.com/silvacharles
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, StdCtrls,Wininet, Buttons, WinSkinData, AutoUpdate;

type
  TFrastreador = class(TForm)
    GroupBox1: TGroupBox;
    Enac: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Eint: TEdit;
    SpeedButton2: TSpeedButton;
    SkinData1: TSkinData;
    AutoUpdate: TAutoUpdate;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AutoUpdateNeedDeploy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frastreador: TFrastreador;

implementation

{$R *.dfm}

Procedure OpenInternetExplorer( sURL : string );
const
 csOLEObjName = 'InternetExplorer.Application';
var
 IE : Variant;WinHanlde : HWnd;
begin
 if( VarIsEmpty( IE ) )then
  begin
   IE := CreateOleObject( csOLEObjName );
   IE.Visible := true;
   IE.Navigate( sURL );
  end
 else
  begin
   WinHanlde := FindWIndow( 'IEFrame', nil );
    if( 0 <> WinHanlde )then
     begin
      IE.Navigate( sURL );
      SetForegroundWindow( WinHanlde );
     end
    else
     begin
      Showmessage('Ocorreu um erro não informado!');
     end;
  end;
end;

procedure TFrastreador.AutoUpdateNeedDeploy(Sender: TObject);
begin
AutoUpdate.Deploy;
end;

procedure TFrastreador.FormShow(Sender: TObject);
var
  Flags: DWORD;
begin
{Se estiver conectado á Internet Verifica
se tem atualização do Programa}
if  InternetGetConnectedState(@Flags, 0) then
begin
AutoUpdate.Compact := True;
AutoUpdate.OptionalUpdate:=True;
AutoUpdate.AutoNeedVersionControl:=True;
AutoUpdate.Execute;
end;
end;

procedure TFrastreador.SpeedButton1Click(Sender: TObject);
begin
 if (enac.Text = '') and (eint.Text = '') then
  begin
   showmessage('Favor digitar um código de rastreamento!');
   abort;
   enac.SetFocus;
  end;
 if enac.Text <> '' then
  begin
   OpenInternetExplorer('http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI='+enac.Text);
   enac.Clear;
   enac.SetFocus;
  end;
 if eint.Text <> '' then
  begin
   OpenInternetExplorer('http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_COD_UNI='+eint.Text+'&P_TIPO=001&P_LINGUA=001');
   eint.Clear;
   enac.SetFocus;
  end;
end;

procedure TFrastreador.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
