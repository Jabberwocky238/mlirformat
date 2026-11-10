"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
    "async.yield"() : () -> ()
  }) : () -> !async.token
  "async.runtime.await"(%0) : (!async.token) -> ()
  %1 = "async.runtime.is_error"(%0) : (!async.token) -> i1
  "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

