# _plugins/auto_category.rb

Jekyll::Hooks.register :posts, :pre_render do |post|
    # 파일의 전체 경로에서 디렉토리 경로만 추출합니다.
    dir_path = File.dirname(post.path)
  
    # Jekyll 프로젝트 루트 경로를 기준으로 상대 경로를 계산합니다.
    relative_dir = dir_path.sub(post.site.source, '')
  
    # 경로를 폴더 이름들로 분할합니다.
    # 맨 앞의 '/' 와, 사용자의 콘텐츠 루트인 'Private_arcive'를 제거합니다.
    # categories = relative_dir.split('/').reject { |c| c.empty? || c == 'Private_arcive' }
  
    # 기존에 categories가 없거나 비어있을 경우에만 자동 생성된 카테고리를 할당합니다.
    # 이렇게 하면 특정 포스트에서 수동으로 카테고리를 지정할 수도 있습니다.
    if post.data['categories'].nil? || post.data['categories'].empty?
      post.data['categories'] = categories
    end
  end