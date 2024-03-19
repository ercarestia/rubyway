# Extension methods for String class.
class String

    def levenshtein(other, ins=2, del=2, sub=2) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
        # other is the string we're comparing against.
        # ins, del, and sub are weighted costs
      return nil if self.nil?
      return nil if other.nil?
  
      dm = []  # distance matrix
  
        # initialize first row values
        dm[0] = (0..self.length).collect { |i| i * ins }
        fill = [0] * (self.length - 1)
  
        #initialize first column values 
        for i in 1..other.length
            dm[i] = [i * del, fill.flatten]
  for j in 1..self.length
                # critical comparison
                dm[i][j] = [dm[i-1][j-1] + (self[j-1] == other[i-1] ? 0 : sub), dm[i][j-1] + ins, dm[i - 1][j] + del].min
            end
        end
  
        #populate matrix
        # the last value in matrix is the levenshtein distance
        # between the strings
        dm[other.length][self.length]
    end
  
      def similar?(other, thresh=2)
          self.levenshtein(other) < thresh
      end
  
  end
  
  
  s1 = "ACUGAUGUGA"
  s2 = "AUGGAA"
  d1 = s1.levenshtein(s2)
  puts s1.similar?(s2)
  puts d1
  # expected output is 10A