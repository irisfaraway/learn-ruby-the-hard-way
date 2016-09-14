class Scene
  def enter
    puts 'This is the default scene.'
  end

  def ask_for_input
    print '> '
    @input = $stdin.gets.chomp
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play
    current_scene = @scene_map.opening_scene
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter
  end
end

class Death < Scene
  def enter
    puts 'You died.'
    exit(1)
  end
end

class CentralCorridor < Scene
  def enter
    puts "Oh crap! Aliens are in your ship and it's real embarrassing."
    puts 'You need to blow up the ship and escape.'
    puts "You're in the central corridor of your ship."
    puts "There's a gothon in front of you. He smells bad."
    puts "Do you want to 'fight', 'run' or 'joke'?"

    ask_for_input

    if @input == 'fight'
      puts 'You reach for your blaster. The gothon shoots first.'

      return 'death'
    elsif @input == 'run'
      puts 'You try to leg it. The gothon eats you.'

      return 'death'
    elsif @input == 'joke'
      puts '"Hey buddy," you say. "What do you call an alligator in a vest?"'
      puts "'I don't know, what?' says the gothon."
      puts "'An investigator!'"
      puts 'The gothon dies because that joke was so bad.'

      return 'laser_weapon_armory'
    else
      puts 'I have no idea what you are talking about.'
      puts "Let's try that again..."

      return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene
  def enter
    puts "Sweet, you've made it to the armory."
    puts "There's a 1 digit code on the door." # 'cos guessing 3 digits is ridic
    puts 'You have forgotten your LastPass password.'

    code = rand(0..9)

    ask_for_input

    while @input.to_i != code
      puts 'Guess again!'
      ask_for_input
    end

    puts 'Nailed it! You grab a bomb and run.'

    return 'the_bridge'
  end
end

class TheBridge < Scene
  def enter
    puts "You've made it to the bridge. It's bomb time!"
    puts 'Uh oh. A gothon is here.'
    puts "Do you want to 'punch' or 'kick' the gothon?"

    gothon_hits = 0

    while gothon_hits < 10
      ask_for_input
      if @input == 'punch'
        gothon_hits += 1
        puts 'You punch the gothon.'
      elsif @input == 'kick'
        gothon_hits += 1
        puts 'You kick the gothon.'
      else
        puts 'You miss.'
      end
    end

    puts 'You killed the gothon.'
    puts 'It was a living being, with thoughts and dreams.'
    puts 'You place the bomb and get out of here.'

    return 'escape_pod'
  end
end

class EscapePod < Scene
  def enter
    puts 'You reach the escape pods.'
    puts 'They all work fine because to hell with RNG.'
    puts 'You get in the pod and fly to safety as the ship explodes.'

    return 'finished'
  end
end

class Finished < Scene
  def enter
    puts 'A winner is you.'
    exit(1)
  end
end

class Map
  @@scenes = {
    'death' => Death.new,
    'central_corridor' => CentralCorridor.new,
    'laser_weapon_armory' => LaserWeaponArmory.new,
    'the_bridge' => TheBridge.new,
    'escape_pod' => EscapePod.new,
    'finished' => Finished.new
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene
    return next_scene(@start_scene)
  end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play
