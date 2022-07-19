require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
puts " "

print ">"
name_to_save = gets.chomp
user= HumanPlayer.new(name_to_save)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0) do
    #(player1.life_points > 0 || player2.life_points >0) 
    puts " "
    puts "----------------------------------------------"
    puts "Quelle action veux tu effectuer? :"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"
    puts " "
    print ">"
    input = gets.chomp
        if input == 'a'
            user.search_weapon
        elsif input == 's'
            user.search_health_pack
        elsif input == '0'
            user.attacks(player1)
        elsif input == '1'
            user.attacks(player2)
        end
    
    puts " "
    puts "Les autres joueurs t'attaquent !"

    enemies.each do |x|
        x.attacks(user)
        if user.life_points == 0
            break
        end
    end
end