"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 1 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 5 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 2 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 4 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 9223372036854775807 : index, umin = 0 : index}> : () -> index
    %2 = "arith.cmpi"(%1, %0) <{predicate = 3 : i64}> : (index, index) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %1 = "test.with_bounds"() <{smax = 12 : i8, smin = 0 : i8, umax = 12 : i8, umin = 0 : i8}> : () -> i8
    %2 = "arith.shli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %3 = "test.reflect_bounds"(%2) : (i8) -> i8
    "func.return"(%3) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %1 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %2 = "arith.shli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %3 = "test.reflect_bounds"(%2) : (i8) -> i8
    "func.return"(%3) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "trivial_rem"}> ({
    %0 = "arith.constant"() <{value = 64 : i8}> : () -> i8
    %1 = "test.with_bounds"() <{smax = 63 : si8, smin = 0 : si8, umax = 63 : ui8, umin = 0 : ui8}> : () -> i8
    %2 = "arith.remsi"(%1, %0) : (i8, i8) -> i8
    "func.return"(%2) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "non_const_rhs"}> ({
    %0 = "arith.constant"() <{value = 64 : i8}> : () -> i8
    %1 = "test.with_bounds"() <{smax = 2 : si8, smin = 0 : si8, umax = 2 : ui8, umin = 0 : ui8}> : () -> i8
    %2 = "test.with_bounds"() <{smax = 64 : si8, smin = 63 : si8, umax = 64 : ui8, umin = 63 : ui8}> : () -> i8
    %3 = "arith.remui"(%1, %2) : (i8, i8) -> i8
    "func.return"(%3) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "wraps"}> ({
    %0 = "arith.constant"() <{value = 64 : i8}> : () -> i8
    %1 = "test.with_bounds"() <{smax = 65 : si8, smin = 63 : si8, umax = 65 : ui8, umin = 63 : ui8}> : () -> i8
    %2 = "arith.remsi"(%1, %0) : (i8, i8) -> i8
    "func.return"(%2) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, tensor<128xi1>) -> tensor<128xi64>, sym_name = "analysis_crash"}> ({
  ^bb0(%arg0: i32, %arg1: tensor<128xi1>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = dense<-1> : tensor<128xi32>}> : () -> tensor<128xi32>
    %2 = "tensor.splat"(%arg0) : (i32) -> tensor<128xi32>
    %3 = "scf.for"(%0, %arg0, %arg0, %2) ({
    ^bb0(%arg2: i32, %arg3: tensor<128xi32>):
      "scf.yield"(%arg3) : (tensor<128xi32>) -> ()
    }) : (i32, i32, i32, tensor<128xi32>) -> tensor<128xi32>
    %4 = "arith.select"(%arg1, %3, %1) : (tensor<128xi1>, tensor<128xi32>, tensor<128xi32>) -> tensor<128xi32>
    %5 = "arith.extsi"(%4) : (tensor<128xi32>) -> tensor<128xi64>
    "func.return"(%5) : (tensor<128xi64>) -> ()
  }) : () -> ()
}) : () -> ()

