class TwitterController
  CONF_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../conf'))
  def self.get_client()
    conf = YAML.load_file(File.join(CONF_DIR, 'twitter_conf.yml'))
    Twitter.configure do |config|
      config.consumer_key = conf['consumer_key']
      config.consumer_secret = conf['consumer_secret']
    end
    client = Twitter::Client.new(
      :oauth_token => conf['oauth_token'],
      :oauth_token_secret => conf['oauth_token_secret']
    )
  end
end
