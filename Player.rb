class Player
    @@TOTAL_LIVES = 3
    attr_accessor :name , :lives
  
    def initialize(name)
      self.name = name
      self.lives = @@TOTAL_LIVES
    end
  
    def self.total_lives
        @@TOTAL_LIVES
    end
    
    def update_lives
        self.lives -=1
    end
  end