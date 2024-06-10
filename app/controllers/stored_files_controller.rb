class StoredFilesController < ApplicationController
  before_action :set_stored_file, only: [:destroy]

  def new
    @stored_file = current_user.stored_files.build(folder_id: params[:folder_id])
  end

  def create
    folder = Folder.find(params[:folder_id])
    files = params[:stored_files][:file]
    errors = []

    files.each do |file|
      stored_file = folder.stored_files.new(user: current_user)
      stored_file.file.attach(file)
      unless stored_file.save
        errors << stored_file.errors.full_messages.join(', ')
      end
    end

    if errors.empty?
      redirect_to folder_path(folder), notice: 'Files were successfully uploaded.'
    else
      redirect_to folder_path(folder), alert: "Some files could not be uploaded: #{errors.join('; ')}"
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
    params.require(:stored_file).permit(:file, :folder_id)
  end
end
