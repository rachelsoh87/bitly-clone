class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :shortened_url, uniqueness: true

  def shorten
    short_url = "http://cho.mped." + SecureRandom.base64(4)
    self.shorten_url = short_url if self.shorten_url.nil?
  end
  
end
