module MenusHelper
  def process(string)
     cuisine_1 = string.at(0..3)
     cuisine_2 = string.at(4..7)
     cuisine_3 = string.at(8..11)
     cuisine_4 = string.at(12..14)
     cuisine_5 = string.at(15..17)
     cuisine_6 = string.at(18..19)
     return [cuisine_1,cuisine_2,cuisine_3,cuisine_4,cuisine_5,cuisine_6]
  end
end
