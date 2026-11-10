"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  %0:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
    %2 = "arith.constant"() <{value = 1.234560e+02 : f32}> : () -> f32
    "async.yield"(%2) : (f32) -> ()
  }) : () -> (!async.token, !async.value<f32>)
  %1 = "async.await"(%0#1) : (!async.value<f32>) -> f32
  "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  %0:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
    %2:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %4 = "arith.constant"() <{value = 4.567890e+02 : f32}> : () -> f32
      "async.yield"(%4) : (f32) -> ()
    }) : () -> (!async.token, !async.value<f32>)
    %3 = "async.await"(%2#1) : (!async.value<f32>) -> f32
    "async.yield"(%3) : (f32) -> ()
  }) : () -> (!async.token, !async.value<f32>)
  %1 = "async.await"(%0#1) : (!async.value<f32>) -> f32
  "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

