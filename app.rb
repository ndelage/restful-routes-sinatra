configure do
  set :method_override, true
end

get "/posts" do
  @posts = Post.all
  erb 'posts/index'
end

get "/posts/:id" do

end

get "/posts/new" do

end


