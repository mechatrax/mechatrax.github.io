Raspbian Stretch では次のいずれかの方法でリポジトリの追加が可能です。
<br />

**スクリプトをダウンロードして実行する場合**  
次のコマンドを実行してください。
```
curl https://mechatrax.github.io/setup-stretch.sh | sudo bash
```

**個別に設定を行う場合**  
次の手順に従って設定を行ってください。  

1: 次の apt-line を追加してください。
```
deb http://mechatrax.github.io/raspbian/ stretch main contrib non-free
deb http://mechatrax.github.io/raspbian/ stretch-backports main contrib non-free
```

2: 署名鍵のパッケージを次の URL からダウンロードしてインストールしてください。
```
http://mechatrax.github.io/raspbian/pool/main/m/mechatrax-archive-keyring/mechatrax-archive-keyring_2016.12.19.1_all.deb
```

mechatrax-archive-keyring_2016.12.19_all.deb のハッシュは次のとおりです。  

| アルゴリズム | ハッシュ値 |  
|:--|:--|  
| MD5 | 3a3d53bcc36dee4537392a688c95380f |  
| SHA1 | 99d30c5d995466691381e59c94b59bb78cfd1c1c |  
| SHA256 | dacbee6e2f4db3e4b41e5e909ce9360f5456af56190205df5d363a8989dac005 |  
