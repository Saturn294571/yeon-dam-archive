# _plugins/auto_date.rb

require 'git'

Jekyll::Hooks.register :posts, :pre_render do |post|
  # 게시물 파일의 머리말(front matter)에 'date'가 없는 경우에만 실행
  if post.data['date'].nil?
    begin
      # Git 저장소 경로를 가져옴
      g = Git.open(post.site.source)
      
      # 해당 파일의 가장 최근 커밋 로그를 가져옴
      # fetch-depth: 0 옵션이 GitHub Actions 워크플로우에 있어야 정확하게 작동합니다.
      log = g.log(1).path(post.path)
      
      if log.first
        # 커밋 로그에서 날짜를 가져와 게시물의 날짜로 설정
        post.data['date'] = log.first.date
      else
        # 커밋 기록이 없는 새 파일의 경우, 현재 시간으로 설정
        post.data['date'] = Time.now
      end
      
    rescue ArgumentError
      # Git 저장소가 아닌 경우 등 예외 발생 시 현재 시간으로 설정
       post.data['date'] = Time.now
    end
  end
end