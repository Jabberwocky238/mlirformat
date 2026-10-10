module {
  func.func @fixpoint(%arg0: i32) -> i32 {
    %0 = "test.use"(%arg0) ({
      %1 = "test.use2"(%arg0) ({
        "test.yield2"(%arg0) : (i32) -> ()
      }) : (i32) -> i32
      "test.yield"(%1) : (i32) -> ()
    }) : (i32) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @clone_unregistered_with_attrs() {
    "unregistered.foo"() <{bar = 1 : i64, flag = true, name = "test", value = 3.140000e+00 : f32}> : () -> ()
    "unregistered.bar"() : () -> ()
    "unregistered.empty_dict"() <{}> : () -> ()
    "unregistered.complex"() <{array = [1, 2, 3], dict = {key1 = 42 : i32, key2 = "value"}, nested = {inner = {deep = 100 : i64}}}> : () -> ()
    return
  }
}

