module Authors

  class ArticlesController < AuthorsController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    # GET /articles
    def index
      @articles = current_author.articles
    end
  
    # GET /articles/1
    def show
    end
  
    # GET /articles/new
    def new
      @article = current_author.articles.build
    end
  
    # GET /articles/1/edit
    def edit
    end
  
    # POST /articles
    def create
      @article = current_author.articles.build(article_params)
  
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = current_author.articles.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def article_params
        params.require(:article).permit(:title, :description, :published, :published_at, :author_id)
      end
  end
  
end
