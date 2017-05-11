def wear_clothes(item)
  sample(item)
  sleep (2)
end

def wash_clothes(temp)
  play(temp)
  sleep(1)
end

def dry_clothes(time)
  sample(:guit_harmonics)
  sleep(2)
  wear_clothes(:loop_amen)
  sleep(time)
  sample(:bass_voxy_c)
end

def clothes_left_in_washer()
  time  = rand(1..10)
  puts time
  time
end

def clothes_are_dry?()
  random_number = rand(1)
  puts random_number
  random_number < 0.5

end

2.times do
  wear_clothes(:ambi_drone)
  wash_clothes(60)
  if clothes_left_in_washer() > 6
    wash_clothes(60)
  end
  dry_clothes(5)
  if clothes_are_dry?()
    puts 'true'
    dry_clothes(3)
  end
  wear_clothes(:loop_amen_full)
  wash_clothes(50)
  dry_clothes(2)
end