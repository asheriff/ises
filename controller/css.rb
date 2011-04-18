class CssController < Ramaze::Controller
  map '/css'
  engine :Sass
  
  trait :sass_options => {
    :style => :expanded,
  }
end