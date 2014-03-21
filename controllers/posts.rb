# RESTful Routes:
# Cats (resource)
#
# READING
# VERB URL             ACTION  DESC
# GET /cats            index   show a list of cats
# GET /cats/:id        show    show an individual cat
#
# CREATING
# GET /cats/new        new     show the form to create a new cat
# POST /cats           create  create a new cat
#
# UPDATING
# GET /cats/:id/edit   edit    show the form to edit an existing cat
# PUT /cats/:id        update  change the properties of an existing cat
#
# DELETING
# DELETE /cats/:id     delete  delete an existing cat
#
# /app/views/cats/new.erb
#                  edit.erb
#                  index.erb
#                  show.erb

# SESSIONS
# CREATING
# GET /sessions/new        new     show the form to create a new session (login)
# POST /sessions           create  create a new session
#
# DELETING
# DELETE /sessions         delete  delete an existing session (logout)
#
# /app/views/sessions/new.erb

# USERS
# READING
# VERB URL              ACTION  DESC
# GET /users            index   show a list of users
# GET /users/:id        show    show an individual user (profile page?)
#
# CREATING
# GET /users/new        new     show the form to create a new user (signup)
# POST /users           create  create a new user
#
# UPDATING
# GET /users/:id/edit   edit    show the form to edit an existing user
# PUT /users/:id        update  change the properties of an existing user
#
# DELETING
# DELETE /users/:id     delete  delete an existing user
#
# /app/views/users/new.erb
#                  edit.erb
#                  index.erb
#                  show.erb


# List all cats (index)
get "/cats" do
  @cats = Cat.all
  erb :"cats/index"
end

# Show the form to create a new cat (new)
get "/cats/new" do
  erb :"cats/new"
end

# Show a single cat (show)
get "/cats/:id" do
  @cat = Cat.find(params[:id])
  erb :"cats/show"
end

# Create a new cat (create)
post "/cats" do
  @cat = Cat.new(params)
  if @cat.save
    redirect to("/cats/#{@cat.id}")
  else
    erb :"cats/new"
  end
end

# Show the form to edit a cat (edit)
get "/cats/:id/edit" do
  @cat = Cat.find(params[:id])
  erb :"cats/edit"
end

# Update an existing cat (update)
put "/cats/:id" do
  @cat = cat.find(params[:id])

  # Dealing with _method:
  #
  # Option #1 Delete _method from params
  # e.g. params = {"_method" => "put", "name" => "Booker T. Cat", "favorite_food" => "tuna"}
  params.delete("_method")
  if @cat.update(params)
    redirect to("/cats/#{@cat.id}")
  else
    erb :"cat/edit"
  end

  # Option #2 Stuff/namespace all the cat attributes under a parent key 'cat'
  # e.g. params = {"_method" => "put",
  #                "cat" => {"name" => "Booker T. Cat", "favorite_food" => "tuna"}}
  if @cat.update(params[:cat])
    redirect to("/cats/#{@cat.id}")
  else
    erb "cat/edit"
  end
end

# Delete an existing cat (delete)
delete "/cats/:id" do
  Cat.destroy(params[:id])

  redirect to("/cats")
end
