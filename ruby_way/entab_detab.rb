class String

  def detab(ts = 8)
    str = self.dup
    while (leftmost = str.index("\t")) != nil
      space = " "*(ts-(leftmost%ts))
      str[leftmost] = space
    end
    str
  end

  def entab(ts = 8)
    str = self.detab
    areas = str.length / ts
    newstr = ""
    for a in 0..areas
      temp = str[a*ts..a*ts+ts-1]
      if temp.size==ts
        if temp =~ / +/
          match = Regexp.last_match[0]
          endmatch = Regexp.new(match+"$")

          if match.length > 1
            temp.sub!(endmatch, "\t")
          end
        end
      end
      newstr += temp
    end
    newstr
  end

end


foo = "This   is  only  a   test.    "
puts foo
puts foo.entab(4)
puts foo.entab(4).dump
