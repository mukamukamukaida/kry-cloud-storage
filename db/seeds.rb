require 'fileutils'

# 既存のユーザーを取得
user = User.find_by(email: "admin@example.com")

# 指定されたディレクトリ
base_directory = "C:/Users/krynm/OneDrive/デスクトップ/刈屋/3_情シス関連/クラウドストレージ検討"

# ヘルパーメソッド：フォルダとファイルを再帰的に作成
def create_folder_and_files(user, parent_folder, directory_path)
  Dir.foreach(directory_path) do |entry|
    next if entry == '.' || entry == '..'

    full_path = File.join(directory_path, entry)
    if File.directory?(full_path)
      folder = user.folders.create!(name: entry, parent: parent_folder)
      create_folder_and_files(user, folder, full_path) # 再帰的にサブフォルダを処理
    else
      file = parent_folder.stored_files.create!(name: entry, user: user)
      file.s3_key.attach(io: File.open(full_path), filename: entry)
    end
  end
end

# ルートフォルダの作成
root_folder = user.folders.create!(name: "Root")

# ディレクトリを再帰的に読み込んでデータベースに保存
create_folder_and_files(user, root_folder, base_directory)
