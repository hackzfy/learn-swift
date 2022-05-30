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


/**
 notice: subclass will not inherit the initializer(includes default initializer) of its superclass(其实在某些情况下是会继承的，后面会说).
 So, if you want a subclass to present one or more of the same initializers as its superclass, you need to write them explicitly(override).
 */


class TestParent1 {
    
}

class TestChild1: TestParent1 {
    // override default initializer
    override init() {
        
    }
}

class TestChild2: TestParent1 {
    var name: String;
    init(name: String) {
        self.name = name;
        super.init()
    }
    // You always write the override modifier when overriding a superclass designated initializer,
    // even if your subclass’s implementation of the initializer is a convenience initializer.
    convenience override init() {
        self.init(name: "unknown")
    }
}



class Vehicle {
    var numberOfWheels = 0
    // computed property
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    
    // it has a default initializer
}

let vehicle = Vehicle()
// notice: description is a property, not a function.
print("Vehicle:",vehicle.description)


class Bicycle: Vehicle {
    override init() {
        super.init()
        // customize property inherited from superclass.
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class HoverBoard: Vehicle {
    var color: String;
    init(color: String) {
        self.color = color
        // notice: If a subclass initializer performs no customization in phase 2 of the initialization process,
        // and the superclass has a zero-argument designated initializer,
        // you can omit a call to super.init() after assigning values to all of the subclass’s stored properties.
        // super.init() implicitly called here
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverBoard = HoverBoard(color:"red")
print(hoverBoard.description)



/**
 子类继承超类构造器需要满足两种情况：
 1. 如果子类中所有的自有属性都提供了默认值且没有定义任何传统构造器，那它将自动继承超类所有的传统构造器和便捷构造器。
 2.如果子类覆盖了所有超类拥有的构造器，那它将自动继承所有超类拥有的便捷构造器。注意，子类可以用便捷构造器覆盖父类的传统构造器。
 如果子类添加了额外的便捷构造器，不会对上述规则产生影响。
 */


class Food {
    var name: String;
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")


class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    //注意：子类在这里通过便捷构造器覆盖了父类的构造器，它将继承父类的便捷构造器 init()
    convenience override init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
    func description() -> String {
        return "\(name) \(quantity)"
    }
}

// 可以看到，子类继承了父类的便捷构造器 init(), 这个init内部会调用子类的 self.init(name: String) 构造器
let recipeIngredient = RecipeIngredient()
print(recipeIngredient.description()) // [Unnamed] 1

let oneBacon = RecipeIngredient(name: "Bacon")
let sigEggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔️" : "✖️"
        return output
    }
    // 1.it provides a default value for all of the properties it introduces
    // 2.it doesn’t define any initializers itself
    // So, ShoppingListItem automatically inherits all of the designated and convenience initializers from its superclass.
}

// You can use all three of the inherited initializers to create a new ShoppingListItem instance:
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]

for item in breakfastList {
    print(item.description)
}
//1 x [Unnamed]✖️
//1 x Bacon✖️
//6 x Eggs✖️

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
//1 x Orange juice✔️
//1 x Bacon✖️
//6 x Eggs✖️



//: [Next](@next)
