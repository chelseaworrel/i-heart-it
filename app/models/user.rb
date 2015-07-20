class User < ActiveRecord::Base

  def self.find_or_create_from_auth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.nickname = oauth.info.nickname
    user.image = oauth.info.image
    user.website = oauth.info.website
    user.token = oauth.credentials.token
    user.save
    user
  end
end
