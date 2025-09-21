# _plugins/01_force_posts.rb

Jekyll::Hooks.register :site, :post_read do |site|
  site.static_files.each do |file|
    if file.relative_path.start_with?('/contents/') && file.extname == '.md'
      new_post = Jekyll::Document.new(
        file.path, { site: site, collection: site.collections['posts'] }
      )
      new_post.read

      # --- 해결책 1: math 속성 자동 추가 ---
      # 해당 노트의 머리말에 math 속성이 별도로 명시되어 있지 않으면 true로 설정
      new_post.data['math'] = true unless new_post.data.key?('math')
      # ------------------------------------
      
      site.collections['posts'].docs << new_post
    end
  end

  site.static_files.delete_if do |file|
    file.relative_path.start_with?('/contents/') && file.extname == '.md'
  end
end
