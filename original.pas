  try
    CoInitialize(nil);
    URL := 'http://pastebin.com/raw/xxxxxx';
    dados := nil;
    dados := TStringList.Create;
    res1 := nil;
    res1 := TStringList.Create;
    res2 := nil;
    res2 := TStringList.Create;
    rel := nil;
    rel := TStringList.Create;
    http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    http.open('GET', URL, false);
    http.send;
    usuarios := http.responsetext;
    dados.Text := usuarios;
    dados.Text := StringReplace(dados.Text, '&quot;', '"',
    [rfReplaceAll, rfIgnoreCase]);
    res1.Add(dados.Text);
    res2.Add(ExtractText(res1.Strings[0], 'start', 'end'));
    jsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes
    (res2.Text), 0) as TJSONObject;
    jv_Host := jsonObj.Get('host').JsonValue;
    Address := trim(vDecript(jv_Host.Value));
    }
    CoUninitialize;
  except
end;
