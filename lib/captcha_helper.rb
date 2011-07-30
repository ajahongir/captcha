module CaptchaHelper
    
   def captcha_image(options = {})
      @captcha_image ||= CaptchaUtil::image
      image_tag(CaptchaConfig::IMAGE_PATH  + @captcha_image, options)
   end
   
   def captcha_input_text(label, options = {})
      @captcha_image ||= CaptchaUtil::image
      content_tag('label', label, :for => 'captcha') + text_field_tag(:captcha, nil, options)
   end
   
   def captcha_hidden_text
      @captcha_image ||= CaptchaUtil::image
      hidden_field_tag(:captcha_validation, @captcha_image.gsub(/\..+$/,''))
   end
   
   def show_captcha(label = 'Пожалуйста, введите символы на картинке:')
      content_tag('div', captcha_hidden_text + captcha_input_text(label) + captcha_image, { :class => 'captcha' })
   end
   
end

