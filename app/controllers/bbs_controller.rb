class BbsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def create
    name = params[:name]
    post = params[:text]

    user = User.find_or_create_by(name: name)
    post = Post.create(text: post)

    user.posts << post
    user.save

    @posts = Post.all()

    render action: :index

  end

end
