class MainController < Controller
  def self.action_missing(path)
    return if path == '/error_404'
    try_resolve('/error_404')
  end
  
  def index
    @no_sidebar = true
  end
  
  def error_404
    @title = request.env["PATH_INFO"].gsub(%r(/(.))){ |s| s[1].upcase }
    
    Faker::Lorem.paragraph(30)
  end
  
  def members
    @subnav = :members
  end
  
  def events
    @subnav = :events
    @no_sidebar = true
  end
  
  def events__gallery
    @subnav = :events
    
    @gallery = []
    
    count = (request.params['n'] && request.params['n'].to_i) || rand(20)+1
    
    (count).times do |index|
      @gallery << OpenStruct.new({
        :xid => index,
        :thumb => "/img/photos/thumbs/#{index%2}.jpg",
        :large => "/img/photos/large/#{index%2}.jpg",
        :description => Faker::Lorem.sentence
      })
    end
  end
end
