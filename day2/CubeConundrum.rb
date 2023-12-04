# Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes
file_name = 'input.txt'

class DayTwo
    @@red_cubes_qty = 12
    @@green_cubes_qty = 13
    @@blue_cubes_qty = 14

    def initialize(file_path)
        @file_path = file_path
    end

    def solve_first_case()
        index_sum = 0
        File.foreach(@file_path) do |line|
            puts line
            is_valid_game = false
            game_descriptor, games_line = line.split(":")
            game_number = game_descriptor.match(/Game (\d+)/)[1].to_i
            rounds = games_line.split(";")
            puts "Rounds:"
            for single_round in rounds
                red_cubes_drawn = (single_round.match(/(\d+)\s+red/) ? single_round.match(/(\d+)\s+red/)[1].to_i : 0) 
                green_cubes_drawn = (single_round.match(/(\d+)\s+green/) ? single_round.match(/(\d+)\s+green/)[1].to_i : 0) 
                blue_cubes_drawn = (single_round.match(/(\d+)\s+blue/) ? single_round.match(/(\d+)\s+blue/)[1].to_i : 0) 
                puts "#{single_round}"

                if red_cubes_drawn <= @@red_cubes_qty && green_cubes_drawn <= @@green_cubes_qty && blue_cubes_drawn <= @@blue_cubes_qty
                    is_valid_game = true
                    puts "Round is possible!"
                else
                    is_valid_game = false
                    puts "Round is not possible!"
                    break
                end
           end
        
           if is_valid_game
            puts "Game #{game_number} is possible!"
            index_sum += game_number
           else
            puts "Game #{game_number} is not possible!"
           end

           puts "Sum of possible games index: #{index_sum}"
        end
    end

    def solve_second_case()
        powers_sum = 0
        File.foreach(@file_path) do |line|
            puts line
            _, games_line = line.split(":")
            rounds = games_line.split(";")
            fewest_red_cubes, fewest_green_cubes, fewest_blue_cubes  = 0, 0, 0

            puts "Rounds:"
            for single_round in rounds
                red_cubes_drawn = (single_round.match(/(\d+)\s+red/) ? single_round.match(/(\d+)\s+red/)[1].to_i : 0) 
                green_cubes_drawn = (single_round.match(/(\d+)\s+green/) ? single_round.match(/(\d+)\s+green/)[1].to_i : 0) 
                blue_cubes_drawn = (single_round.match(/(\d+)\s+blue/) ? single_round.match(/(\d+)\s+blue/)[1].to_i : 0) 
                puts "#{single_round}"

                fewest_red_cubes = red_cubes_drawn > fewest_red_cubes ? red_cubes_drawn : fewest_red_cubes
                fewest_green_cubes = green_cubes_drawn > fewest_green_cubes ? green_cubes_drawn : fewest_green_cubes
                fewest_blue_cubes = blue_cubes_drawn > fewest_blue_cubes ? blue_cubes_drawn : fewest_blue_cubes
            end

            power = fewest_red_cubes * fewest_green_cubes * fewest_blue_cubes
            powers_sum +=power

            puts "fewest_red_cubes: #{fewest_red_cubes}"
            puts "fewest_green_cubes: #{fewest_green_cubes}"
            puts "fewest_blue_cubes: #{fewest_blue_cubes}"
            puts "power: #{power}"
            puts "power sum: #{powers_sum}"
        
        end
    end
end


first_case = DayTwo.new(file_name)
first_case.solve_first_case()
first_case.solve_second_case()