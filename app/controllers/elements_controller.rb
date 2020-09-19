class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]

  # GET /elements
  def index
    @elements = Element.all
  end

  # GET /elements/1
  def show
  end

  # GET /elements/new
  def new
    @element = Element.new
  end

  # GET /elements/1/edit
  def edit
  end

  # POST /elements
  def create
    @element = Element.new(element_params)

    if @element.save
      redirect_to @element, notice: 'Element was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /elements/1
  def update
    if @element.update(element_params)
      redirect_to @element, notice: 'Element was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /elements/1
  def destroy
    @element.destroy
    redirect_to elements_url, notice: 'Element was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def element_params
      params.require(:element).permit(:element_type, :article_id, :position)
    end
end
