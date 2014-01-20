rolls, faces = $*[0].split('d').map(&:to_i)
rolls.times { print "#{Random.rand(1..faces)} " }