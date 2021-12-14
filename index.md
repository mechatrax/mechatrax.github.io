Raspbian Stretch または Buster では次のいずれかの方法でリポジトリの追加が可能です。
<br />

**スクリプトをダウンロードして実行する場合**  
次のコマンドを実行してください。
```
curl https://mechatrax.github.io/setup.sh | sudo bash
```

**個別に設定を行う場合**  
次の手順に従って設定を行ってください。  

a: Buster の場合  
a-1: apt-lineを追加してください。  
```
deb http://mechatrax.github.io/raspbian/ buster main contrib non-free
```
a-2: 署名の公開鍵を追加してください。  
```
curl https://mechatrax.github.io/raspbian/mechatrax.gpg.key | sudo apt-key add -
```

b: Bullseye の場合  
b-1: apt-lineを追加してください。  
```
deb [signed-by=/usr/share/keyrings/mechatrax-archive-keyring.gpg] http://mechatrax.github.io/raspbian bullseye main contrib non-free soracom
```
b-2: 署名の公開鍵を追加してください。  
```
curl https://mechatrax.github.io/raspbian/mechatrax.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/mechatrax-archive-keyring.gpg
```
必要であれば、公開鍵の整合性を確認してください。  
mechatrax.gpg.key の SHA256 ハッシュ値は下記になります。  

`2b69c52e21e17a93ad5e1e5a09d3847b34ad74207dc9876e91e75d5b8a808211`
