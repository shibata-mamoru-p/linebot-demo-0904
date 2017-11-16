class WebhookController < ApplicationController
  require 'line/bot'
  protect_from_forgery with: :null_session

  CHANNEL_SECRET = 'XXX'
  CHANNEL_ACCESS_TOKEN = 'XXX'

  def parrot
    client = Line::Bot::Client.new do |config|
      config.channel_secret = CHANNEL_SECRET
      config.channel_token = CHANNEL_ACCESS_TOKEN
    end

    reply_token = params['events'][0]['replyToken']

    # ユーザーから送られてきたメッセージ
    message = params['events'][0]['message']['text']

    # 返信する
    response = client.reply_message(reply_token, {type: 'text', text: message + '、ですね〜'})

    logger.info({response: response})

    # 200 OKを返す
    head :ok
  end
end
