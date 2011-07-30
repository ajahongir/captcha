require 'digest/sha1'

module CaptchaUtil

  def self.image
    FileUtils.mkdir_p("public#{CaptchaConfig::IMAGE_PATH}")
    Dir.chdir("public#{CaptchaConfig::IMAGE_PATH}") do
      CaptchaImageGenerator::generate_captcha_image
    end
  end

  def self.encrypt_string(string)
    salt = 'Что не будь случайное...'

    if defined?(CAPTCHA_SALT)
      salt = CAPTCHA_SALT
    else
      Rails.logger.warn("Соль не указан, добавить CAPTHCA_SALT = 'Что не будь' в environment.rb")
    end  

    Digest::SHA1.hexdigest("#{salt}#{string}")
  end

end
