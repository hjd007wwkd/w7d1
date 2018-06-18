class Person

    def initialize(name)
        @name = name
    end

    attr_accessor :name

end

p = Person.new('L. Ron')
p.name = 'Jin'
puts p.name
