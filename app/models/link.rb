class Link < ActiveRecord::Base
  before_validation :set_short_name, :validate_url_and_prepend_scheme_if_none!

  validates :url, :presence => true

  validates :clicks_count,
    :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 0
    },
    :presence => true

  def clicked!
    self.clicks_count += 1
    self.save
  end

  # This controls how an ActiveRecord object is displayed in a URL context.
  # This way, if we do link_path(@link), Rails will generate a path like
  # "/l/#{@link.short_name}" vs. "/l/#{@link.id}".
  # See: http://apidock.com/rails/ActiveRecord/Integration/to_param
  def to_param
    self.short_name
  end

  private
    # if valid_uri?(uri)
    #   if uri has no scheme
    #     uri = prepend http
    #     if !valid_uri?(uri)
    #       error
    #     end
    # else
    #   error
    # end

    # def url_must_be_well_formed
    #   uri = URI.parse(url)
    # rescue URI::BadURIError, URI::InvalidURIError
    #   self.errors.add(:url, 'is not a valid URL')
    # end

    # NOT WORKING
    def validate_url_and_prepend_scheme_if_none!
      uri = URI.parse(url)
      url.prepend("http://") unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
    rescue URI::BadURIError, URI::InvalidURIError
      self.errors.add(:url, 'is not a valid URL')
    end

    def set_short_name
      # Generate and assign a random short_name unless one has already been set.
      return self.short_name if self.short_name.present?

      # See: http://www.ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html#method-c-urlsafe_base64
      # We do this to ensure we're not creating two links with the same short_name
      # Since it's randomly generated and not user-supplied, we can't rely on
      # validations to do this for us.
      try_short_name = SecureRandom.urlsafe_base64(6)
      while Link.where(:short_name => try_short_name).any?
        try_short_name = SecureRandom.urlsafe_base64(6)
      end

      self.short_name = try_short_name
    end
end
