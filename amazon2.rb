class Category

  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end

class Author

  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end

class Book

  def initialize(name, category, author)
    @name = name
    @category = category
    @author = author
  end

  attr_accessor :name, :category, :author

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end

thriller = Category.new("Thriller")
classics = Category.new("Classics")
romance = Category.new("Romance")


michael_connelly = Author.new("Michael Connelly")
karin_slaughter = Author.new("Karin Slaughter")
patricia_cronwell = Author.new("Patricia Cronwell")
john_grisham = Author.new("John Grisham")
lee_child = Author.new("Lee Child")
harlan_coben = Author.new("Harlan Coben")
james_patterson = Author.new("James Patterson")
hemingway = Author.new("Ernest Hemingway")
fitzgerald = Author.new("F. Scott Fitzgerald")
conrad = Author.new("Josef Conrad")
steinbeck = Author.new("John Steinbeck")
dick = Author.new("Philip K. Dick")
lauren_oliver = Author.new("Lauren Oliver")
emily_bronte = Author.new("Emily Bronte")
william_shakespeare = Author.new("William Shakespeare")
nicholas_sparks = Author.new("Nicholas Sparks" )
stephenie_meyer = Author.new("Stephenie Meyer")
audrey_niffenegge = Author.new("Audrey Niffenegger")
charlaine_harris = Author.new("Charlaine Harris")
diana_gabaldon = Author.new("Diana Gabaldon")
jennifer_cruise = Author.new("Jennifer Cruise")

Book.new("Wuthering Heights", romance, emily_bronte)
Book.new("Romeo and Juliet", romance, william_shakespeare)
Book.new("The Notebook", romance, nicholas_sparks)
Book.new("Twiglight", romance, stephenie_meyer)
Book.new("The Time Traveler's Wife", romance, audrey_niffenegge)
Book.new("Dead Until Dark", romance, charlaine_harris)
Book.new("Drums of Autumn", romance, diana_gabaldon)
Book.new("Bet Me", romance, jennifer_cruise)
Book.new("Heart of Darkness", classics, conrad)
Book.new("The Great Gatsby", classics, fitzgerald)
Book.new("Tender is the Night", classics, fitzgerald)
Book.new("Of Mice & Men", classics, steinbeck)
Book.new("The Grapes of Wrath", classics, steinbeck)
Book.new("A Farewell to Arms", classics, hemingway)
Book.new("Old man and the Sea", classics, hemingway)
Book.new("Do Androids Dream of Electric Sheep?", classics,steinbeck)
Book.new("The Man in the High Castle", classics, steinbeck)
Book.new("Along Came a Spider", thriller, james_patterson)
Book.new("Kiss The Girls", thriller, james_patterson)
Book.new("Killing Floor", thriller, lee_child)
Book.new("Night School", thriller, lee_child)
Book.new("Tell No One", thriller, harlan_coben)
Book.new("Deal Breaker", thriller, harlan_coben)
Book.new("Post Mortem", thriller, patricia_cronwell)
Book.new("Scarpetta", thriller, patricia_cronwell)
Book.new("A Time To Kill", thriller, john_grisham)
Book.new("The Firm", thriller, john_grisham)
Book.new("The Pelican Brief", thriller, john_grisham)
Book.new("The Lincoln Lawyer", thriller, michael_connelly)
Book.new("The Drop", thriller, michael_connelly)
Book.new("Blindsighted", thriller, karin_slaughter)
Book.new("The Kept Woman", thriller, karin_slaughter)
Book.new("Delirium", romance, lauren_oliver)

runner = 0

@sample = []
@jon = []
def random_sample

  @sample.each_with_index do |sample, index|
    puts "[#{index + 1}] #{sample}"
  end
  runner = 1
  while runner == 1

    puts "Which of these books would you like to try"
    ans = gets.chomp.to_i

    if ans == 1
      @jon << {@sample[0][0] => @sample[0][1]}
      @sample = []
      runner = 2

    elsif ans == 2
      @jon << {@sample[1][0] => @sample[1][1]}
      @sample = []
      runner = 2
    elsif ans == 3
      @jon << {@sample[2][0] => @sample[2][1]}
      @sample = []
      runner = 2
    else
      system("clear")
      puts "Invalid choice. Please select a number between 1-3"
      runner = 1
    end
  end

  while runner == 2
    puts "What would you like to read next?"
    runner = 0
  end

end


while runner == 0

  puts "What type of book would you like to read?"

  Category.all.each do |category, index|
    puts "#{category.name}"
  end

  puts "[4] Exit"
  answer = gets.chomp.to_i

  puts answer

  if answer == 1
    system("clear")
    puts "We have selected the following three romance"
    puts "books for you to try:"

    romance_list.sample(3).each do |i|
      @sample << i
    end

    random_sample
    puts "Your library consists of #{@jon}"


  elsif answer == 2
    system("clear")
    puts "We have selected the following three thriller"
    puts "books for you to try:"

    thriller_list.sample(3).each do |i|
      @sample << i
    end

    random_sample

    puts "Your library consists of #{@jon}"

  elsif answer == 3
    system("clear")
    puts "We have selected the following three classics"
    puts "books for you to try:"

    classics_list.sample(3).each do |i|
      @sample << i
    end

    random_sample

    puts "Your library consists of #{@jon}"

  elsif answer == 4
    File.open("test.txt", "w+") do |f|
      @jon.each { |element| f.puts(element) }
    end
    abort
  else
    system("clear")
    puts "Invalid choice. Please select a number between 1-3"
  end

end
