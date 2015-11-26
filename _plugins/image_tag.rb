# require 'fastimage'
# 
# module Jekyll
# 
#   class ImageTag < Liquid::Tag
#   @img = nil
# 
#     def initialize(tag_name, markup, tokens)
#       attributes = ['class', 'src', 'width', 'height', 'title']
# 
#       if markup =~ /(?<class>\S.*\s+)?(?<src>(?:https?:\/\/|\/|\S+\/)\S+)(?:\s+(?<width>\d+))?(?:\s+(?<height>\d+))?(?<title>\s+.+)?/i
#         @img = attributes.reduce({}) { |img, attr| img[attr] = $~[attr].strip if $~[attr]; img }
#         if /(?:"|')(?<title>[^"']+)?(?:"|')\s+(?:"|')(?<alt>[^"']+)?(?:"|')/ =~ @img['title']
#           @img['title']  = title
#           @img['alt']    = alt
#         else
#           @img['alt']    = @img['title'].gsub!(/"/, '&#34;') if @img['title']
#         end
#         @img['class'].gsub!(/"/, '') if @img['class']
#       end
#       
#       super
#     end
# 
#     def render(context)
#       output = super
# 	      @img['src'] =~ /https?:\/\/[\S]+/ ? @imgsrc = @img['src'] : @imgsrc = @img['src']
# 		  #@imgsize = FastImage.size('http://localhost:8888/public/images/laser-cut-stools/tom-chung-laser-cut-stools-01.jpg')
# 		  @imgsize = FastImage.size('http://tomchung.net'+@img['src'])
# 	      @imgwidth = @imgsize[0] unless @imgsize.nil?
# 	      
# 	      "<span style=\"width: #{@imgwidth}px\">" +
# 	        "<img class=\"caption\" #{@img.collect {|k,v| "#{k}=\"#{v}\"" if v}.join(" ")}>" +
# 	      "</span>"
#     end
#   end
# end
# 
# Liquid::Template.register_tag('img', Jekyll::ImageTag)