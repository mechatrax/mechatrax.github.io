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

2: 署名鍵を追加してください。  
```
curl https://mechatrax.github.io/raspbian/mechatrax.gpg.key | sudo apt-key add -
```
