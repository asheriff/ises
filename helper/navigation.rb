require 'ostruct'

module Ramaze; module Helper; module Navigation
  def util_nav
    links =
      [ ["/signup",         "Register"],
        ["/calendar",       "Calendar"],
        ["/contact",        "Contact Us"],
        ["/members/search", "Find a Memeber"],
      ].map{ |link| OpenStruct.new( :href=>link[0], :name=>link[1] ) }
  end
  
  def main_nav(selected_index=nil)
    links = 
      [ ["/",         "Home"],
        ["/about",    "About ISES"],
        ["/members",  "Members"],
        ["/programs", "Programs and Education"],
        ["/events",   "Events"],
        ["/jobs",     "Jobs"],
      ].map{ |link| OpenStruct.new( :href=>link[0], :name=>link[1] ) }
    
    if selected_index
      links.each_with_index{ |link,i| link.selected = true if i==selected_index }
    else
      links.each{ |link| link.selected = true if link.href == request.env["PATH_INFO"].sub(%r!(/[^/]+).*!, '\1') }
    end
  end
  
  def sub_nav(selected_index=nil)
    navs = {
      :members =>
        [ ["/signup",             "Join ISIS"],
          ["/members/about",      "Member Benefits"],
          ["/members/benefits",   "Student Membership"],
          ["/members/news",       "Member News"],
          ["/members/mentorship", "Mentorship Program"],
        ],
      :events =>
        [ ["/events/awards",      "MN Star Awards"],
          ["/events/news",        "Industry Events"],
          ["/events/sponsorship", "Sponsorship"],
          ["/events/gallery",     "Photo Gallery"],
        ],
    }
      
    return [] unless navs.key? @subnav
    
    links = navs[@subnav].map{ |link| OpenStruct.new( :href=>link[0], :name=>link[1] ) }
    
    if selected_index
      links.each_with_index{ |link,i| link.selected = true if i==selected_index }
    else
      links.each{ |link| link.selected = true if link.href == request.env["PATH_INFO"] }
    end
  end
end; end; end
