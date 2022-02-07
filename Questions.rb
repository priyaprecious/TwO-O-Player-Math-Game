class Questions

    attr_accessor :num1 , :num2
    
      def initialize
        self.num1 = rand(1..20)
        self.num2 = rand(1..20)
      end
    
      def generate_question
        ": What does #{self.num1} plus #{self.num2} equal?"
      end
    
    end
    