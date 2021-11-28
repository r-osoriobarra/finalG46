#UserTypes
#(0: admin, 1:founder (default), 2:entrepeneur)
3.times do |t|
    UserType.create!(
        name: t
    )
end

#User_categories
4.times do |c|
    UserCategory.create!(
        name: c
    )
end

#Users
#founders
15.times do |u|
    User.create!(
        name:"name",
        surname:"surname",
        username:"username#{u}",
        email: "user#{u}@mail.com",
        password: "123123",
        password_confirmation:"123123",
        phone_number: "16452398",
        address: "Address user#{u} home",
        user_category_id: rand(1..4),
        user_type_id: 1,
    )
end

#entrepeneurs
5.times do |u|
    User.create!(
        name:"name",
        surname:"surname",
        username:"username#{u}",
        email: "user#{u}@mail.com",
        password: "123123",
        password_confirmation:"123123",
        phone_number: "16452398",
        address: "Address user#{u} home",
        user_category_id: rand(1..4),
        user_type_id: 2,
    )
end

#admin
User.create!(
    name:"name",
    surname:"surname",
    username:"username#{u}",
    email: "admin@mail.com",
    password: "123123",
    password_confirmation:"123123",
    phone_number: "16452398",
    address: "Address admin home",
    user_category_id: rand(1..4),
    user_type_id: 0,
)

#PymeProyects
10.times do |p|
    PymeProyects.create!(
        name: "project #{p}",
        description: Faker::Lorem.paragraph,
        start_date: Date.today,
        industry: "Industry"
        website: "https://project#{p}.com"
        address: "Address pyme#{p}",
        user_id: rand(15..20)
    )
end

#Causes
10.times do |c|
    Cause.create!(
        title: Faker::DcComics.title,
        story: Faker::Lorem.paragraph,
        start_date: Date.today,
        end_date: Date.today + 30,
        reward: "user offers a reward for the supports (discount)",
        pyme_project: c
    )
end


#Points seed
base = 1000
prices = [
    base, 
    base*2,
    base*3,
    base*4  
]

4.times do |p|
    Point.create!(
        name: p,
        price: prices[p]
    )
end

#causes_points
10.times do |c|
    CausePoint.create!(
        goal:rand(100..5000),
        cause_id: c,
        point_id: 0
    )   
end

#Comments
30.times do |comment|
    Comment.create!(
        comment: Faker::Quotes::Shakespeare.hamlet_quote,
        user_id:rand(1..21),
        cause_id:rand(1..10)
    )
end

#reports
Report.create!(
    title: Faker::DcComics.title,
    description: Faker::Books::Lovecraft.sentences;
    accomplished: [true, false].sample
)

#Order
5.times do |o|
    Order.create(
        user_id: rand(1..21),
        total: rand(1000..2000),
        state: "completed",
        created_at: Faker::Date.between(from: 7.days.ago, to: Date.today)
    )
end

#PaymentMethod seed
PaymentMethod.create!(name: "Paypal Express Checkout", code: "PEC")