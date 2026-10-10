"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "f"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "scf.if"(%arg0) ({
      "scf.yield"(%0) : (i32) -> ()
    }, {
      "scf.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %2 = "arith.addi"(%1, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "scf.if"(%0) ({
      "scf.yield"(%0) : (i1) -> ()
    }, {
      "scf.yield"(%0) : (i1) -> ()
    }) : (i1) -> i1
    %2 = "arith.select"(%1, %1, %1) : (i1, i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "scf.if"(%0) ({
      "scf.yield"(%0) : (i1) -> ()
    }, {
      "scf.yield"(%0) : (i1) -> ()
    }) : (i1) -> i1
    %2 = "arith.select"(%0, %1, %1) : (i1, i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

