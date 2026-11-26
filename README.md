reaction_man

Slackの書き込みにとにかく好リアクションをするボットです。  
Slackの設定や制作意図は以下をご参照ください。  

「[とにかくメッセージが書き込みがあったら良リアクションをつける](https://qiita.com/torifukukaiou/items/74567d2c3302a5d574ab#-%E3%81%A8%E3%81%AB%E3%81%8B%E3%81%8F%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%81%8C%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%81%BF%E3%81%8C%E3%81%82%E3%81%A3%E3%81%9F%E3%82%89%E8%89%AF%E3%83%AA%E3%82%A2%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%92%E3%81%A4%E3%81%91%E3%82%8B)」  

元氣があればなんでもできる！  

動かし方は以下の通りです。[Docker](https://www.docker.com/)を使います。  
依存は [uv](https://docs.astral.sh/uv/) の `pyproject.toml` と `uv.lock` で管理しています（Python 3.14 以上）。  

トークンはコマンドの行に直接書かず、権限を絞ったファイル（例：`chmod 600 .env`）から渡します。`.env` はコミットしません。  

```
SLACK_BOT_TOKEN={your SLACK_BOT_TOKEN}
SLACK_APP_TOKEN={your SLACK_APP_TOKEN}
```

```bash
docker buildx build -t reaction_man ./
docker run -d --name reaction_man --restart unless-stopped --env-file .env reaction_man
```
