Raspbian Stretch または Buster では次のいずれかの方法でリポジトリの追加が可能です。
<br />

**スクリプトをダウンロードして実行する場合**  
次のコマンドを実行してください。
```
curl https://mechatrax.github.io/setup.sh | sudo bash
```

**個別に設定を行う場合**  
次の手順に従って設定を行ってください。  

1: apt-line を追加してください。  

1-a: Stretch の apt-line  
```
deb http://mechatrax.github.io/raspbian/ stretch main contrib non-free
deb http://mechatrax.github.io/raspbian/ stretch-backports main contrib non-free
```

1-b: Buster の apt-line  
```
deb http://mechatrax.github.io/raspbian/ buster main contrib non-free
```
1-c: Bullseye の apt-line
```
deb http://mechatrax.github.io/raspbian/ bullseye main contrib non-free
```
2: 署名の公開鍵を追加してください。  
```
wget https://mechatrax.github.io/raspbian/mechatrax.gpg.key
sudo cp mechatrax.gpg.key /etc/apt/trusted.gpg.d/
```
必要であれば、公開鍵の整合性を確認してください。  
mechatrax.gpg.key の SHA256 ハッシュ値は下記になります。
`2b69c52e21e17a93ad5e1e5a09d3847b34ad74207dc9876e91e75d5b8a808211`
