class User < ActiveRecord::Base

  def self.find_or_create_from_auth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.nickname = oauth.info.nickname
    user.name = oauth.info.full_name
    user.image = oauth.info.image
    user.website = oauth.info.website
    user.token = oauth.credentials.token
    user.save
    user
  end

  def client
    @instagram_client ||= Instagram.client(access_token: token)
  end

  def media
    client.user_media_feed
  end

  def user
    client.user
  end

  def recent_media
    client.user_recent_media
  end
end
