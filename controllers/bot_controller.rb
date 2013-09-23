class BotController
  SLEEP_TIME = 10

  def self.tweet(site)
    db_connection = Mongo::Connection.new
    db = db_connection.db('news')
    porno_collection = db.collection(site.collection_name)
    twitter_client = TwitterController.get_client
    site.get_news(porno_collection).each do |news|
      message = "[#{site.name} NEWS] #{news.date}|#{news.tag}|#{news.content} #{site.url}"
      twitter_client.update(message)
      porno_collection.insert({"_id" => news.id, "tag" => news.tag, "content" => news.content})
      sleep SLEEP_TIME
    end
  end
end
