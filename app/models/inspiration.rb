class Inspiration < ActiveRecord::Base
  before_save :set_slug
  validates :name, presence: true
  validates :title, presence: true
  validates :slug, presence: true

  def set_slug
    if slug.nil? || slug == ""
      self.slug = name.parameterize
    else
      self.slug = slug.parameterize
    end
  end

  def to_param
    slug
  end
end
