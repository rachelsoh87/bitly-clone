class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	#validates :shortened_url, uniqueness: true
  
  #before_create :shorten 
  
  def shorten
    short_url = "http://cho.mped." + SecureRandom.base64(4)
    self.shortened_url = short_url if self.shortened_url.nil?
  end
 
end

