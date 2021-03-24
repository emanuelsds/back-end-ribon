FactoryBot.define do
  factory :killed_monster do
    association :user
    association :monster
    factory :killed_monsters do
      id { nil }
      user_id { 1 }
      monster_id { 1 }
    end
  end
  
  factory :death do
    association :user
  end

  factory :monster do
    name { 'Bowser' }
    coins { nil }
  end

  factory :collected_coin do
    association :user
    value { 0 }
  end

  factory :trophy do
    association :user
    level { 1 }
    trophy { 'testing' }
  end

  factory :user do
    name { Faker::Name.first_name }
    coins { 0 }
    factory :user_with_killed_monsters do
      transient do
        killed_monsters_count{ 100 }
      end

      after(:create) do |user, evaluator|
        monster = create(:monster)
        create_list(:killed_monster, evaluator.killed_monsters_count, user: user, monster: monster)
      end
    end

    factory :user_with_deaths do
      transient do
        deaths_count { 10 }
      end

      after(:create) do |user, evaluator|
        create_list(:death, evaluator.deaths_count, user: user)
      end
    end

    factory :user_with_coins do
      transient do
        user_coins { -25 }
        coins_count { 0 }
      end

      after(:create) do |user, evaluator|
        user.update(coins: evaluator.user_coins)
        create(:collected_coin, value: 25, user: user)
      end
    end
  end
end
