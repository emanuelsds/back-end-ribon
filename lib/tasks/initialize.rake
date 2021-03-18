namespace :initialize do
  desc 'Putting monsters in DB'
  task monsters: :environment do
    Monster.create(name: 'Goomba', coins: 10)
    Monster.create(name: 'Buzzy beetle', coins: 10)
    Monster.create(name: 'Koopa troopa', coins: 10)
    Monster.create(name: 'Bowser', coins: 50)
    Monster.create(name: 'Meowser', coins: 50)
    puts 'Done!'
  end
end
