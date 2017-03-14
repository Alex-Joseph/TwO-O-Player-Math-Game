class Question
  attr_reader :ask_question
  def initialize
    @a = rand(20)
    @b = rand(20)
  end

  def ask_question
    "What does #{@a} + #{@b} equal?"
  end

  def check_ans(resp)
    (@a + @b) == resp
  end
end
