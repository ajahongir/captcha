require 'digest/sha1'

module CaptchaUtil

  def self.image
    FileUtils.mkdir_p("public#{CaptchaConfig::IMAGE_PATH}")
    Dir.chdir("public#{CaptchaConfig::IMAGE_PATH}") do
      CaptchaImageGenerator::generate_captcha_image
    end
  end

  def self.encrypt_string(string)
    salt = 'This really should be random'

    if defined?(CAPTCHA_SALT)
      salt = CAPTCHA_SALT
    else
      Rails.logger.warn("No salt defined, please add CAPTHCA_SALT = 'Something really random' to environment.rb")
    end  

    Digest::SHA1.hexdigest("#{salt}#{string}")
  end

end
