module FoldersHelper
    def render_folder_tree(folder)
      content_tag(:div, class: 'folder') do
        concat(content_tag(:div, class: 'folder-info') do
          concat(image_tag('folder-icon.svg', class: 'folder-icon', alt: 'Folder'))
          concat(link_to(folder.name, folder_path(folder)))
        end)
        if folder.children.any?
          concat(content_tag(:div, class: 'subfolders') do
            folder.children.each do |child|
              concat(render_folder_tree(child))
            end
          end)
        end
      end
    end
  end
  