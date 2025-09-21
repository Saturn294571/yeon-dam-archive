# _plugins/02_auto_category.rb

Jekyll::Hooks.register :posts, :pre_render do |post|
  dir_path = File.dirname(post.path)
  relative_dir = dir_path.sub(post.site.source, '')

  # 경로를 폴더 이름들로 분할합니다.
  # 맨 앞의 '/' 와 최상위 폴더인 'contents'를 제거합니다.
  categories = relative_dir.split('/').reject { |c| c.empty? || c == 'contents' }

  if post.data['categories'].nil? || post.data['categories'].empty?
    post.data['categories'] = categories
  end
end