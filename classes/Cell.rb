
class Cell < Neighbors

    def initialize(n)
        @matrix = Array.new(n){ Array.new(n) }
        @pivot_matrix = Array.new(n){ Array.new(n) }
        super n, @matrix
        @n = n
        createMatrix()
    end

    def createNewMatrix
        createPivotMatrix
        matrix_buffer = Array.new(@n){ Array.new(@n) }
        (0...@n).each do |y|
            (0...@n).each {|x| matrix_buffer[y][x] = isAlive(@matrix[y][x], @pivot_matrix[y][x])}
        end
        @matrix = matrix_buffer
    end

    def printMatrix(matrix)
        (0...@n).each do |i|
            print "#{matrix[i]} \n"
        end
    end

    #GETERS
    def getMatrix
        @matrix
    end

    def getPivotMatrix
        @pivot_matrix
    end
    #END GETERS

    private
    def createMatrix
        (0...@n).each do |i|
            (0...@n).each {|j| @matrix[i][j] = rand(0..1) }
        end
        @matrix
    end

    def createPivotMatrix
        (0...@n).each do |y|
            (0...@n).each {|x| @pivot_matrix[y][x] = conunNeighbors(x, y) }
        end
    end

    def isAlive(status, cant_neighbors)
        if status.equal?(1) && (cant_neighbors.between?(2, 3) )
            return 1
        elsif status.equal?(0) && (cant_neighbors.equal?(3))
            return 1
        end
        0
    end


end

=begin
    this.crearMatrizNueva = function () {
        createPivotMatrix();
        var matrizBuffer = [];
        for(var y = 0; y<matrixSize; y++){
            matrizBuffer[y]=[];
            for(var x = 0; x<matrixSize; x++){
                matrizBuffer[y][x] = vivaOmuerta(matriz[y][x],matrizPivote[y][x]);
            }
        }
        matriz = matrizBuffer;
    };
=end


