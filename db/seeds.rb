# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Skill.destroy_all
Post.destroy_all
Need.destroy_all
Organisation.destroy_all
User.destroy_all

puts "populate database with users.."

user_photos =  [
  "https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/2406949/pexels-photo-2406949.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/1081685/pexels-photo-1081685.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/3746276/pexels-photo-3746276.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://i0.wp.com/news.globallandscapesforum.org/wp-content/uploads/2021/02/Sonia-Guajajara-nofilter.jpg?fit=444%2C592&ssl=1",
  "https://deolhonosruralistas.com.br/wp-content/uploads/2019/02/mulheresindigenas-kerexu.jpg"
]

user_photos.each do |user_photo|
  file = URI.open(user_photo)
  user = User.new(
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  description: Faker::Quote.yoda,
                  email: Faker::Internet.email,
                  password: 123456,
                )
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!

  puts "#{user.first_name} was successfully saved."

  skill = Skill.new(
    name: Skill::SKILLS_AND_ICONS.keys,
    user_id: User.all.sample.id,
    description: Faker::Quote.most_interesting_man_in_the_world
  )

  skill.save!

  puts "Skill with #{skill.id} was successfully saved."
end

puts "populate database with organisations.."

orga1 = Organisation.new(
  name: "APIB - Articulation of Indigenous Peoples of Brazil",
  address: "Brazil",
  description: "Apib is an instance of national reference of the indigenous movement in Brazil,
  created from the bottom up. It brings together our indigenous regional organizations and
  was born with the purpose of strengthening the unity of our peoples, the articulation
  between the different indigenous regions and organizations in the country,
  in addition to mobilizing indigenous peoples and organizations against threats
  and aggressions against indigenous rights.",
  website: "https://apiboficial.org/?lang=en",
  user_id: User.all.sample.id,
  email: "apib@oficial.br"
)

orga1.photo.attach(
  io: URI.open("https://apiboficial.org/files/2022/01/C%C3%ADcero-Bezerra-_-@cicerone.bezerra-2-400x250.jpeg"),
  filename: "#{orga1.name}.png",
  content_type: "image/png"
)
orga1.save!

# },
orga2 = Organisation.new(
  name: "Amazon Watch",
  address: "Amazonia",
  description: "Amazon Watch is a nonprofit organization founded in 1996 to protect
  the rainforest and advance the rights of Indigenous peoples in the Amazon Basin in
  Ecuador, Peru, Colombia, and Brazil. We work in solidarity with Indigenous and e
  nvironmental organizations in campaigns for human rights, corporate accountability,
  and the preservation of the Amazon’s ecological systems.

  The Amazon is home to 400 distinct Indigenous peoples who are its best stewards.
  The Amazon River Basin is the planet’s largest tropical rainforest.
  A stabilizer of the global climate, it contains one-third of all species on Earth
  and a large percentage of the world’s flowing fresh water. The forest and its peoples
  are facing grave threats due to deforestation, resource extraction, land grabs, and
  destructive development projects. At Amazon Watch, we are launching bold, strategic,
  and timely actions to advance and amplify the solutions of Indigenous peoples.",
  website: "https://amazonwatch.org/",
  user_id: User.all.sample.id,
  email: "amazon@watch.org"
)

orga2.photo.attach(
  io: URI.open("https://amazonwatch.org/wp-content/uploads/2021/10/20.jpg"),
  filename: "#{orga2.name}.png",
  content_type: "image/png"
)
orga2.save!

orga3 = Organisation.new(
  name: "COIAB",
  address: "Brasil",
  description: "A missão da COIAB é defender os direitos dos povos indígenas a terra,
  saúde, educação, cultura e sustentabilidade, considerando a diversidades de povos,
  e visando sua autonomia através de articulação política e fortalecimento das
  organizações indígenas.",
  website: "https://coiab.org.br",
  user_id: User.all.sample.id,
  email: "coiab@brazil.br"
)

orga3.photo.attach(
  io: URI.open("https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1662065717048x135844437173360700%2FDSC01607-Jo%25C3%25A3o%2520Albuquerque_ISA.%2520Aldeia%2520Jaguapiru_Br%25C3%25B4%2520MCs.jpg?w=1024&h=589&auto=compress&dpr=2&fit=max"),
  filename: "#{orga3.name}.png",
  content_type: "image/png"
)
orga3.save!

orga4 = Organisation.new(
  name: "Instituto Raoni",
  address: "Brasil",
  description: "Nós, comunidades Mẽbêngôkre (ou Kayapó) criamos, em 2001, o Instituto Raoni
  para defender os interesses do nosso povo. O IR é uma Organização da Sociedade Civil de
  Interesse Público, sem fins lucrativos e de caráter associativo e apartidário localizada
  na cidade de Peixoto de Azevedo (MT). Hoje representamos não apenas comunidades do povo Kayapó,
  mas também dos povos Trumai, Tapayuna e Panará, para o acesso a políticas públicas e
  captação de recursos para fortalecer nossas atividades culturais, nossa produção de
  alimentos, nossa geração de renda e a proteção dos nossos territórios e direitos.",
  website: "https://institutoraoni.org.br",
  user_id: User.all.sample.id,
  email: "instituto@raoni.br"
)

orga4.photo.attach(
  io: URI.open("https://institutoraoni.org.br/site/wp-content/uploads/2020/07/0718-nota-raoni-800x533.jpeg"),
  filename: "#{orga3.name}.png",
  content_type: "image/png"
)
orga4.save!

orga5 = Organisation.new(
  name: "Alianza Ceibo",
  address: "Ecuador",
  description: "Con las fuentes de agua contaminadas, los niños y niñas comenzaron a enfermar.
  Por esa razón decidimos construir sistemas de agua lluvia para poder tomar agua pura en las comunidades.
  Trabajamos entre cuatro nacionalidades y así nos fuimos conociendo. Vimos que todos teníamos problemas y
  experiencias similares, y aunque somos distintos, nos dimos cuenta de que existen muchas cosas que nos unen.
  De esta amistad surgió la “Alianza Ceibo”, que es una alianza conformada por personas de
  los pueblos A’i Kofan, Siona, Siekopai y Waorani, que trabaja unida para llevar alegría y salud
  a nuestras comunidades.",
  website: "https://www.alianzaceibo.org/",
  user_id: User.all.sample.id,
  email: "alianza@ceibo.ec"
)

orga5.photo.attach(
  io: URI.open("https://www.alianzaceibo.org/m3di4/WhatsApp-Image-2022-01-27-at-10.37.19-AM.jpeg"),
  filename: "#{orga3.name}.png",
  content_type: "image/png"
)
orga5.save!

orga6 = Organisation.new(
  name: "Mujeres Amazonicas",
  address: "Amazonia",
  description: "Somos un colectivo de Mujeres Amazónicas unidas con el único fin de defender la Selva,
  la vida y nuestras culturas para las futuras generaciones. Formamos el grupo mujeres de 6 nacionalidades
  indígenas de la Amazonia Ecuatoriana: Achuar, Shuar, Shiwiar, Kichwa, Sápara y Waorani.",
  website: "https://www.mujeresamazonicas.net/",
  user_id: User.all.sample.id,
  email: "mujeres@amazonicas.org"
)

orga6.photo.attach(
  io: URI.open("https://static.wixstatic.com/media/147184_5032913666c74ed28ffbc6ecd2ffcc2e~mv2.jpg/v1/fill/w_848,h_606,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Screenshot%202022-03-05%20211612_edited.jpg"),
  filename: "#{orga3.name}.png",
  content_type: "image/png"
)
orga6.save!

p "Created #{Organisation.count} Organisations"

post_photos = ["https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1652730513714x993127332238169100%2Fartigo_card_not%25C3%25ADcias_eloy_site.png?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://www.survivalinternational.org/assets/numiko/photos-min/tribal-lad-holding-wood-1000w@2x-min-387e14965de6fa45e1366787b1fe502e51b16b6c57e583278d802a846810ab89.jpg", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1646853185699x344022660352913540%2FDestaque_site_Reuters.png?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1647273943986x479408472826475400%2FFoto_Orlando_K._J%25C3%25BAniorObservat%25C3%25B3rio_BR-319.png?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1636581032139x935986165927751400%2Fsite%2520txai.png?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1625681315567x579281007887117000%2Fdestaque%2520site_foto%2520eric%2520marky%2520mi%25CC%2581dia%2520i%25CC%2581ndia.png?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1620754233405x229092586265238430%2FFoto_-_The_Guardian_International_Rivers.jpeg.jpg?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://www.alianzaceibo.org/m3di4/siona2.jpg", "https://www.alianzaceibo.org/m3di4/siona1.jpg", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1655401451949x428328434649680060%2Fnota%2520de%2520pesar%2520bruno%2520e%2520dom%2520coiab%2520copiarsite.jpg?w=1024&h=589&auto=compress&dpr=2&fit=max", "https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1656341324297x528478230705724740%2Fnota%2520de%2520rep%25C3%25BAdio.jpg?w=1024&h=589&auto=compress&dpr=2&fit=max"]

Organisation.all.each do |org|
  need = Need.new(
    name: Need::NEEDS_AND_ICONS.keys,
    organisation: org,
    description: Faker::Quote.matz
  )
  need.save!
  puts "Need with #{need.id} was successfully saved."

  post_photos.each do |post_photo|
    file = URI.open(post_photo)
    post = Post.new(
      title: Faker::Book.title,
      organisation: org,
      content: Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    )
    post.photo.attach(io: file, filename: "#{post.id}.png", content_type: "image/png")
    post.save!

    puts "Post with #{post.title} was successfully saved."
  end
end

puts 'All seeds planted successfully'
