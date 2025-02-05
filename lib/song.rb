class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical()
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    names = filename.split(' - ')
    sub_names = names[1].split('.')
    song.artist_name = names[0]
    song.name = sub_names[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    names = filename.split(' - ')
    sub_names = names[1].split('.')
    song.artist_name = names[0]
    song.name = sub_names[0]
    song
  end

  def self.destroy_all()
    @@all.clear
  end
end