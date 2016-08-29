get '/subscriptions' do
  @user = User.find(session[:user_id])
  if @user
    @subscribed_channels = @user.channels
    erb :'subscriptions/index'
  else
    "hello"
  end
end

post '/subscription/new' do
  @user = User.find_by(id: session[:user_id])
  @channel = Channel.find_by(params[:channel][:id])
end

delete '/subscriptions/:id' do
  # @subscription = Subscription.find_by(:)

end
