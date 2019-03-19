require 'jekyll'
require 'fastimage'

module Jekyll
  class PlaceholderUSDZTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @image_url = 'image_url'
    end

    def render(context)
      @index = Liquid::Template.parse("{{ forloop.index | minus: 1 }}").render(context)
      @base_url = Liquid::Template.parse("{{ site.#{@image_url} }}").render(context)
      @src = Liquid::Template.parse("{{ page.images[#{@index}].thumbnail }}").render(context)
      @usdz = Liquid::Template.parse("{{ page.images[#{@index}].ar }}").render(context)

      @size = FastImage.size("public/images/"+@src)
      @ratio = (@size[1]*1.0/@size[0])*100

      placeholder = "<div class='placeholder' style='padding-bottom:#{@ratio}%'>"
      placeholder += "<a rel='ar' class='usdz' href=\"#{@base_url}\/#{@usdz}\">"
      placeholder += "<img src=\"#{@base_url}\/#{@src}\"/>"
      placeholder += "</a>"
      placeholder += "</div>"
    end

  end
end

Liquid::Template.register_tag('placeholder_usdz', Jekyll::PlaceholderUSDZTag)