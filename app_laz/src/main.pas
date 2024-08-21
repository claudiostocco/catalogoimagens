unit main;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, StdCtrls, Grids, Generics.Collections;

type

  { TPedidoItem }

  TPedidoItem = class
    id: Integer;
    url: String;
    qtd: Double;
    preco: Currency;
    constructor Create(Aid: Integer; Aurl: String; Aqtd, Apreco: Currency);
  end;

  { TForm1 }

  TForm1 = class(TForm)
    bbAbrirPasta: TBitBtn;
    bbProximo: TBitBtn;
    bbVoltar: TBitBtn;
    bSalvarPedido: TButton;
    bAbrirPedido: TButton;
    edValor: TLabeledEdit;
    Image: TImage;
    edQtd: TLabeledEdit;
    lbId: TLabel;
    Panel2: TPanel;
    pnItens: TPanel;
    pcCatalogo: TPageControl;
    Panel1: TPanel;
    pnTotal: TPanel;
    sdDialog: TSelectDirectoryDialog;
    tsPedido: TTabSheet;
    tsCatalog: TTabSheet;
    procedure bbAbrirPastaClick(Sender: TObject);
    procedure bbProximoClick(Sender: TObject);
    procedure bbVoltarClick(Sender: TObject);
    procedure bSalvarPedidoClick(Sender: TObject);
    procedure edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdKeyPress(Sender: TObject; var Key: char);
    procedure edValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edValorKeyPress(Sender: TObject; var Key: char);
    procedure tsPedidoShow(Sender: TObject);
  private
    Itens: TList<TPedidoItem>;
    itemAtual: Integer;
    procedure setItemPedido(id: Integer);
    procedure setValorItemPedido(id: Integer; qtd: Double; preco: Currency);
    procedure setImage(url: String);
    procedure TemProximo(i: Integer);
    function TotalPedido: Currency;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TPedidoItem }

constructor TPedidoItem.Create(Aid: Integer; Aurl: String; Aqtd, Apreco: Currency);
begin
  id := Aid;
  url := Aurl;
  qtd := Aqtd;
  preco := Apreco;
end;

{ TForm1 }

procedure TForm1.edQtdKeyPress(Sender: TObject; var Key: char);
begin
  if not CharInSet(Key, ['0'..'9',#8]) then Key := #0;
end;

procedure TForm1.edValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 38 then edQtd.SetFocus;
  if Key = 13 then
    bbProximo.Click;
end;

procedure TForm1.bbAbrirPastaClick(Sender: TObject);
var i: Integer;
    result: LongInt;
    arq: TRawbyteSearchRec;
begin
  if sdDialog.Execute then
  begin
    Itens := TList<TPedidoItem>.Create();
    result := FindFirst(sdDialog.FileName+'/*.*',faArchive,arq);
    if arq.Name = '' then
    begin
      ShowMessage('Não há arquivos!');
      Exit;
    end;
    i := -1;
    repeat
      Inc(i);
      Itens.Add(TPedidoItem.Create(i,sdDialog.FileName+'/'+arq.Name,1,0));
      result := FindNext(arq);
    until (arq.Name = '') or (result < 0);

    pnItens.Caption := Format('Itens: %.4d',[Itens.Count]);
    if Itens.Count > 0 then
    begin
      setItemPedido(0);
      pnTotal.Caption := Format('Total: %8.2f',[0.0]);
    end;
  end;
end;

procedure TForm1.bbProximoClick(Sender: TObject);
var
  qtd: Double;
  preco: Currency;
begin
  if TryStrToFloat(edQtd.Text,qtd) and TryStrToCurr(edValor.Text,preco) then
  begin
    (* Aplica os valores ao pedido atual *)
    setValorItemPedido(itemAtual,qtd,preco);
    pnTotal.Caption := Format('Total: %8.2f',[TotalPedido]);
  end;
  (* Seleciona próximo item *)
  TemProximo(itemAtual + 1);
  if bbProximo.Enabled then
     setItemPedido(itemAtual + 1);
end;

procedure TForm1.bbVoltarClick(Sender: TObject);
begin
  (* Seleciona próximo item *)
  setItemPedido(itemAtual - 1);
end;

procedure TForm1.bSalvarPedidoClick(Sender: TObject);
var sl: TStringList;
    i: Integer;
    item: TPedidoItem;
begin
  sl := TStringList.Create;
  for i := 0 to Itens.Count - 1 do
  begin
    item := Itens.Items[i];
    //Result := Result + item.qtd * item.preco;
  end;

  //sdDialog.FileName
end;

procedure TForm1.edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) or (Key = 40) then edValor.SetFocus;
end;

procedure TForm1.edValorKeyPress(Sender: TObject; var Key: char);
begin
  if Key = FormatSettings.ThousandSeparator then Key := FormatSettings.DecimalSeparator;
  if not CharInSet(Key, ['0'..'9',#8,FormatSettings.DecimalSeparator]) then Key := #0;
end;

procedure TForm1.tsPedidoShow(Sender: TObject);
var
  item: TPedidoItem;
  i: Integer;
begin
  for i := 0 to Itens.Count - 1 do
  begin
    item := Itens.Items[i];
  end;
end;

procedure TForm1.setItemPedido(id: Integer);
var item: TPedidoItem;
begin
  item := Itens.Items[id];
  setImage(item.url);
  edQtd.Text := item.qtd.ToString;
  edValor.Text := Format('%1.2f',[item.preco]);
  lbId.Caption := Format('ID: %.3d',[item.id+1]);
  itemAtual := id;
  edValor.SetFocus;
  //edQtd.SetFocus;
end;

procedure TForm1.setValorItemPedido(id: Integer; qtd: Double; preco: Currency);
var item: TPedidoItem;
begin
  item := Itens.Items[id];
  item.qtd := qtd;
  item.preco := preco;
end;

procedure TForm1.setImage(url: String);
begin
  Image.Picture.LoadFromFile(url);
end;

procedure TForm1.TemProximo(i: Integer);
begin
  bbProximo.Enabled := Itens.Count > i;
end;

function TForm1.TotalPedido: Currency;
var i: Integer;
    item: TPedidoItem;
begin
  Result := 0;
  for i := 0 to Itens.Count - 1 do
  begin
    item := Itens.Items[i];
    Result := Result + item.qtd * item.preco;
  end;
end;

end.

