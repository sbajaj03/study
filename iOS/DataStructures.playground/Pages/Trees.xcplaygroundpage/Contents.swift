
import Foundation

class Node<T:Comparable> {
    var data:T
    var left:Node<T>?
    var right:Node<T>?
    
    init(data:T, left:Node<T>? = nil, right:Node<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
    
    func printlevelOrderTraversal()  {
        print("Level Order ---->>>>")
        var queue = [self]
        
        while let current = queue.first {
            print(current.data)
            queue.removeFirst()
            
            if let left = current.left {
                queue.append(left)
            }
            
            if let right = current.right {
                queue.append(right)
            }
        }
    }
    
    func insert(data:T) {
        
        var queue = [self]
        
        while let current = queue.first {
            
            queue.removeFirst()
            
            if let left = current.left {
                queue.append(left)
            }
            else {
                current.left = Node(data: data)
                break
            }
            
            if let right = current.right {
                queue.append(right)
            }
            else {
                current.right = Node(data: data)
                break
            }
        }
    }
    
    func printInOrder() {
        print("In Order ---->>>>")
        func printInOrder(root:Node<T>?) {
            
            guard let _r = root else { return }
            
            printInOrder(root: _r.left)
            print(_r.data)
            printInOrder(root: _r.right)
            
        }
        
        printInOrder(root: self)
    }
    
    func printPreorder() {
        print("Pre Order ---->>>>")
        func printPreOrder(root:Node<T>?) {
            
            guard let _r = root else { return }
            print(_r.data)
            printPreOrder(root: _r.left)
            printPreOrder(root: _r.right)
        }
        
        printPreOrder(root: self)
    }
    
    func printPostOrder() {
        print("Post Order ---->>>>")
        func printPostOrder(root:Node<T>?) {
            
            guard let _r = root else { return }
           
            printPostOrder(root: _r.left)
            printPostOrder(root: _r.right)
            print(_r.data)
        }
        
        printPostOrder(root: self)
    }
    
    var height:Int {
        
        func height(root:Node<T>?) -> Int {
            
            if root == nil {
                return -1
            }
            
            let leftHeight = height(root: root?.left)
            let rightHeight = height(root: root?.right)
        
            return max(leftHeight, rightHeight) + 1
        }
        
        return height(root: self)
    }
}

var root = Node(data: 1)
root.left = Node(data: 2)
root.right = Node(data: 3)
root.left?.left = Node(data: 4)
root.left?.right = Node(data: 5)

//func levelOrderTraversal<T>(root:Node<T>?) {
//
//    guard let _root = root else { return }
//
//    var queue = [_root]
//
//    while let current = queue.first {
//        print(current.data)
//        queue.removeFirst()
//
//        if let left = current.left {
//            queue.append(left)
//        }
//
//        if let right = current.right {
//            queue.append(right)
//        }
//    }
//}

//levelOrderTraversal(root: root)

//func insert<T>(root:Node<T>?, data:T) {
//
//    guard let _root = root else { return }
//
//    var queue = [_root]
//
//    while let current = queue.first {
//
//        queue.removeFirst()
//
//        if let left = current.left {
//            queue.append(left)
//        }
//        else {
//            current.left = Node(data: data)
//            break
//        }
//
//        if let right = current.right {
//            queue.append(right)
//        }
//        else {
//            current.right = Node(data: data)
//            break
//        }
//    }
//}

//let root_1 = Node(data: 10)
//root_1.left = Node(data: 11)
//root_1.right = Node(data: 9)
//root_1.left?.left = Node(data: 7)
//root_1.left?.right = Node(data: 15)
//root_1.right?.right = Node(data: 8)
//
//levelOrderTraversal(root: root_1)
//print("====>>>")
//insert(root: root_1, data: 12)
//levelOrderTraversal(root: root_1)


class BinartSearchTree<T:Comparable> {
    
    private(set) var root:Node<T>?
    
    func search(data:T) -> Node<T>? {
    
        func search(root:Node<T>?, data:T) -> Node<T>? {

            if root == nil || root?.data == data {
                return root
            }
            
            if let _data = root?.data,  _data < data {
                return search(root: root?.right, data: data)
            }
            
            return search(root: root?.left, data: data)
        }
        
        return search(root: root, data:data)
    }
    
    func insert(data:T) {
        
        func insert(root: Node<T>?, data:T) -> Node<T>?  {
            
            if root == nil {
                return Node(data: data)
            }
            
            if let _data = root?.data, _data < data {
                root?.right = insert(root: root?.right, data: data)
            }
            else {
                root?.left = insert(root: root?.left, data: data)
            }
            
            return root
        }
    
        root = insert(root: root, data: data)
    }
    
    func delete(data:T) {
        
        func delete(root:Node<T>?, data:T) -> Node<T>? {
            
            guard let _root = root else { return root }
          
            if data < _root.data {
                root?.left = delete(root: root?.left, data: data)
            }
            else if data > _root.data {
                root?.right = delete(root: root?.right, data: data)
            }
            else {
            
                if root?.left == nil && root?.right == nil {
                    return nil
                }
                else if root?.left == nil {
                
                    return root?.right
                }
                else if root?.right == nil {
                    
                    return root?.left
                }
                
                var succparent = root
                var succ = succparent?.right
                
                while let left = succ?.left {
                    succparent = succ
                    succ = left
                }
                
                if succparent?.data == root?.data {
                    succparent?.right = succ?.right
                }
                else {
                    succparent?.left = succ?.right
                }
                if let _data = succ?.data {
                    root?.data  = _data
                }
            }
            
            return root
        }
        root = delete(root: root, data: data)
    }
    
    func balanceIfNeeded() {
        
        func storeNodes(nodes:inout [Node<T>], node:Node<T>?) {
            
            guard let _node = node else { return }
            
            storeNodes(nodes: &nodes, node: _node.left)
            nodes.append(_node)
            storeNodes(nodes: &nodes, node: _node.right)
        }
        
        // save all nodes in array
        var nodes = [Node<T>]()
        storeNodes(nodes: &nodes, node: root)
        for node in nodes {
            print(node.data)
        }

        func buildTree(nodes:[Node<T>], start:Int, end:Int) -> Node<T>?  {
            
            if start > end {
                return nil
            }
            
            let mid = ( start + end ) / 2
            
            let node = nodes[mid]
            
            node.left = buildTree(nodes: nodes, start: start, end: mid - 1)
            node.right = buildTree(nodes: nodes, start: mid + 1, end: end)
            
            return node
        }
        
        root = buildTree(nodes: nodes, start: 0, end: nodes.count - 1)
    }
}

let bst = BinartSearchTree<Int>()

bst.insert(data: 10)
bst.insert(data: 20)
bst.insert(data: 30)
bst.insert(data: 5)
bst.insert(data: 15)
//
//bst.root?.printlevelOrderTraversal()
//bst.root?.printInOrder()
//bst.root?.printPreorder()
//bst.root?.printPostOrder()
//bst.root?.printlevelOrderTraversal()
//print(bst.root?.height ?? 0)
//bst.delete(data: 20)
//print(bst.root?.height ?? 0)
//bst.root?.printlevelOrderTraversal()



//print(bst.search(data: 7) != nil)
//
//bst.root?.printlevelOrderTraversal()
//bst.balanceIfNeeded()
//bst.root?.printlevelOrderTraversal()

var value = 1

let clouser = { [value] in
        print(value)
}

value = 2
//clouser()

func findCount(matrixInt:[[Int]]) -> Int {
    
    var count = 0
    var land = Set<String>()
    
    for i in 0..<matrixInt.count  {

        for j in 0..<matrixInt[i].count {
           
            let s = "\(i)\(j)"
           
            if matrixInt[i][j] == 1, !land.contains(s) {
                land.insert(s)
              
                // check left
                let l = j - 1
                if l >= 0 {
                    // check all left
                    for a in max(i-1,0)...i+1 {
                        if a < matrixInt[l].count {
                            if matrixInt[l][a] == 1 {
                                land.insert("\(i)\(j)")
                            }
                        }
                    }
                }
                
                // check top
                if i-1 >= 0 {
                    if matrixInt[i-1][j] == 1 {
                        land.insert("\(i)\(j)")
                    }
                }
               
                
                // check right
                let r = j + 1
                if r < matrixInt[i].count {
                    // check all right
                    for a in max(i-1,0)...i+1 {
                      print("a ===>", a)
                        if a < matrixInt[r].count {
                            if matrixInt[r][a] == 1 {
                                land.insert("\(i)\(j)")
                            }
                        }
                    }
                }
            
                // check bottom
                if i + 1 < matrixInt.count {
                    if matrixInt[i+1][j] == 1 {
                        land.insert("\(i)\(j)")
                    }
                }
                
                count += 1
            }
        }
    }
    
    return count
}

print(findCount(matrixInt: [[1, 1, 0, 0, 0],
                            [0, 1, 0, 0, 1],
                            [1, 0, 0, 1, 1],
                            [0, 0, 0, 0, 0],
                            [1, 0, 1, 0, 1]]))
