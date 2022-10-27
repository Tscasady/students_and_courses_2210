class Student

  attr_reader :name, :age, :scores

  def initialize(data)
    @data = data
    @name = data[:name]
    @age = data[:age]
    @scores = []
  end


  def log_score(score)
    @scores << score
  end

  def grade
    @scores.sum.fdiv(@scores.length)
  end

    
end