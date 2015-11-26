# require "nokogiri"
# 
# class MySubnavGenerator < Jekyll::Generator
#   def generate(site)
#     parser = Jekyll::Converters::Markdown.new(site.config) 
# 
#     site.pages.each do |page|
#       
#         doc = Nokogiri::HTML(parser.convert(page['content']))
#         doc.css('h2').each do |heading|
#           #puts "#{ heading.text }: #{ heading['id'] }"
#           print "hello"
#         end
# 
#     end
#   end
# end