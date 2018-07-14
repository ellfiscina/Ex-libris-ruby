class EditorsController < HomeController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column,:sort_column2, :sort_direction

  # GET /editors
  # GET /editors.json
  def index
    @editors = Editor.all.order(sort_column + ' ' + sort_direction).per_page(params[:page])
    @books = current_user.books
    @count = Editor.all.count
  end

  # GET /editors/new
  def new
    @editor = Editor.new
  end

  # GET /editors/1/edit
  def edit
  end

  def show
    @books = @editor.books.order(sort_column2 + ' ' + sort_direction)
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)
      if @editor.save
        redirect_to editors_path, notice: t('messages.created', item: 'Editora')
      else
        render :new
      end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
      if @editor.update(editor_params)
        redirect_to editors_path, notice: t('messages.updated', item: 'Editora')
      else
        render :edit
      end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    if @editor.destroy
      redirect_to editors_path, notice: t('messages.updated', item: 'Editora')
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_params
      params.require(:editor).permit(:name)
    end

    def sort_column
      params[:sort] || "name"
    end

    def sort_column2
      params[:sort] || "title"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
