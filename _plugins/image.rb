require 'fastimage'

module Jekyll
  class FigureImageTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @image_url = 'image_url'
    end
    
    def render(context)
      @index = Liquid::Template.parse("{{ forloop.index | minus: 1 }}").render(context)
      @base_url = Liquid::Template.parse("{{ site.#{@image_url} }}").render(context)
      @src = Liquid::Template.parse("{{ page.images[#{@index}].image }}").render(context)
      
      @size = FastImage.size("http://localhost:8888/public/images/"+@src)
      @orig_width = @size[0]
      @orig_height = @size[1]
      @orig_ratio = (@orig_height*1.0/@orig_width)*100
	  
	  figure = "<div class='placeholder' style='padding-bottom:#{@orig_ratio}%'>"
      figure += "<img src=\"#{@base_url}\/#{@src}\"/>"
      figure += "</div>"
    end
  end
end

Liquid::Template.register_tag('figure_img', Jekyll::FigureImageTag)