# require 'open-uri'
# require 'nokogiri'
# require 'fastimage'
# 
# # module Jekyll
# #   class RenderTimeTag < Liquid::Tag
# # 
# #     def initialize(tag_name, text, tokens)
# #       super
# #       
# #       @size = FastImage.size("http://tomchung.net/public/images/laser-cut-stools/tom-chung-laser-cut-stools-01.jpg")
# #       @orig_width = @size[0]
# #       @orig_height = @size[1]
# #       @orig_ratio = (@orig_height*1.0/@orig_width)*100
# #     end
# # 
# #     def render(context)
# #       @orig_ratio
# #     end
# #   end
# # end
# # 
# # Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
# 
# module Jekyll
#   module Checked
#     def checked(text)
# 	  @img = nil  
# 	  @img['src'] =~ /https?:\/\/[\S]+/ ? @imgsrc = @img['src'] : @imgsrc = "source" + @img['src']
# 	  @size = FastImage.size(@imgsrc)
# 	  @orig_width = @size[0]
# 	  @orig_height = @size[1]
# 	  @orig_ratio = (@orig_height*1.0/@orig_width)*100
# 	    
# 	  text.sub(%r{\[x\]}i, @orig_ratio.to_s)
# 
#     end
#   end
# end
# 
# Liquid::Template.register_filter(Jekyll::Checked)