require "byebug"

class Map

  def initialize
    @map = []
  end

  #set(key, value), get(key), delete(key), show

  def set(key, value)
    idx = get_index_for_key(key)
    if idx
      @map[idx][1] = value
    else
      @map << [key, value]
    end
    [key, value]
  end


  def get(key)
    idx = get_index_for_key(key)
    return nil if idx == nil
    @map[idx][1]
  end


  def delete(key)
    @map.delete_at(get_index_for_key(key))
  end


  def show
    @map.each do |pair|
      print "\nkey: #{pair[0]}, value: #{pair[1]}\n"
    end
  end

  private
  def get_index_for_key(key)
    @map.index { |el| el.first == key }
  end

end



if __FILE__ == $PROGRAM_NAME
  m = Map.new
  m.show

  m.set(:r, :trh)
  m.set(:q, :pppppp)
  m.set(:e, :rteee)
  m.set(:y, :nbnbv)

  m.show

  m.get(:q)
  m.get(:r)

  m.delete(:e)

  m.show

end
