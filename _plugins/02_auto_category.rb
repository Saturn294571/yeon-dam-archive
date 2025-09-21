# _plugins/02_auto_category.rb

Jekyll::Hooks.register :posts, :pre_render do |post|
  # --- 해결책 2: 카테고리 경로 수정 ---
  # 머리말에 카테고리가 수동으로 지정되지 않은 경우에만 실행
  if post.data['categories'].nil? || post.data['categories'].empty?
    dir_path = File.dirname(post.path)
    relative_dir = dir_path.sub(post.site.source, '')
    
    path_parts = relative_dir.split('/').reject(&:empty?)
    
    # 'contents' 폴더의 위치를 찾음
    contents_index = path_parts.index('contents')
    
    if contents_index
      # 'contents' 폴더 바로 다음부터 끝까지를 카테고리로 설정
      # 예: [Private_arcive, 1_Project, 4-1 학부, ...]
      categories = path_parts.slice(contents_index + 1, path_parts.length)
      post.data['categories'] = categories
    end
  end
  # ------------------------------------
end
