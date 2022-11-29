class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = policy_scope(Article)
    @articles = Article.all

    @markers = @articles.geocoded.map do |article|
      {
        lat: article.latitude,
        lng: article.longitude,
        info_window: render_to_string(partial: "info_window", locals: {article: article}),
        image_url: helpers.asset_url("https://res.cloudinary.com/dfipoufmj/image/upload/v1669393163/24744ce9-95be-4ca9-9416-3c5effe76997_beqitg.jpg")
      }
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article)
    authorize @article
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
    authorize @article
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    authorize @article
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    authorize @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    authorize @article

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :location, :content, :latitude, :longitude, :category, :photo, :address)
    end
end
