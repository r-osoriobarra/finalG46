#UserTypes
2.times do |t|
    UserType.create!(
        name: t
    )
end

#User_categories
4.times do |c|
    Category.create!(
        name: c
    )
end

#Users
20.times do |u|
    User.create!(
        name:"name",
        surname:"surname",
        username:"username#{u}",
        email: "user#{u}@mail.com",
        password: "123123",
        password_confirmation:"123123",
        phone_number: "16452398",
        address: "Address user#{u} home",
        category_id: rand(1..4),
        user_type_id: 2,
    )
end

#admin
User.create!(
    name:"name",
    surname:"surname",
    username:"username",
    email: "admin@mail.com",
    password: "123123",
    password_confirmation:"123123",
    phone_number: "16452398",
    address: "Address admin home",
    category_id: rand(1..4),
    user_type_id: 1,
)

#Proyects
10.times do |p|
    Project.create!(
        name: "project #{p}",
        description: Faker::Lorem.paragraph,
        start_date: Date.today,
        industry: "Industry",
        website: "https://project#{p}.com",
        address: "Address pyme#{p}",
        user_id: rand(1..20)
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

#Causes
10.times do |c|
    Cause.create!(
        title: Faker::DcComics.title,
        story: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi nulla quisquam molestiae beatae pariatur, repellendus placeat aperiam cumque ducimus quibusdam excepturi ratione. Architecto delectus perferendis ut nesciunt placeat ratione cupiditate.
        Unde ullam expedita vel quas? Dignissimos dolores expedita cupiditate. Eos perferendis vitae porro deserunt vel. Quaerat molestias corrupti commodi voluptatibus reprehenderit fugiat magni rem libero quia cum, laboriosam ex tempore.
        Doloremque atque fuga, velit deleniti esse ea illum odio numquam eum, cupiditate, temporibus nisi neque perferendis itaque quod debitis libero consequuntur provident magnam? Harum hic voluptas cum dicta amet unde!
        Corporis ea sit unde dolorem consequuntur quo magni dignissimos alias consectetur aut impedit dolore ipsa obcaecati ullam voluptatum officiis, sed fugit exercitationem perferendis? Consequatur officia adipisci eligendi nostrum hic corrupti.
        Quos neque aperiam voluptates delectus ullam debitis ipsa non nam maiores voluptatem unde quas nesciunt fugiat vel, a harum nostrum nemo autem et ratione alias ex obcaecati beatae! Voluptatum, consectetur!
        Odio laborum molestiae repellendus necessitatibus reiciendis praesentium sapiente laboriosam ad expedita vitae nam corporis, architecto hic, ut quasi. Numquam hic doloribus dolore cum mollitia nobis distinctio reprehenderit facilis veritatis sed.
        Laudantium quisquam tempora ipsum fugit, autem facere minus ducimus quod corrupti voluptas suscipit vero aspernatur cumque hic culpa animi optio modi dolore, aliquam consequuntur exercitationem nesciunt numquam. Debitis, fugit saepe?
        Aut suscipit, molestiae amet ratione autem facere mollitia quasi tenetur rem et pariatur praesentium, aperiam magni veritatis reprehenderit dignissimos repudiandae. Ab facilis asperiores odio. Facere doloribus et quaerat cum veritatis.
        Rerum labore, quae voluptatem ad sed tempora deserunt placeat ducimus consectetur nemo vero cupiditate eum, at totam esse nisi molestiae eaque minima! Nobis soluta dolore maxime sint similique quia? Sint?
        Ipsa mollitia, libero architecto voluptatibus expedita veritatis, officiis perspiciatis iusto doloribus animi quod ex praesentium provident quam possimus. Qui dolore recusandae illo excepturi. Ab sed sint facilis? Rem, atque aut.',
        start_date: Date.today,
        end_date: Date.today + 30,
        goal:rand(100..5000),
        reward: "user offers a reward for the supports (discount)",
        project_id: c+1
    )
end

#causes_points
10.times do |c|
    CausePoint.create!(
        stock: Cause.find(c+1).goal,
        cause_id: (c+1),
        point_id: 1
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
10.times do |r|
    Report.create!(
        title: Faker::DcComics.title,
        description: Faker::Books::Lovecraft.sentences,
        accomplished: [true, false].sample,
        cause_id: (r+1)
    )
end
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