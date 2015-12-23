class Fighter

attr_accessor :id, :first_name, :last_name, :weight_class, :weight, :current_record, :current_title, :hometown

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @weight_class = hash["weight_class"]
    @weight = hash["weight"]
    @current_record = hash["current_record"]
    @current_title = hash["current_title"]
    @hometown = hash["hometown"]
  end

  def self.find(id)
    fighter_hash = Unirest.get("http://0.0.0.0:3000/api/v1/fighters/#{id}.json").body
    Fighter.new(fighter_hash)
  end

  def self.all
    fighters = []
    fighter_hashes = Unirest.get("http://0.0.0.0:3000/api/v1/fighters.json").body
    fighter_hashes.each do |fighter_hash|
      Fighter.new(fighter_hash)
      fighters << Fighter.new(fighter_hash)
    end
    return fighters
  end

  def self.create(attributes)
    fighter_hash = Unirest.post("http://0.0.0.0:3000/api/v1/fighters.json", headers: {"Accept" => "application.json"}, parameters: attributes).body
    Fighter.new(fighter_hash)
  end

  def self.update(attributes)
    fighter_hash = Unirest.patch("http://0.0.0.0:3000/api/v1/fighters.#{id}.json", headers: {"Accept" => "application.json"}, parameters: attributes).body
    Fighter.new(fighter_hash)
  end

  def destroy
    Unirest.delete("http://0.0.0.0:3000/api/v1/fighters/#{id}.json").body

  end


end