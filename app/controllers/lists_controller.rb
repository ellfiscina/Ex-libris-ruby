class ListsController < HomeController
  before_action :set_list, only: [:show, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /lists
  def index
  end

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  def show
    @books = @list.books.order(sort_column + ' ' + sort_direction).per_page(params[:page])
  end

  # POST /lists
  def create
    @list = current_user.lists.new(list_params)
    if @list.save!
      redirect_to @list, notice: t('messages.created', item: 'Lista')
    else
      render :new
    end
  end

  def update
    @book = Book.find(params["list"]["book_ids"])
    @list.books << @book
    if @list.update(list_params)
      redirect_to @list, notice: t('messages.inserted')
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:year, book_ids: [])
    end

    def sort_column
      params[:sort] || "title"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
