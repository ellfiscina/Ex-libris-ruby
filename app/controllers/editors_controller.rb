class EditorsController < HomeController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]

  # GET /editors
  # GET /editors.json
  def index
    @editors = Editor.all.per_page(params[:page])
  end

  # GET /editors/new
  def new
    @editor = Editor.new
  end

  # GET /editors/1/edit
  def edit
  end

  def show
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)

    respond_to do |format|
      if @editor.save
        format.html { redirect_to editors_path, notice: 'Editor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
    respond_to do |format|
      if @editor.update(editor_params)
        format.html { redirect_to editors_path, notice: 'Editor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor.destroy
    respond_to do |format|
      format.html { redirect_to editors_url, notice: 'Editor was successfully destroyed.' }
      format.json { head :no_content }
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
end
