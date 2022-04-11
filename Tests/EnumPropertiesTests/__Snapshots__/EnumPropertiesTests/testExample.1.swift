extension Validated {
  var valid: Valid? {
    guard case let .valid(value) = self else { return nil }
    return value
  }
  var isValid: Bool {
    return self.valid != nil
  }
  var invalid: Invalid? {
    guard case let .invalid(value) = self else { return nil }
    return value
  }
  var isInvalid: Bool {
    return self.invalid != nil
  }
}
extension Difficult {
  var foo: Int? {
    guard case let .foo(value) = self else { return nil }
    return value
  }
  var isFoo: Bool {
    return self.foo != nil
  }
  var bar: Int? {
    guard case let .bar(value) = self else { return nil }
    return value
  }
  var isBar: Bool {
    return self.bar != nil
  }
  var baz: (Int, name: String, Bool)? {
    guard case let .baz(value) = self else { return nil }
    return value
  }
  var isBaz: Bool {
    return self.baz != nil
  }
  var empty: Void? {
    guard case .empty = self else { return nil }
    return ()
  }
  var isEmpty: Bool {
    return self.empty != nil
  }
}
