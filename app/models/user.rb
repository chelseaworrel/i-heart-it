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

  def remodel
    client.tag_recent_media('remodel', options = {:count => 50})
  end

  def homedecor
    client.tag_recent_media('homedecor', options = {:count => 50})
  end

  def homedesign
    client.tag_recent_media('homedesign', options = {:count => 50})
  end

  def midmod
    client.tag_recent_media('midmod', options = {:count => 50})
  end

  def housebeautiful
    client.tag_recent_media('housebeautiful', options = {:count => 50})
  end

  def oldhouse
    client.tag_recent_media('oldhouse', options = {:count => 50})
  end

  def kidsrooms
    client.tag_recent_media('kidsrooms', options = {:count => 50})
  end

  def interiordesign
    client.tag_recent_media('interiordesign', options = {:count => 50})
  end

  def shabbychic
    client.tag_recent_media('shabbychic', options = {:count => 50})
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
