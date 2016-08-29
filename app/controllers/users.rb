get '/users/:id' do
  @user = User.find(session[:user_id])
  erb :'users/show'
end

get '/login' do
  erb :'users/login'
end

get '/users/new' do
  erb :'users/new'
end

post '/register' do
  user_info = params[:user]
  @user = User.new(user_info)
  if @user.valid?
    @user.save
    redirect '/login'
  else
    status 422
    @errors = @user.errors.messages.values
    erb :'users/new'
  end
end

# before '/login' do
#   p "hello"
#   p params[:user]
#   user_info = params[:user]
#   @user = User.find_by(email: user_info[:email])
#   pass if @user
# end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @user.errors.add(:name, "Is this your account?")
    @errors = @user.errors.messages.values
    erb :'users/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect :'/'
end





