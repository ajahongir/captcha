module CaptchaConfig
  
  IMAGE_CONFIG = 
    {
      :image_width => 240,
      :image_height => 50,
      :captcha_length => 5,
      :file_format => 'png'
    }

  IMAGE_PATH = "/system/captcha/"
  
  CAPTCHA_SETTING =
  {
    :digit => false,
    :lower => false
  }

  def self.chars
    chars_upper = %w(А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я)
    chars_lower = %w(а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я)
    chars_digit = (2..9).to_a

    chars_upper += chars_lower if CAPTCHA_SETTING[:lower]
    chars_upper += chars_digit if CAPTCHA_SETTING[:digit]
    chars_upper
  end

end

