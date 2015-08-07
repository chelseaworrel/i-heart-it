class User < ActiveRecord::Base
  has_many :pictures

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

  def pag
    response = client.user_media_feed
    album = [].concat(response)
    max_id = response.pagination.next_max_id

    while !(max_id.to_s.empty?) do
        response = client.user_media_feed(:max_id => max_id)
        max_id = response.pagination.next_max_id
        album.concat(response)
    end
    @album = album
  end

  def pregnancyfashion
    client.tag_recent_media('pregnancyfashion', options = {:count => 50})
  end

  def kidsparty
    client.tag_recent_media('kidsparty', options = {:count => 50})
  end

  def kidsfashion
    client.tag_recent_media('kidsfashion', options = {:count => 50})
  end

  def kidsfood
    client.tag_recent_media('kidsfood', options = {:count => 50})
  end

  def kidsofinstagram
    client.tag_recent_media('kidsofinstagram', options = {:count => 50})
  end

  def babyshower
    client.tag_recent_media('babyshower', options = {:count => 50})
  end

  def kidsrooms
    client.tag_recent_media('kidsrooms', options = {:count => 50})
  end

  def kidsfurniture
    client.tag_recent_media('kidsfurniture', options = {:count => 50})
  end

  def kidsdecor
    client.tag_recent_media('kidsdecor', options = {:count => 50})
  end
end

class Feed
  def self.find_tag(user, tag)
    self.set_client.tag_recent_media(tag, option = {:count => 50 })
  end

  def self.set_client
    Instagram.client(access_token: token)
  end
end

def show
  category = Category.find_by(name: params[:slug])
  Feed.find_tag(current_user, category.name)
end
