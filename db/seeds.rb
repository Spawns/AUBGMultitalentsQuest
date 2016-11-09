#Don't create more than one app config!
AppConfig.create(
    {
        keywords: 'Liberal arts competition' ,
        description: 'Annual liberal arts competition',
        yt_url: 'youtube.com' ,
        tw_url: 'twitter.com' ,
        fb_url: 'facbook.com' ,
        conf_start: DateTime.new(2016 , 3 ,4),
        conf_end: DateTime.new(2016, 3 , 5)

    })
if !Admin.first

  Admin.create!({ email: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD']})

end
if Page.count == 0
  Page.create({title: 'rules', content: '<p>No information yet. Come back later!</p>'})
  Page.create({title: 'accommodation', content: '<p>No information yet. Come back later!</p>'})
end
