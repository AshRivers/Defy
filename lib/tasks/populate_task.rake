namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_plots
    make_stp
    make_ways
  end
end

def make_users
  admin = User.create!(:name => "Exe",
               :email => "example@exe.ru",
               :password => "foobar123",
               :password_confirmation => "foobar123")
  admin.toggle!(:admin)

  # 36.times do |n|
  #   name  = Faker::Name.name
  #   email = "example-#{n+1}@railstutorial.org"
  #   password  = "password"
  #   User.create!(:name => name,
  #                :email => email,
  #                :password => password,
  #                :password_confirmation => password)
  # end
end

def make_plots
  user = User.find_by_name("Exe")
      user.plots.create!(name: "Django")
  # end
end

def make_stp
  plot = Plot.first
  plot.storypoints.create(name: 'Start_point',
                            story: 'The world around us is not what you expect it to be'
                                                  )
  start = Storypoint.find_by_name("Start_point")
  plot.storypoints.create(name: 'Fast_end',
                            story: 'COntinue living, then'
                                                  )
  
  plot.storypoints.create(name: 'Continue_point',
                           story: 'I was just like you. But then world punch me in a  face'
                                                  )
  plot.storypoints.create(name: 'End_point',
                            story: 'And I open my eyes'
                                                  )
  plot.update_attributes(first_stp: start.id) 

end

def make_ways
  start_point = Storypoint.find_by_name("Start_point")
  fast_end = Storypoint.find_by_name('Fast_end')
  continue_point = Storypoint.find_by_name('Continue_point')
  end_point = Storypoint.find_by_name('End_point')
  start_point.ways.create(to_storypoint: continue_point.id,
                            with_text: 'I believe in newspapers')
  continue_point.ways.create(to_storypoint: end_point.id,
                            with_text: 'And what did you do?')
  start_point.ways.create(to_storypoint: fast_end.id,
                            with_text: 'I dont have time for it')

end

