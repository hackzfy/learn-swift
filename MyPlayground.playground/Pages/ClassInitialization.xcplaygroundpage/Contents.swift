//: [Previous](@previous)

import Foundation

/**
 class inheritance and initialization
 */


/**
 规则：
 1. 子类必须在传统构造器中调用超类的传统构造函数。
 2. 便捷构造器必须调用当前类中的其他构造函数。
 3. 便捷构造器必须最终调用传统构造函数。
 */

// parent with customize init
class Parent {
    var name: String
    init(name: String){
        self.name = name
    }
}

class Child: Parent {
    var age: Int
    
    override init(name: String) {
        self.age = 0
        super.init(name: name)
    }
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
}
// parent with default init
class ParentWithDefaultInit {
    var name = "unknown"
}
class Child1: ParentWithDefaultInit {
    override init() {
        // implicit call super.init()
    }
}


/**
 safety check:
 1. 在调用超类构造器之前，先初始化所有本类中的属性。
 2. 调用超类构造器，之后才能修改继承来的属性值，防止刚修改后又被超类构造器覆盖。
 3. 便捷构造器在给属性赋值之前必须先调用其他的构造器。
 4. 构造器在第一步初始化完成之前不能调用实例方法或者读取属性和self
 */

/**
 实例化过程：
 第一阶段：
 1. 调用构造器。
 2. 给实例分配内存空间，但是空间还没有初始化。（根据属性类型，分配空间，但是空间中没有赋值）
 3. 构造器确认所有属性已经初始化完成。存储这些属性的内存空间现在初始化了。（存储空间赋值）
 4. 调用超类构造器，重复以上过程。直到继承链的顶端。
 5. 第一阶段完成。
 
 第二阶段：
 1. 从继承链顶端，自上而下，每一个传统构造器现在可以对实例进行配置。构造器现在可以访问 self 并修改属性值，调用实例方法等。
 2. 最终，任何便捷构造器可以配置实例属性冰使用 self。
 */


class TestParent {
    var name: String
    
    init(name: String) {
        self.name = name;
    }
    
    func description() -> String {
        return "Test \(name)"
    }
}

class TestChild: TestParent {
    var age: Int
    var gender = "unknown"
    
    
    init(name: String, age: Int, gender: String) {
        // init store property first
        self.age = age
        self.gender = gender
        // invoke parent initialization
        super.init(name: name)
        // modify inherited property
        self.name = "Child \(name)";
    }
    
    convenience init() {
        self.init(name: "fakeName", age: 0, gender: "unknown")
    }
    
    override func description() -> String {
        return "Test \(name) \(age) \(gender)"
    }
}


var child = TestChild()
child.description()

child = TestChild(name: "John", age: 20, gender: "male")
child.description()
//: [Next](@next)
