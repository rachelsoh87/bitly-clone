require 'byebug'
get '/' do #landing page

  puts "MEOWWWWW"
  puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all.order(:id)
  erb :'static/index', :layout => :'static/layout'

end

post '/urls' do #create a new URL
  #print "Your long_url: "
  url_exists = Url.find_by(longer_url: params[:long_url])
  
  if url_exists.nil?
    url = Url.new(longer_url: params[:long_url]) 
    url.shorten
    url.save
    redirect to "results/#{url.shortened_url}"

  else 
    redirect to "results/#{url_exists.shortened_url}"
  end
  #redirect to "/results/#{url_exists.id}"
  #puts "Your new awesome short url:" 
end

#get '/results/:id' do
#  @url = Url.find(params[:id])
#  erb :'static/results'
#end


get '/:short_url' do #read and show the original long_url before it was shortened

 @all_url = Url.all.order("click_count DESC")#{|x,y| x.click_count <=> y.click_count} #order(click_count: DESC)
 @url = Url.find_by(shortened_url: params[:short_url])
 @url.count
 redirect to @url.longer_url

end

get '/results/:short_url' do 
  @url = Url.find_by(shortened_url: params[:short_url])
  @all_url = Url.all.order("click_count DESC")
  erb :'static/results', :layout => :'static/layout'
end