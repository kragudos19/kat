post '/subscription/new' do
  @user = User.find_by(id: session[:user_id])
  @channel = Channel.find_by()
end
