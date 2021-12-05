# 例文データ
# 日本語と英語

class Example_sentence
  attr_accessor :ja, :en
  @@tot = 0

  def initialize(en)
    #@ja = ja
    @en = en
  end
end