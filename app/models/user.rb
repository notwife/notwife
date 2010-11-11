class User < ActiveRecord::Base
  has_many :authorizations

  def self.create_from_hash!(hash)
    create(:screen_name => hash['user_info']['nickname'])
  end
end
