Tier_1=" 0           "
Tier_2=" 00          "
Tier_3=" 000         "
Tier_4=" 0000        "
Tier_5=" 00000       "
Tier_6=" 000000      "
Tier_7=" 0000000     "
Tier_8=" 00000000    "
Tier_9=" 000000000   "
Tier_0="             "


#For the three arrays below, 0 is the base
Stack_1=[0,1,2,3]
Stack_2=[0]
Stack_3=[0]

tower_select=0
tower_move=0
$turns_taken=0
$disks=2

def introduction
  puts "\e[H\e[2J"
  puts "INSTRUCTIONS:"
  puts "1. Select a tower number, in order to pick a disk from that tower."
  puts "2. Next, select a tower that is either empty, or contains a larger disk"
  puts "   than the one you selected."
  puts "3. The disk will move from the tower you selected, to the tower you selected."
  puts "4. If you can move the entire tower from 1 to 3, you win!!!"
  puts ""
  puts 'Press "Enter" to continue'
  gets
end

def difficulty_set
  while $disks < 3 || $disks > 9
    puts "\e[H\e[2J"
    puts "The difficulty of this puzzle increases with the number of disks."
    puts "You may select between 3 and 9 disks."
    puts ""
    puts "Please enter the number of disks for this game:"
    $disks=gets.chomp.to_i
    if $disks < 3 || $disks > 9
      puts "\e[H\e[2J"
      puts "ERROR: Invalid entry"
      puts ""
      puts "Please enter a value between 3 and 9"
      puts 'Press "Enter" to continue'
      gets
    end
  end
end

def difficulty_adjust
  (4..$disks).each do |i|
  Stack_1 << i
  end
end

def temp_tower_view
  puts"#{Stack_1}"
  puts"#{Stack_2}"
  puts"#{Stack_3}"
end

def turn_counter
  $turns_taken = $turns_taken + 1
  puts "Turn: #{turns_taken}"
end


#method for viewing tower
def tower_view
  #Top layer display
  puts ""
  if Stack_1[9]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[-9]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[9]==($disks)
    print "#{Tier_1}"
  else
    print "#{Tier_0}"
  end

  #Layer -1 display
  puts ""
  if Stack_1[8]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[8]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[8]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

#layer -2 display
puts ""
  if Stack_1[7]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[7]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[7]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[7]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[7]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[7]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

#Layer -3 display
puts ""
  if Stack_1[6]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[6]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[6]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[6]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[6]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[6]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[6]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[6]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[6]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  #Layer -4 display

puts ""
  if Stack_1[5]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[5]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[5]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[5]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_1[5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[5]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[5]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[5]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[5]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_2[5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[5]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[5]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[5]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[5]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_3[5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  #Layer -5 display

puts ""
  if Stack_1[4]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[4]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[4]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[4]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_1[4]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_1[4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[4]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[4]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[4]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[4]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_2[4]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_2[4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[4]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[4]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[4]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[4]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_3[4]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_3[4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

#Layer -6 display

puts ""
  if Stack_1[3]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[3]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[3]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[3]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_1[3]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_1[3]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_1[3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[3]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[3]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[3]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[3]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_2[3]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_2[3]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_2[3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[3]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[3]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[3]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[3]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_3[3]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_3[3]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_3[3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

#Layer -7 display

puts ""
  if Stack_1[2]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[2]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[2]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[2]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_1[2]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_1[2]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_1[2]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_1[2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[2]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[2]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[2]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[2]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_2[2]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_2[2]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_2[2]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_2[2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[2]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[2]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[2]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[2]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_3[2]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_3[2]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_3[2]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_3[2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

#Layer -8 display

puts ""
  if Stack_1[1]==($disks)
    print "#{Tier_1}"
  elsif Stack_1[1]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_1[1]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_1[1]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_1[1]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_1[1]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_1[1]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_1[1]==($disks-7)
    print "#{Tier_8}"
  elsif Stack_1[1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end


  if Stack_2[1]==($disks)
    print "#{Tier_1}"
  elsif Stack_2[1]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_2[1]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_2[1]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_2[1]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_2[1]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_2[1]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_2[1]==($disks-7)
    print "#{Tier_8}"
  elsif Stack_2[1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[1]==($disks)
    print "#{Tier_1}"
  elsif Stack_3[1]==($disks-1)
    print "#{Tier_2}"
  elsif Stack_3[1]==($disks-2)
    print "#{Tier_3}"
  elsif Stack_3[1]==($disks-3)
    print "#{Tier_4}"
  elsif Stack_3[1]==($disks-4)
    print "#{Tier_5}"
  elsif Stack_3[1]==($disks-5)
    print "#{Tier_6}"
  elsif Stack_3[1]==($disks-6)
    print "#{Tier_7}"
  elsif Stack_3[1]==($disks-7)
    print "#{Tier_8}"
  elsif Stack_3[1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end

#Base Layer; always present
  puts ""
  print "_______________________________________"
  puts ""
  puts ""
  print " 1            2            3"
  puts ""
  puts ""

end

#Note: The code 'puts "\e[H\e[2J"' clears the screen. Why? I don't know.

def invalid_move
  $turns_taken = $turns_taken -1
  puts "\e[H\e[2J"
  puts "ERROR: Invalid move"
  puts 'Press "Enter" to continue'
  gets
end

def execute_commands
  while Stack_3[$disks]!=$disks
    puts "\e[H\e[2J"
    $turns_taken = $turns_taken + 1
    puts "Turn: #{$turns_taken}"
    tower_view
    puts "Disk Select"
    tower_select=gets.chomp.to_i
      if (1..3).include? (tower_select)
        puts "Move Select"
        tower_move=gets.chomp.to_i
        if (1..3).include? (tower_move)
        else
          puts "\e[H\e[2J"
          puts "ERROR: Invalid Input"
          puts 'Press "Enter" to continue'
          gets
          redo
        end
      else
        puts "\e[H\e[2J"
        puts "ERROR: Invalid Input"
        puts 'Press "Enter" to continue'
        gets
        redo
      end


    if tower_select==1 && tower_move==2
      if Stack_2[-1] < Stack_1[-1]
        Stack_2 << Stack_1[-1]
        Stack_1.delete_at(-1)
      else invalid_move
      end

    elsif tower_select==1 && tower_move==3
      if Stack_3[-1] < Stack_1[-1]
        Stack_3 << Stack_1[-1]
        Stack_1.delete_at(-1)
      else invalid_move
      end

    elsif tower_select==2 && tower_move==1
      if Stack_1[-1] < Stack_2[-1]
        Stack_1 << Stack_2[-1]
        Stack_2.delete_at(-1)
      else invalid_move
      end

    elsif tower_select==2 && tower_move==3
      if Stack_3[-1]  < Stack_2[-1]
        Stack_3 << Stack_2[-1]
        Stack_2.delete_at(-1)
      else invalid_move
      end

    elsif tower_select==3 && tower_move==1
      if Stack_1[-1]  < Stack_3[-1]
        Stack_1 << Stack_3[-1]
        Stack_3.delete_at(-1)
      else invalid_move
      end

    elsif tower_select==3 && tower_move==2
      if Stack_2[-1] < Stack_3[-1]
        Stack_2 << Stack_3[-1]
        Stack_3.delete_at(-1)
      else invalid_move
      end
    else
      invalid_move
    end
  end
end

def end_game
  puts "\e[H\e[2J"
  tower_view
  puts "Hooray! You win!"
  puts "You completed the challenge in #{$turns_taken} turns!"
  puts ""
    if ((2**$disks)-1) == $turns_taken
      puts "You achieved a perfect score!"
    else
      puts "The minimum number of turns required to complete the Hanoi Tower"
      puts "with #{$disks} disks is #{(2**$disks)-1}."
      puts "You went #{((2**$disks)-1) - $turns_taken} over."
    end
  puts ""
  puts "Care to try again?"
end

#Start of program
introduction
difficulty_set
difficulty_adjust
execute_commands
end_game
