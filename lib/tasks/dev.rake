namespace :dev do
  desc "Setup development"
  task setup: :environment do

    images_path = Rails.root.join('public','system')

    puts "Executando..."

    puts "Apagando o banco... #{%x(rake db:drop)}"
    puts "Criando o banco... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_authors)
    puts %x(rake dev:generate_editors)
    puts %x(rake dev:generate_books)
    puts %x(rake dev:generate_images)
    puts %x(rake dev:generate_lists)
    puts %x(rake dev:books_to_lists)
    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_authors: :environment do

    puts "Gerando autores aleatórios"

    10.times do
      date = Faker::Date.birthday(1, 100)
      Author.create!(
        name: Faker::Book.author,
        birth_date: date,
        death_date: date.next_year(Faker::Number.between(30,90))
        )
    end

    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_editors: :environment do

    puts "Gerando editoras aleatórias"

    10.times do
      Editor.create!(
        name: Faker::Book.publisher
        )
    end

    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_books: :environment do

    puts "Gerando livros aleatórios"

    100.times do
      pages = Faker::Number.between(50,1000)
      status = Faker::Number.between(1,3)
      if status == 1
        pages_read = pages
      elsif status == 2
        pages_read = Faker::Number.between(50,pages)
      else
        pages_read = 0
      end
      book = Book.create!(
        isbn: Faker::Code.isbn,
        title: Faker::Book.title,
        subtitle: Faker::Book.title,
        year: Faker::Number.between(1500,2018),
        published: Faker::Number.between(1500,2018),
        pages: pages,
        pages_read: pages_read,
        edition: Faker::Number.number(1),
        language: Faker::Book.genre,
        status: status,
        shelf: Faker::Number.between(1,3),
        editor: Editor.all.sample,
        author: Author.all.sample,
        user: User.first
      )
    end

    puts "[OK]"
  end

  ####################################################################
  desc "TODO"
  task generate_images: :environment do


    puts "Gerando images aleatórias"

    books = Book.all
    books.each do |book|
      n = Random.rand(9)
      addr = Rails.root.join("public", "templates","images", "#{n}.jpg")
      book.image.attach(
        io: File.open(addr),
        filename: "#{n}.jpg"
      )
    end

    puts "[OK]"
  end


  ####################################################################

  desc "TODO"
  task generate_lists: :environment do

    puts "Gerando listas aleatórias"

    x = 2010

    while x < 2018
      List.create!(
        year: x,
        user: User.first
      )
      x += 1
    end

    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task books_to_lists: :environment do

    puts "Gerando listas aleatórias"

    List.all.each do |list|
      10.times do
        list.books << Book.all.sample
      end
    end

    puts "[OK]"
  end

end
