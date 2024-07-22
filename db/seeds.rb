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
    User.find_or_create_by(email: "user#{u}@mail.com") do |user|
      user.name = "name"
      user.surname = "surname"
      user.username = "username#{u}"
      user.password = "123123"
      user.password_confirmation = "123123"
      user.phone_number = "16452398"
      user.address = "Address user#{u} home"
      user.category_id = rand(1..4)
      user.user_type_id = 2
    end
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
20.times do |p|
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
prices = [10, 20, 30, 40]
names = ["Apaña Punto", "Super Punto", "Mega Punto", "Hiper Punto"]

names.each_with_index do |name, index|
  Point.create!(
    name: name,
    price: prices[index]
  )
end


#Causes
test_image = [
    "https://uddventures.udd.cl/hubfs/almacenguru-1.jpg",
    "https://finde.latercera.com/wp-content/uploads/2019/01/Bakery-Lynch-de-chef-y-hoteles-700x450.jpg",
    "https://i.pinimg.com/originals/61/bd/03/61bd03f7b5e6aefbff39afa43320f5cc.jpg",
    "https://media.elmostrador.cl/2021/08/verdulerias-tamed-foods.png",
    "https://media-cdn.tripadvisor.com/media/photo-s/06/2c/29/70/getlstd-property-photo.jpg",
    "https://pqs.pe/wp-content/uploads/2021/02/PQS-Emporio-comercial-de-Gamarra-oferta-prendas-a-bajos-precios.jpg",
    "https://emprendeconhuevos.com/wp-content/uploads/2019/09/heladeria_plan.jpg",
    "https://www.100plandenegocios.com/wp-content/uploads/2013/11/plan-de-negocio-para-peluqueria.jpg"
]



20.times do |c|
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
        end_date: Date.today + rand(30..60),
        goal:rand(500..2000),
        reward: "10% en la primera compra de mi tienda. 50% de descuento en cualquier producto a los 5 primeros donadores.",
        project_id: c+1,
        cause_img: test_image[rand(0..(test_image.size-1))]
    )
end

#Donations
causes = Cause.all
causes.each do |cause|
    10.times do
      point = Point.order("RANDOM()").first
      Donation.create!(
        user_id: 1,
        cause: cause,
        point: point,
        amount: rand(1..10) * point.price,
        status: :approved
      )
    end
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

# <div id="img-2" class="carousel-item">
# <img src="https://uddventures.udd.cl/hubfs/almacenguru-1.jpg" alt="" class="d-block w-100">
# </div>
# <div class="carousel-item">
# <img id="img-3" src="https://res.cloudinary.com/civico/image/upload/c_fit,f_auto,fl_lossy,h_1200,q_auto:low,w_1200/v1565805624/brand/image/5d544c322f41f3d1c30006cc.jpg" alt="" class="d-block w-100">
# </div>