puts "Seeding users..."
3.times.each do |i|
    User.new(username: rand(36**8).to_s(36), password: "testpassword").save
end
puts "Done seeding users [✓]\n"

User.all.each do |user|
    3.times.each do |i|
        puts "Seeding machines on user: #{user.username}..."
        user.machines.new(name: rand(36**8).to_s(36), active: [true, false].sample).save
    end
    puts "Done seeding machines [✓]\n"

    user.machines.all.each do |machine|
        dummy_date = Date.parse('Aug 18 2021')
        puts "Seeding machine_stats on machine: #{machine.name}..."

        while dummy_date < Date.parse('Aug 18 2022')
            dummy_machine_stats = machine.machine_stats.new(sales: rand(0..500), currency: "php", active_wifi_users: rand(0..50)) 
            dummy_machine_stats.created_at = dummy_date
            dummy_machine_stats.save
            dummy_date += Time.parse("01:00:00").seconds_since_midnight.seconds
        end
    end
    puts "Done seeding machine_stats [✓]\n"
end

puts "Done seeding database [✓]\n"
