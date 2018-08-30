def find_fish(arr)

  i = 0
  while i < arr.length
    max_len = true
    j = 0
    while j < arr.length
      #next if i == j
      max_len = false if arr[j].length > arr[i].length
      j += 1
    end
    i += 1
    return arr[i] if max_len
  end
end



def find_fish(arr)
  res = arr[0]
  num = arr.size
  (0...num).each do |i|
    res = arr[i] if arr[i].size > res.size
  end
  res
end



def merge_sort (arr, &prc)
  return arr if arr.length <= 1

  mid_idx = arr.length / 2
  merge(
    merge_sort(arr.take(mid_idx), &prc),
    merge_sort(arr.drop(mid_idx), &prc),
    &prc
  )
end


def self.merge(left, right, &prc)
    merged_array = []
    prc ||= Proc.new { |num1, num2| num2 <=> num1 }

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
end

def find_fish(arr)
  prc = Proc.new { |str1, str2| str1.length <=> str2.length }
  (merge_sort(arr, &prc)).last
end


find_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])



tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == dir
  end
end
