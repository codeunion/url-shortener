class Link < ActiveRecord::Base
  before_create :set_short_name

  validates :url, :presence => true

  def to_param
    self.short_name
  end

  private
  def set_short_name
    return self.short_name if self.short_name.present?

    try_short_name = SecureRandom.urlsafe_base64(6)
    while Link.where(:short_name => try_short_name).any?
      try_short_name = SecureRandom.urlsafe_base64(6)
    end

    self.short_name = try_short_name
  end
end
