Raspberry Pi OS Bullseye または Bookworm では次のいずれかの方法でリポジトリの追加が可能です。
<br />

**スクリプトをダウンロードして実行する場合**  
次のコマンドを実行してください。
```
curl https://mechatrax.github.io/setup.sh | sudo bash
```

**個別に設定を行う場合**  
次の手順に従って設定を行ってください。  

1: apt リポジトリを追加してください。  
```
bash -c 'source /etc/os-release && echo "deb [signed-by=/usr/share/keyrings/mechatrax-archive-keyring.gpg] http://mechatrax.github.io/raspbian $VERSION_CODENAME main soracom" | sudo tee /etc/apt/sources.list.d/mechatrax.list'
```

2: 署名の公開鍵を追加してください。  
```
curl https://mechatrax.github.io/raspbian/mechatrax.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/mechatrax-archive-keyring.gpg
```

必要であれば、公開鍵の整合性を確認してください。  
mechatrax.gpg.key の SHA256 ハッシュ値は下記になります。  

`b44e1420e74edea071d49164206508e013e9837381d4eec6fbc27811ce7f4255`
