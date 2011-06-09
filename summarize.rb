# Use like {{ post.content | summarize }} to only render everything before the <!--more--> comment (like word!@#ss)

module Jekyll
  module Filters
    def summarize(str, splitstr = /<!--more-->/)
      str.split(splitstr)[0]
    end
  end
end
