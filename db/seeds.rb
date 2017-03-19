# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Blog.create!(
    title: "My blog Post #{i}",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting
    industry. Lorem Ipsum has been the industry's standard dummy text ever
    since the 1500s, when an unknown printer took a galley of type and
    scrambled it to make a type specimen book. It has survived not only five
    centuries, but also the leap into electronic typesetting, remaining
    essentially unchanged. It was popularised in the 1960s with the release of
    Letraset sheets containing Lorem Ipsum passages, and more recently with
     desktop publishing software like Aldus PageMaker including versions of
     Lorem Ipsum."
  )
end

puts "10 blog posts creatred"

5.times do |i|
  Skill.create!(
    percent_utilized:  (Random.rand(10) + 1)*10,
    title: "Rails #{i}"
  )
end
puts "5 skills  creatred"


9.times do |i|
  Portfolio.create!(
    title:  "Portfolio title #{i}",
    subtitle: "My great service #{i}",
    body: "It is a long established fact that a reader will be distracted by
    the readable content of a page when looking at its layout.
    The point of using Lorem Ipsum is that it has a more-or-less normal
    distribution of letters, as opposed to using 'Content here, content
    here', making it look like readable English. Many desktop publishing
    packages and web page editors now use Lorem Ipsum as their default model
    text, and a search for 'lorem ipsum' will uncover many web sites still in
    their infancy. Various versions have evolved over the years, sometimes by
    accident, sometimes on purpose (injected humour and the like).",
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200'
  )
end

puts "9 portfolio items creatred"
