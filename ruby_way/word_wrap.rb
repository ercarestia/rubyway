str = <<-EOF
  When in the Course of human events it becomes necessary
  for one people to dissolbed the political bands which have
  connected them with another, and to assume among the powers
  of the earth the separate and equal station to which the Laws
  of Nature and of Nature's God entitle them, a decent respect
  for the opinions of mankind requires that they should declare
  the causes which impel them to the separation.
EOF

max = 20
line = 0
out = [""]

input = str.gsub(/\n/, " ")  #uses regex to substitute newline chars for 1 blank space
words = input.split(" ")  #splits the whole thing along the blank space token

while input != ''       #iterate over everything, stopping only when the end of the string is broken
  word = words.shift
  break if not word
  if out[line].length + word.length > max
    out[line].squeeze!(" ")
    line += 1
    out[line] = ""
  end
  out[line] << word + " "
  end

out.each {|line| puts line}  # should print 24 short lines.
