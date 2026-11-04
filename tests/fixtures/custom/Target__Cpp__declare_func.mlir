module {
  emitc.declare_func @bar
  emitc.func @bar(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  emitc.declare_func @foo
  emitc.func @foo(%arg0: i32) -> i32 attributes {specifiers = ["static", "inline"]} {
    return %arg0 : i32
  }
  emitc.declare_func @array_arg
  emitc.func @array_arg(%arg0: !emitc.array<3xi32>) {
    return
  }
  emitc.declare_func @foo1
  emitc.declare_func @foo2
  emitc.func @foo1(%arg0: i32) -> i32 {
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    return %arg0 : i32
  }
  emitc.func @foo2(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

