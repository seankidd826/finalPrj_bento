class Admin::StoriesController < ApplicationController
  before_action :set_admin_story, only: [:show, :edit, :update, :destroy]

  # GET /admin/stories
  # GET /admin/stories.json
  def index
    @admin_stories = Admin::Story.all
  end

  # GET /admin/stories/1
  # GET /admin/stories/1.json
  def show
  end

  # GET /admin/stories/new
  def new
    @admin_story = Admin::Story.new
  end

  # GET /admin/stories/1/edit
  def edit
  end

  # POST /admin/stories
  # POST /admin/stories.json
  def create
    @admin_story = Admin::Story.new(admin_story_params)

    respond_to do |format|
      if @admin_story.save
        format.html { redirect_to @admin_story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @admin_story }
      else
        format.html { render :new }
        format.json { render json: @admin_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stories/1
  # PATCH/PUT /admin/stories/1.json
  def update
    respond_to do |format|
      if @admin_story.update(admin_story_params)
        format.html { redirect_to @admin_story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_story }
      else
        format.html { render :edit }
        format.json { render json: @admin_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stories/1
  # DELETE /admin/stories/1.json
  def destroy
    @admin_story.destroy
    respond_to do |format|
      format.html { redirect_to admin_stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_story
      @admin_story = Admin::Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_story_params
      params.require(:admin_story).permit(:momheader, :momcontents, :momcontents_1, :momcontents_2, :momcontents_3)
    end
end
