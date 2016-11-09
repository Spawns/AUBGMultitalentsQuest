module AppConfigsHelper


  def app_keywords
   "#{AppConfig.keywords}"
   end


  def app_description
   "#{AppConfig.description}"
  end

  def conf_start(type)
    AppConfig.conf_start.send(type) if AppConfig.conf_start
  end

  def tw_url
    AppConfig.tw_url
  end

  def fb_url
   AppConfig.fb_url
 end

 def yt_url
  AppConfig.yt_url
 end

  def tos
    AppConfig.tos
  end

  def applications_open?
    AppConfig.app_process
  end
end
