Raspberry Pi OS Bookworm または Trixie では次のいずれかの方法でリポジトリの追加が可能です。
<br />
Trixie では arm64 対応パッケージのみインストール可能です。  
<br />

**スクリプトをダウンロードして実行する場合**  
次のコマンドを実行してください。
```
sudo sh -c 'curl -fsSL https://mechatrax.github.io/setup.sh | bash'
```

**個別に設定を行う場合**  
次のコマンドを実行してください。  
```
bash -c 'source /etc/os-release; cat << EOF | sudo tee /etc/apt/sources.list.d/mechatrax.sources
Types: deb
URIs: http://mechatrax.github.io/raspbian/
Suites: $VERSION_CODENAME
Components: main soracom
Signed-By:
  -----BEGIN PGP PUBLIC KEY BLOCK-----
  .
  mDMEZHgt7hYJKwYBBAHaRw8BAQdAEUiE3FxXVU3s1lMaCkOYi5IjKYN8XUU9DQ8T
  XtJRIbW0Sk1lY2hhVHJhY2tzIENvLiwgTHRkLiAoTWVjaGF0cmF4IEFyY2hpdmUg
  U2lnbmluZyBLZXkpIDxpbmZvQG1lY2hhdHJheC5jb20+iJAEExYIADgWIQS3SfsI
  gf5OQUB4t27Vk0v6ESUIOQUCZHgt7gIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIX
  gAAKCRDVk0v6ESUIOTxJAQCA7wW3ZUuQOZIevI96buyraAIKPKpaFB/6WUxqvR6d
  ZgEAnHsJhzu+nm1JIldPfy42TNQU7AZJHDrhD2m1mG1zRwQ=
  =a674
  -----END PGP PUBLIC KEY BLOCK-----
EOF'
```
