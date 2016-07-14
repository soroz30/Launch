def grandFatherClock (&block)

	time = Time.now.hour

	while time > 0 
		block.call
		time -= 1
	end	

end

grandFatherClock do
	puts 'Dong!'
end