class User < ActiveRecord::Base
  has_many :authorizations

  def self.create_from_hash!(hash)
    twitter_id          = hash['uid']
    twitter_screen_name = hash['user_info']['nickname']

    create(:twitter_id          => twitter_id,
           :twitter_screen_name => twitter_screen_name)
  end
end
