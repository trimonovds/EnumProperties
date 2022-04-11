enum Validated<Valid, Invalid> {
    case valid(Valid)
    case invalid(Invalid)
}

enum Difficult {
    case foo(Int)
    case bar(age: Int)
    case baz(Int, name: String, Bool)
    case empty
}