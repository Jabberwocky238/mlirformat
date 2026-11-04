module {
  func.func @identity(%arg0: tuple<i1, i32>) -> tuple<i1, i32> {
    return %arg0 : tuple<i1, i32>
  }
}

// -----
module {
  func.func @identity_1_to_1_no_materializations(%arg0: tuple<i1>) -> tuple<i1> {
    return %arg0 : tuple<i1>
  }
}

// -----
module {
  func.func @recursive_decomposition(%arg0: tuple<tuple<tuple<i1>>>) -> tuple<tuple<tuple<i1>>> {
    return %arg0 : tuple<tuple<tuple<i1>>>
  }
}

// -----
module {
  func.func @mixed_recursive_decomposition(%arg0: tuple<tuple<>, tuple<i1>, tuple<tuple<i2>>>) -> tuple<tuple<>, tuple<i1>, tuple<tuple<i2>>> {
    return %arg0 : tuple<tuple<>, tuple<i1>, tuple<tuple<i2>>>
  }
}

// -----
module {
  func.func private @callee(tuple<i1, i32>) -> tuple<i1, i32>
  func.func @caller(%arg0: tuple<i1, i32>) -> tuple<i1, i32> {
    %0 = call @callee(%arg0) : (tuple<i1, i32>) -> tuple<i1, i32>
    return %0 : tuple<i1, i32>
  }
}

// -----
module {
  func.func private @callee(tuple<>) -> tuple<>
  func.func @caller(%arg0: tuple<>) -> tuple<> {
    %0 = call @callee(%arg0) : (tuple<>) -> tuple<>
    return %0 : tuple<>
  }
}

// -----
module {
  func.func @unconverted_op_result() -> tuple<i1, i32> {
    %0 = "test.source"() : () -> tuple<i1, i32>
    return %0 : tuple<i1, i32>
  }
}

// -----
module {
  func.func @nested_unconverted_op_result(%arg0: tuple<i1, tuple<i32>>) -> tuple<i1, tuple<i32>> {
    %0 = "test.op"(%arg0) : (tuple<i1, tuple<i32>>) -> tuple<i1, tuple<i32>>
    return %0 : tuple<i1, tuple<i32>>
  }
}

// -----
module {
  func.func private @callee(tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6) -> (tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6)
  func.func @caller(%arg0: tuple<>, %arg1: i1, %arg2: tuple<i2>, %arg3: i3, %arg4: tuple<i4, i5>, %arg5: i6) -> (tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6) {
    %0:6 = call @callee(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6) -> (tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6)
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : tuple<>, i1, tuple<i2>, i3, tuple<i4, i5>, i6
  }
}

