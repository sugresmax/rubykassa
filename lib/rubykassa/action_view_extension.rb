module Rubykassa
  module ActionViewExtension
    def pay_url(phrase, invoice_id, total, receipt, options = {}, &block)
      total, invoice_id = total.to_s, invoice_id.to_s
      extra_params  = options.except :custom, :html
      custom_params = options[:custom] ||= {}
      html_params = options[:html] ||= {}
      url = Rubykassa.pay_url invoice_id, total, receipt, custom_params, extra_params
      if block_given?
        link_to phrase, url, html_params, &block
      else
        link_to phrase, url, html_params
      end
    end
  end
end
