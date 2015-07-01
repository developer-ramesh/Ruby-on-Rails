class ArticlesController < ApplicationController
  
  def index
     @articles = Article.all
    #render :text => @articles.inspect
    #render :json => session

  end
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def create
  @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
  
  def test
    render :json => session
  end
  
  def hello
    @articles = Article.all
    respond_to do |format|
        format.js {}
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end