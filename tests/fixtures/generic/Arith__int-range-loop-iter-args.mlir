"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bounded_acc_for"}> ({
  ^bb0(%arg5: i32):
    %16 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %17 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %18 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %19 = "scf.for"(%16, %arg5, %17, %16) ({
    ^bb0(%arg6: i32, %arg7: i32):
      %21 = "arith.addi"(%arg7, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %22 = "arith.minsi"(%21, %18) : (i32, i32) -> i32
      "scf.yield"(%22) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    %20 = "test.reflect_bounds"(%19) : (i32) -> i32
    "func.return"(%20) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "bounded_acc_while"}> ({
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %11 = "scf.while"(%7) ({
    ^bb0(%arg4: i32):
      %15 = "arith.cmpi"(%arg4, %10) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "scf.condition"(%15, %arg4) : (i1, i32) -> ()
    }, {
    ^bb0(%arg3: i32):
      %13 = "arith.addi"(%arg3, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %14 = "arith.minsi"(%13, %9) : (i32, i32) -> i32
      "scf.yield"(%14) : (i32) -> ()
    }) : (i32) -> i32
    %12 = "test.reflect_bounds"(%11) : (i32) -> i32
    "func.return"(%12) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bounded_mask_for"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 15 : i32}> : () -> i32
    %3 = "scf.for"(%0, %arg0, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      %5 = "arith.addi"(%arg2, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.andi"(%5, %2) : (i32, i32) -> i32
      "scf.yield"(%6) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    %4 = "test.reflect_bounds"(%3) : (i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

