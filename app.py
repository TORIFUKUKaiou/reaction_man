import os
import random
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler

# ボットトークンとソケットモードハンドラーを使ってアプリを初期化します
app = App(token=os.environ.get("SLACK_BOT_TOKEN"))

@app.event("message")
def handle_message_events(body, logger, client):
    logger.info(body)
    ts = body['event']['ts']
    channel = body['event']['channel']
    icons = ['thumbsup', 'tada', 'rocket', 'inoki', 'toukon', 'thumbsup_all', 'sasuga']

    client.reactions_add(
        channel=channel,
        name=random.choice(icons),
        timestamp=ts)


# アプリを起動します
if __name__ == "__main__":
    SocketModeHandler(app, os.environ["SLACK_APP_TOKEN"]).start()