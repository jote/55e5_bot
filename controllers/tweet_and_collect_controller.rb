class TweetAndCollectController
  SLEEP_TIME = 10
  def self.tweet_and_collect(fan)
    db_connection = Mongo::Connection.new
    db = db_connection.db('news')
    porno_collection = db.collection('porno_collection')
    twitter_client = TwitterController.get_client
    fan::get_news(porno_collection).each do |news|
      message = "[Pornograffitti NEWS] #{news.date}|#{news.tag}|#{news.content} #{fan::URL}"
      twitter_client.update(message)
      porno_collection.insert({"_id" => news.id, "tag" => news.tag, "content" => news.content})
      sleep SLEEP_TIME
      # TODO 今は1度ツイートしたら抜けるようにする
      break
    end
  end
end
