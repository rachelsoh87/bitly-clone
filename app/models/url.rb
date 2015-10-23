class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :shortened_url, uniqueness: true
  before_create :shorten
  
  def shorten
    short_url = SecureRandom.base64(4)
    self.shortened_url = short_url if self.shortened_url.nil?
  end
 
  def count
    self.click_count += 1
    self.save
  end
  
end

