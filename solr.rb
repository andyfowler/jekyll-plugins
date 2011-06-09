module Jekyll
  
  class SolrGenerator < Generator
    safe true
    priority :low
    
    def generate(site)
      if !ENV['SOLR_HOST']
        puts "No Solr config found, skipping"
        return
      end
      
      require 'solr'
      solr = Solr::Connection.new('http://' + ENV['SOLR_HOST'] + '/solr')
      
      site.pages.each do |page|
        next if not indexable? page
        
        full_url = page.dir + page.url
        clean_content = page.content.gsub(%r{</?[^>]+?>}, ' ')
        tags = page.data['tags'] || []
        
        puts "Indexing #{full_url}"
        
        solr.update({
          :id => full_url,
          :url => full_url,
          :title => page.data['title'],
          :text => clean_content,
          :tags => tags
        })
      end
      
      solr.commit
    end
    
    private
    
    # should the current page be indexed in solr?
    def indexable?(page)
      (page.data['id'] == 'kb')
    end
    
  end
  
  # awful terrible hack, to fix the stupidly overridden accessor in Page
  class Page
    def dir 
      return @dir
    end
  end
end