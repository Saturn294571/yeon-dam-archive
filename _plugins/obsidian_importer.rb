# _plugins/obsidian_importer.rb

require 'git'
require 'pathname'

Jekyll::Hooks.register :site, :post_read do |site|
  # Jekyll 시스템 폴더나 숨김 폴더가 아닌 사용자 콘텐츠 폴더를 식별하는 정규표현식
  user_content_regex = %r{^\/[^_.]}
  
  # Git 저장소 정보를 한 번만 불러옵니다.
  begin
    g = Git.open(site.source)
  rescue ArgumentError
    g = nil # Git 저장소가 아닌 경우 nil로 설정
  end

  site.static_files.each do |file|
    if file.relative_path.match(user_content_regex) && file.extname == '.md'
      new_post = Jekyll::Document.new(
        file.path, { site: site, collection: site.collections['posts'] }
      )
      new_post.read

      # --- 모든 자동화 로직을 여기서 처리 ---

      # 1. 날짜 자동 부여 (Git 커밋 날짜 기준)
      if new_post.data['date'].nil?
        if g
          begin
            log = g.log(1).path(file.path)
            new_post.data['date'] = log.first ? log.first.date : Time.now
          rescue Git::GitExecuteError
            new_post.data['date'] = Time.now
          end
        else
          new_post.data['date'] = Time.now
        end
      end

      # 2. 카테고리 자동 생성 (폴더 경로 기준)
      if new_post.data['categories'].nil? || new_post.data['categories'].empty?
        relative_dir = Pathname.new(file.path).dirname.relative_path_from(Pathname.new(site.source)).to_s
        categories = relative_dir.split('/').reject(&:empty?)
        new_post.data['categories'] = categories
      end
      
      # 3. LaTeX 수식 지원 자동 활성화
      new_post.data['math'] = true unless new_post.data.key?('math')

      # 모든 정보가 부여된 노트를 게시물 목록에 추가
      site.collections['posts'].docs << new_post
    end
  end

  # 처리된 파일들을 static_files 목록에서 제거
  site.static_files.delete_if do |file|
    file.relative_path.match(user_content_regex) && file.extname == '.md'
  end
end
