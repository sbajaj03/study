

import Foundation

var arr = [64, 25, 12, 22, 11]

func quickSort(arr:[Int]) {
    
    
}

//mergeSort(arr: &arr)
//print(arr)


class Node<T:Equatable> {
    
    var data:T
    var next:Node<T>?
    weak var prev:Node<T>?
    
    init(data:T, next:Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T:Equatable> {
    
    private var head:Node<T>?
    
    init(head:Node<T>? = nil) {
        self.head = head
    }

    var isEmpty: Bool {
        return self.head == nil
    }
    
    var first: Node<T>? {
        return self.head
    }
    
    var last: Node<T>? {
        
        guard var node = self.head else { return nil }

        while let next = node.next {
            node = next
        }
        return node
    }
    
    var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func push(data:T) -> Node<T>? {
        
        let newNode = Node(data: data)
        
        newNode.next = self.head
        self.head?.prev = newNode
        self.head = newNode
        
        return newNode
    }
    
    func append(data:T) {
        
        let newNode = Node(data: data)
        
        if let _l = last {
            newNode.prev = _l
            _l.next = newNode
        }
        else {
            head = newNode
        }
       
    }
    
    func printLinkedList() {
        var str = ""
        var temp = self.head
        while let _temp = temp {
            str += "\(_temp.data) "
            temp = _temp.next
        }
        print(str)
    }
    
    func node(at index:Int) -> Node<T>? {
        
        if index == 0 {
            return self.head
        }
        else if index > 0 {
            var count = 1
            var temp = self.head?.next
            while temp != nil {
                if index != count {
                    temp = temp?.next
                    count += 1
                }
                else {
                    return temp
                }
            }
        }
        
        return nil
    }
    
    func remove(data:T) {
    
        var temp = self.head
        
        if data == temp?.data {
       
            self.head = temp?.next
            temp?.prev = nil
            temp = nil
        }
        else {
            while let current = temp?.next {
                if current.data == data {
                    temp?.next = current.next
                    current.next?.prev = temp
                    break
                }
                temp = current
            }
        }
    }
    
    func removeLast() {
        
        guard let last = self.last else { return }
        
        if last.prev == nil {
            self.head = nil
        }
        else {
            last.prev?.next = nil
        }
    }
}

//let llist = LinkedList<Int>()
//llist.push(data: 1)
//llist.push(data: 3)
//llist.push(data: 4)
//llist.append(data: 2)
//llist.printLinkedList()
//print(llist.count)
//print(llist.node(at: 3)?.data ?? "")
//llist.remove(data: 4)
//llist.printLinkedList()

class LRUCache<T:Equatable> {
    private var capacity:Int
    private var linkedList:LinkedList<T>!
    
    init(capacity:Int) {
        self.capacity = capacity
        self.linkedList = LinkedList<T>()
    }
    
    func set(value:T) {

        if self.linkedList.count >= self.capacity {
            
            self.linkedList.removeLast()
        }
               
        self.linkedList.push(data: value)
    }
    
    func get(value:T) -> Node<T>? {
        
        self.linkedList.remove(data: value)
        
        return self.linkedList.push(data: value)
    }
    
    func printCahce() {
        self.linkedList.printLinkedList()
    }
}

let cache = LRUCache<Int>(capacity: 3)

cache.set(value: 1)
cache.set(value: 2)
cache.printCahce()
cache.get(value: 1)
cache.printCahce()
cache.set(value: 3)
cache.printCahce()
