class Player
    attr_accessor :life_points, :name
    @@enemies = []
  
    def initialize(name_to_save)
      @name = name_to_save
      @life_points = 10
      @@enemies << self
    end

    def self.all
        return @@enemies
    end

    def show_state
        "#{@name} a #{life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if life_points <= 0 
            puts "le joueur #{@name} a été tué !" 
        end
    end

    def attacks(name_input)
        puts "le joueur #{@name} attaque le joueur #{name_input.name}"
        damage = compute_damage
        puts "il lui inflige #{damage} points de dommages"
        name_input.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end

end
  
class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        "#{@name} a #{life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > @weapon_level
            return @weapon_level = new_weapon_level 
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)  
        if health_pack == 1
           puts "Tu n'as rien trouvé... "
        elsif health_pack >= 2 && health_pack <= 5
            life_points >=50 ? life_points = 100 : life_points = life_points + 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else 
            life_points >=20 ? life_points = 100 : life_points = life_points + 80
            "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end
