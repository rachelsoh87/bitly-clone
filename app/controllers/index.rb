
get '/' do #landing page?
  puts "RACHELLLLLLL"
  puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all.order(:id)
  puts "Meow"
  erb :'static/index'

end

post '/urls' do #create a new URL
  #print "Your long_url: "
  url = Url.new(longer_url: params[:long_url]) 
  url.shorten
  url.save
  redirect to "/results/#{url.id}"
  #puts "Your new awesome short url:" 
end

get '/results/:id' do
  @url = Url.find(params[:id])

  erb :'static/results'
end


get '/:short_url' do #read and show the original long_url before it was shortened
 
end