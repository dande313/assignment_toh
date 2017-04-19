Tier_1="0      "
Tier_2="00     "
Tier_3="000    "
Tier_4="0000   "
Tier_0="       "

#For the three arrays below, 5 is the base
Stack_1=[5,4,3,2,1]
Stack_2=[5]
Stack_3=[5]

tower_select=0
tower_move=0

def temp_tower_view
  puts"#{Stack_1}"
  puts"#{Stack_2}"
  puts"#{Stack_3}"
end

#method for viewing tower
def tower_view
  #layer 4 display
  puts ""
  if Stack_1[4]==1
    print "#{Tier_1}"
  else
    print "#{Tier_0}"
  end
  if Stack_2[4]==1
    print "#{Tier_1}"
  else
    print "#{Tier_0}"
  if Stack_3[4]==1
    print "#{Tier_1}"
  else
    print "#{Tier_0}"
  end

  #layer 3
  puts ""
  if Stack_1[3]==1
    print "#{Tier_1}"
  elsif Stack_1[3]==2
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[3]==1
    print "#{Tier_1}"
  elsif Stack_2[3]==2
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[3]==1
    print "#{Tier_1}"
  elsif Stack_3[3]==2
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

#layer 2
puts ""
  if Stack_1[2]==1
    print "#{Tier_1}"
  elsif Stack_1[2]==2
    print "#{Tier_2}"
  elsif Stack_1[2]==3
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[2]==1
    print "#{Tier_1}"
  elsif Stack_2[2]==2
    print "#{Tier_2}"
  elsif Stack_2[2]==3
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[2]==1
    print "#{Tier_1}"
  elsif Stack_3[2]==2
    print "#{Tier_2}"
  elsif Stack_3[2]==3
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

#Layer 1
puts ""
  if Stack_1[1]==1
    print "#{Tier_1}"
  elsif Stack_1[1]==2
    print "#{Tier_2}"
  elsif Stack_1[1]==3
    print "#{Tier_3}"
  elsif Stack_1[1]==4
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if Stack_2[1]==1
    print "#{Tier_1}"
  elsif Stack_2[1]==2
    print "#{Tier_2}"
  elsif Stack_2[1]==3
    print "#{Tier_3}"
  elsif Stack_2[1]==4
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if Stack_3[1]==1
    print "#{Tier_1}"
  elsif Stack_3[1]==2
    print "#{Tier_2}"
  elsif Stack_3[1]==3
    print "#{Tier_3}"
  elsif Stack_3[1]==4
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end


  puts ""
  print"1      2      3"
  puts ""
  puts ""
  end
end

#method for getting user instructions
#_p sets apart a process variable, apart from the user input
def user_input
  puts "Select a tower to take a disk"
  tower_select=gets.chomp.to_i
  puts "Select a tower to move the disk"
  tower_move=gets.chomp.to_i
end

#Note: The code 'puts "\e[H\e[2J"' clears the screen. Why? I don't know.

def invalid_move
  puts "\e[H\e[2J"
  puts "ERROR: Invalid move"
  puts 'Press "Enter" to continue'
  gets
end

#Start of program
puts "INSTRUCTIONS:"
puts "1.Select a tower number, in order to pick a disk from that tower."
puts "2.Next, select a tower that is either empty, or contains a larger disk"
puts "  than the one you selected."
puts "3. The disk from the tower you selected, to the tower you selected."
puts "4. If you can move the entire tower from 1 to 3, you win!!!"
puts ""
puts 'Press "Enter" to continue'
gets

while Stack_3!=[5,4,3,2,1]
  puts "\e[H\e[2J"
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
    if Stack_2[-1] > Stack_1[-1]
      Stack_2 << Stack_1[-1]
      Stack_1.delete_at(-1)
    else invalid_move
    end

  elsif tower_select==1 && tower_move==3
    if Stack_3[-1] > Stack_1[-1]
      Stack_3 << Stack_1[-1]
      Stack_1.delete_at(-1)
    else invalid_move
    end

  elsif tower_select==2 && tower_move==1
    if Stack_1[-1] > Stack_2[-1]
      Stack_1 << Stack_2[-1]
      Stack_2.delete_at(-1)
    else invalid_move
    end

  elsif tower_select==2 && tower_move==3
    if Stack_3[-1]  > Stack_2[-1]
      Stack_3 << Stack_2[-1]
      Stack_2.delete_at(-1)
    else invalid_move
    end

  elsif tower_select==3 && tower_move==1
    if Stack_1[-1]  > Stack_3[-1]
      Stack_1 << Stack_3[-1]
      Stack_3.delete_at(-1)
    else invalid_move
    end

  elsif tower_select==3 && tower_move==2
    if Stack_2[-1] > Stack_3[-1]
      Stack_2 << Stack_3[-1]
      Stack_3.delete_at(-1)
    else invalid_move
    end
  else
    invalid_move
  end
end
puts "\e[H\e[2J"
tower_view
puts "Hooray! You win!"
