module RedCloth::Formatters
  module Base
    
    def pba(opts)
      opts.delete(:style) if filter_styles
      opts.delete(:class) if filter_classes
      opts.delete(:id) if filter_ids

      atts = ''
      opts[:"text-align"] = opts.delete(:align)
      opts[:style] += ';' if opts[:style] && (opts[:style][-1..-1] != ';')
      [:float, :"text-align", :"vertical-align"].each do |a|
        opts[:style] = "#{a}:#{opts[a]};#{opts[:style]}" if opts[a]
      end
      [:"padding-right", :"padding-left"].each do |a|
        opts[:style] = "#{a}:#{opts[a]}em;#{opts[:style]}" if opts[a]
      end
      [:style, :class, :lang, :id, :colspan, :rowspan, :title, :start, :align].each do |a|
        atts << " #{a}=\"#{ opts[a] }\"" if opts[a]
      end
      atts
    end
    
    def ignore(opts)
      opts[:text]
    end
    alias_method :notextile, :ignore
    
    def redcloth_version(opts)
      p(:text => RedCloth::VERSION)
    end

  end
end
