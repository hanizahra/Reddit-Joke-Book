class JokesController < ApplicationController
  def index
  	@jokes = Joke.all
  	# render json: {
  	# 	message: "this is the index method",
  	# 	jokes: @jokes
  	# }
  end

  def show
  	@joke = Joke.find_by(id: params['id'])
  end

  def create
  	joke = params['joke']
  	Joke.create(author: joke['author'], body: joke['body'])
  	redirect_to('/jokes')
  end

  def edit
  end

  def update
  	joke = params['joke']
  	joke_to_edit = Joke.find(params[:id])
  	joke_to_edit.update(author: joke['author'], body: joke['body'])
  	redirect_to ('/jokes/#{joke_to_edit_update}')
  end

  def destroy
  	Joke.destroy(params['id'])
  	redirect_to('/jokes')
  end

  def get_rand
    data = HTTParty.get "https://api.pushshift.io/reddit/comment/search?q=%22knock%20knock%22&limit=20&score=>1000&subreddit=askreddit"
    author = data['data'][0]['author']
    joke = data['data'][0]['body']
    # render json: {author: author, body: body}
    Joke.create(author: author, body: joke)
    redirect_to('/jokes')
  end
end
