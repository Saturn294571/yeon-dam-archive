# _plugins/01_force_posts.rb

Jekyll::Hooks.register :site, :after_read do |site|
    # 'contents' 폴더에 있는 모든 정적 파일(StaticFile)을 찾습니다.
    site.static_files.each do |file|
      if file.relative_path.start_with?('/contents/') && file.extname == '.md'
        # 이 파일들을 Jekyll의 'posts' 컬렉션으로 옮깁니다.
        new_post = Jekyll::Document.new(
          file.path, { site: site, collection: site.collections['posts'] }
        )
        new_post.read
        site.collections['posts'].docs << new_post
      end
    end
  
    # 이미 posts 컬렉션으로 옮겨진 파일들을 static_files 목록에서 제거하여 중복 처리를 방지합니다.
    site.static_files.delete_if do |file|
      file.relative_path.start_with?('/contents/') && file.extname == '.md'
    end
  end