require 'debugger'
get '/' do
  @categories = Category.all
  erb :index
end

get '/:category' do 
  @params = params[:category]
  @category = Category.find_by_name(@params)
  @posts = @category.posts
  if @category
    erb :category
  else 
    #404
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  if !params[:key].nil?
    @message = "Thanks for creating this post. You can edit it at localhost:9393/posts/#{@post.id}/edit?key=#{@post.secret_key}"
  else
    @message = ""
  end
  erb :post
end

get '/post/new' do
  @categories = Category.all
  erb :create_post
end


post '/posts' do 
  post = Post.create(params[:post])
  redirect "/posts/#{post.id}?key=#{post.secret_key}"
end


post '/posts/:id' do 
  post = Post.find(params[:post][:id])
  post.update_attributes(params[:post])
  post.save
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id]) 
  if params[:key] == @post.secret_key
    @categories = Category.all
    @category = Category.find(@post.category_id)
    erb :edit_post
  else
    erb :nice_try
  end
end

