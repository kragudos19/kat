get '/channels/index' do
  @channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  @user = User.find_by(id: session[:id])
  if @channel
    erb :"/channels/show"
  else
    status 404
    @error = ["This channel cannot be found."]
  end
end
