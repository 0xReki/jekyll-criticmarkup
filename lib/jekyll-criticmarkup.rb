Jekyll::Hooks.register :documents, :pre_render do |document, payload|
  # Convert CriticMarkup to HTML
  content = document.content
  
  content = content.gsub(/\{\+\+(.*?)\+\+\}/m, '<ins>\1</ins>')
  content = content.gsub(/\{--(.*?)--\}/m, '<del>\1</del>')
  content = content.gsub(/\{~~(.*?)->(.*?)~~\}/m, '<del>\1</del><ins>\2</ins>')
  content = content.gsub(/\{>>(.*?)<<\}/m, '<span class="critic-comment" style="right:0">\1</span>')
  content = content.gsub(/\{==(.*?)==\}/m, '<mark>\1</mark>')
  document.content = content
end

# Pages don't seem to be part of documents so adding duplicate code.

Jekyll::Hooks.register :pages, :pre_render do |document, payload|
  # Convert CriticMarkup to HTML
  content = document.content

  # Add Space to empty Markup
#  content = content.gsub(/\{\+\+\n\n\+\+\}/, '<ins>&nbsp;</ins>')
#  content = content.gsub(/\{--\n\n--\}/, '<del>&nbsp;</del>')
  content = content.gsub(/\{\+\+(.*?)\+\+\}/m, '<ins>\1</ins>')
  content = content.gsub(/\{--(.*?)--\}/m, '<del>\1</del>')
  content = content.gsub(/\{~~(.*?)->(.*?)~~\}/m, '<del>\1</del><ins>\2</ins>')
  content = content.gsub(/\{>>(.*?)<<\}/m, '<span class="critic-comment" style="right:0">\1</span>')
  content = content.gsub(/\{==(.*?)==\}/m, '<mark>\1</mark>')

  document.content = content
end
