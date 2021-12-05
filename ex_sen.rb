# 例文データ
# 日本語と英語

class Example_sentence
  attr_accessor :ja, :en
  @@tot = 0

  def initialize(en)
    if en.class != "String"
      raise '例文データに文字列以外が渡されました'
    end
    #@ja = ja
    @en = en
  end
end