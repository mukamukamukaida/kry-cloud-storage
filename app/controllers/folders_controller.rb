class FoldersController < ApplicationController
  before_action :authenticate_user
  before_action :set_folder, only: %i[show edit update destroy]

  def index
    @folders = current_user.folders.where(parent_id: nil)
  end

  def show
  end

  def new
    @folder = current_user.folders.build(parent_id: params[:parent_id])
  end

  def create
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      redirect_to @folder, notice: 'Folder was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @folder.update(folder_params)
      redirect_to @folder, notice: 'Folder was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @folder.destroy
    redirect_to folders_url, notice: 'Folder was successfully destroyed.'
  end

  private

  def set_folder
    @folder = current_user.folders.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :parent_id)
  end
end
