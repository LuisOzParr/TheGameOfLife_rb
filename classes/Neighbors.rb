class Neighbors

    def initialize(n, matrix)
        @n = n
        @matrix = matrix
    end

    def conunNeighbors(x, y)
        count = 0
        (-1..1).each do |i|
            (-1..1).each {|j| count += validate(x, y, x+j, y+i) }
        end
        count
    end

    def validate x, y, x2, y2
        #(If exist coordenate) && (If it is not the current coordinate)  && (If value of matrix is 1 [If exist cell])
        if ( x2.between?(0, @n-1) && y2.between?(0, @n-1) ) && !(x2 == x && y2 == y) && (@matrix[y2][x2] == 1)
                return 1
        end
        0
    end

end