"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "single_element"}> ({
    "func.return"() {test_to_sort} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "simple_region"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 42 : i32}> {test_to_sort} : () -> i32
    "scf.if"(%arg0) ({
      %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %2 = "arith.subi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> {test_to_sort} : (i32, i32) -> i32
      "scf.yield"() : () -> ()
    }, {
    }) {test_to_sort} : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "multi_region"}> ({
  ^bb0(%arg0: i1):
    "scf.if"(%arg0) ({
      %1 = "arith.constant"() <{value = 42 : i32}> {test_to_sort} : () -> i32
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "scf.if"(%arg0) ({
      %0 = "arith.constant"() <{value = 24 : i32}> {test_to_sort} : () -> i32
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

