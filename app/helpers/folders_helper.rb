module FoldersHelper
  def render_folder_tree(folder, all_folders, level = 0)
    children = all_folders.select { |f| f.ancestry == folder.id.to_s || f.ancestry == "#{folder.ancestry}/#{folder.id}" }
    content_tag(:div, class: 'folder', style: "margin-left: #{level * 20}px;") do
      concat(content_tag(:div, class: 'folder-info') do
        concat(image_tag('folder-icon.svg', class: 'folder-icon', alt: 'Folder'))
        concat(link_to(folder.name, folder_path(folder)))
      end)
      if children.any?
        concat(content_tag(:div, class: 'subfolders') do
          children.each do |child|
            concat(render_folder_tree(child, all_folders, level + 1))
          end
        end)
      end
    end
  end
end