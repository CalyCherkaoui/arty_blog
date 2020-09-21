module Authors
  class ElementsController < AuthorsController
    before_action :set_article
    before_action :set_element, only: [:update, :destroy]

  
    # GET /elements
    # def index
    #   @elements = Element.all
    # end
  
    # # GET /elements/1
    # def show
    # end
  
    # # GET /elements/new
    # def new
    #   @element = Element.new
    # end
  
    # # GET /elements/1/edit
    # def edit
    # end
  
    # POST /elements
    def create
      @element = @article.elements.build(element_params)
  
      if @element.save
        notice = nil
      else
        notice = @element.errors.full_messages.join(". ") << "."
      end
      redirect_to edit_article_path(@article), notice: notice
    end
  
    # PATCH/PUT /elements/1
    def update
      notice = nil
      if @element.update(element_params)
        notice= 'Element was successfully updated.'
      else
        notice = @element.errors.full_messages.join(". ") << "."
      end
      redirect_to edit_article_path(@element.article), notice: notice
    end
  
    # DELETE /elements/1
    def destroy
      @element.destroy
      redirect_to elements_url, notice: 'Element was successfully destroyed.'
    end
  
    private
      def set_article
        @article = current_author.articles.find(params[:article_id])
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @article.elements.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def element_params
        params.require(:element).permit(:element_type, :content)
      end
  end
end
