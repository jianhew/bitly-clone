get '/' do
	@urls = Url.all
  	erb :"static/index"
end

post '/urls' do
	@url = Url.create(long_url: params[:long_url])
	@url.shorten
	@url.save
	erb :"static/index"
end


get '/:short_url' do
 	url = Url.find_by(short_url: params[:short_url])  
	count = url.counter.to_i
	count += 1
	url.counter = count
	url.save
  	redirect "http://" + url.long_url
end