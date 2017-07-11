require 'asciidoctor-pdf' unless defined? ::Asciidoctor::Pdf
require "prawn/measurement_extensions"

module AsciidoctorPdfExtensions
  ImageAttributeValueRx = /^image:{1,2}(.*?)\[(.*?)\]$/

  def layout_title_page doc
    start_new_page unless page_is_empty?
    font @theme.base_font_family, size: @theme.base_font_size
    title_align = (@theme.title_page_align || @base_align).to_sym

    # Add the banner image.
    # TODO: Make this configurable in the yaml theme
    canvas do 
        image "/themes/banner.jpg",:width => page_width
    end

    # Write the logo
    if (logo_image_path = (doc.attr 'title-logo-image', @theme.title_page_logo_image))
      if (logo_image_path.include? ':') && logo_image_path =~ ImageAttributeValueRx
        logo_image_path = $1
        logo_image_attrs = (Asciidoctor::AttributeList.new $2).parse ['alt', 'width', 'height']
        relative_to_imagesdir = true
      else
        logo_image_attrs = {}
        relative_to_imagesdir = false
      end
      # HACK quick fix to resolve image path relative to theme
      unless doc.attr? 'title-logo-image'
        logo_image_path = Asciidoctor::Pdf::ThemeLoader.resolve_theme_asset logo_image_path, (doc.attr 'pdf-stylesdir')
      end
      logo_image_attrs['target'] = logo_image_path
      logo_image_attrs['align'] ||= (@theme.title_page_logo_align || title_align.to_s)
      # QUESTION should we allow theme to turn logo image off?
      logo_image_top = logo_image_attrs['top'] || @theme.title_page_logo_top || '10%'
      # FIXME delegate to method to convert page % to y value
      if logo_image_top.end_with? 'vh'
        logo_image_top = page_height - page_height * logo_image_top.to_f / 100.0
      else
        logo_image_top = bounds.absolute_top - effective_page_height * logo_image_top.to_f / 100.0
      end
      initial_y, @y = @y, logo_image_top
      # FIXME add API to Asciidoctor for creating blocks like this (extract from extensions module?)
      image_block = ::Asciidoctor::Block.new doc, :image, content_model: :empty, attributes: logo_image_attrs
      # NOTE pinned option keeps image on same page
      convert_image image_block, relative_to_imagesdir: relative_to_imagesdir, pinned: true
      @y = initial_y
    end

    # Write the title (and subtitle if it exists)
    theme_font :title_page do
      doctitle = doc.doctitle partition: true
      if (title_top = @theme.title_page_title_top)
        if title_top.end_with? 'vh'
          title_top = page_height - page_height * title_top.to_f / 100.0
        else
          title_top = bounds.absolute_top - effective_page_height * title_top.to_f / 100.0
        end
        # FIXME delegate to method to convert page % to y value
        @y = title_top
      end
      move_down (@theme.title_page_title_margin_top || 0)
      theme_font :title_page_title do
        layout_heading doctitle.main,
          align: title_align,
          margin: 0,
          line_height: @theme.title_page_title_line_height
      end
      if doctitle.subtitle
        move_down (@theme.title_page_subtitle_margin_top || 0)
        theme_font :title_page_subtitle do
          layout_heading doctitle.subtitle,
            align: title_align,
            margin: 0,
            line_height: @theme.title_page_subtitle_line_height
        end
        move_down (@theme.title_page_subtitle_margin_bottom || 0)
      end
    end

    # Write the underline 
    move_down 5.mm
    fill_color "FC9774" # ATS Orange
    fill_rectangle [0,cursor], 40.mm, 2.mm

    
  end
end

Asciidoctor::Pdf::Converter.prepend AsciidoctorPdfExtensions