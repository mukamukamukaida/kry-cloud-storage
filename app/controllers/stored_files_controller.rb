class StoredFilesController < ApplicationController
  before_action :set_stored_file, only: [:destroy]

  def new
    @stored_file = current_user.stored_files.build(folder_id: params[:folder_id])
  end

  def create
    @stored_file = current_user.stored_files.build(stored_file_params)
    if @stored_file.save
      redirect_to folder_path(@stored_file.folder), notice: 'File was successfully uploaded.'
    else
      render :new
    end
  end

  def destroy
    @stored_file.destroy
    redirect_to folder_path(@stored_file.folder), notice: 'File was successfully deleted.'
  end

  private

  def set_stored_file
    @stored_file = current_user.stored_files.find(params[:id])
  end

  def stored_file_params
    params.require(:stored_file).permit(:name, :s3_key, :folder_id)
  end
end
