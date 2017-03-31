class LinkedList
  attr_reader :size
  @head = nil
  @tail = nil

  def initialize value
    puts 'Linked list created'
    @head = Node.new (value)
    @tail = @head
    @size = 1
  end

  def append value
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
    @size += 1
  end

  def prepend value
    @head = Node.new(value, @head)
    @size += 1
  end
  def to_s
    currentNode = @head
    string = ''
    while currentNode != nil
      string += " ( #{currentNode.value} ) => "
      currentNode = currentNode.next_node
    end
    string += " nil"
  end

  def head
    @head.value
  end
  def tail
    @tail.value
  end

  def at index
    currentNode = @head
    index.times do
      currentNode = currentNode.next_node
      return nil if currentNode == nil
    end
    currentNode.value
  end
  def pop
    currentNode = @head
    while currentNode.next_node != @tail
      currentNode = currentNode.next_node
    end
    @tail = currentNode
  end
  def contains? value
    currentNode = @head
    while currentNode != nil
      return true if currentNode.value == value
      currentNode = currentNode.next_node
    end
    return false
  end
  def find value
    currentNode = @head
    index = 0
    while currentNode != nil
      return index if currentNode.value == value
      currentNode = currentNode.next_node
      index += 1
    end
    return nil
  end
end


class Node
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

myList = LinkedList.new (32)
myList.append(98)
myList.append(27)
myList.append(18)
myList.append(27)
myList.prepend(555)

puts myList.to_s
puts ""
puts myList.at(3)
puts myList.at(7)

puts myList.contains?(98).to_s
puts myList.contains?(2123).to_s
puts myList.find(98)
