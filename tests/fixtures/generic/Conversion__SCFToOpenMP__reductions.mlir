"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "reduction1"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "scf.reduce"(%3) ({
      ^bb0(%arg7: f32, %arg8: f32):
        %4 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%4) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "reduction2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "scf.reduce"(%3) ({
      ^bb0(%arg7: f32, %arg8: f32):
        %4 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%4) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "reduction_muli"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.constant"() <{value = 2 : i32}> : () -> i32
      "scf.reduce"(%3) ({
      ^bb0(%arg7: i32, %arg8: i32):
        %4 = "arith.muli"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.reduce.return"(%4) : (i32) -> ()
      }) : (i32) -> ()
    }) : (index, index, index, index, index, index, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "reduction3"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "scf.reduce"(%3) ({
      ^bb0(%arg7: f32, %arg8: f32):
        %4 = "arith.cmpf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
        %5 = "arith.select"(%4, %arg7, %arg8) : (i1, f32, f32) -> f32
        "scf.reduce.return"(%5) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (f32, i64), sym_name = "reduction4"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %3:2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 2>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %5 = "arith.fptosi"(%4) : (f32) -> i64
      "scf.reduce"(%4, %5) ({
      ^bb0(%arg9: f32, %arg10: f32):
        %8 = "arith.cmpf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
        %9 = "arith.select"(%8, %arg9, %arg10) : (i1, f32, f32) -> f32
        "scf.reduce.return"(%9) : (f32) -> ()
      }, {
      ^bb0(%arg7: i64, %arg8: i64):
        %6 = "arith.cmpi"(%arg7, %arg8) <{predicate = 2 : i64}> : (i64, i64) -> i1
        %7 = "arith.select"(%6, %arg8, %arg7) : (i1, i64, i64) -> i64
        "scf.reduce.return"(%7) : (i64) -> ()
      }) : (f32, i64) -> ()
    }) : (index, index, index, index, index, index, f32, i64) -> (f32, i64)
    "func.return"(%3#0, %3#1) : (f32, i64) -> ()
  }) : () -> ()
}) : () -> ()

