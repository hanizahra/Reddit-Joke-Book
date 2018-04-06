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
  	redirect_to ('/jokes')
  end

  def destroy
  	Joke.destroy(params['id'])
  	redirect_to('/jokes')
  end

  def get_rand
    data = HTTParty.get "https://api.pushshift.io/reddit/comment/search?q=%22knock%20knock%22-sex&limit=1000&score=>1000&subreddit=askreddit"
    randomJoke = rand(0...200)
    author = data['data'][randomJoke]['author']
    joke = data['data'][randomJoke]['body']
    # render json: {author: author, body: body}
    Joke.create(author: author, body: joke)
    # render "show"
    # redirect_to('/jokes')
    # redirect_to('/jokes/joke:params')
    @author = author
    @joke = joke
  end
end
