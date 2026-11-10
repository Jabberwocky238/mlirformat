"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "typeFitsType"}> ({
    %0 = "testd.any"() : () -> !testd.parametric<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "attrDoesntFitType"}> ({
    %0 = "testd.any"() : () -> !testd.parametric<"foo">
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "attrFitsAttr"}> ({
    %0 = "testd.any"() : () -> !testd.attr_in_type_out<"foo">
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "typeFitsAttr"}> ({
    %0 = "testd.any"() : () -> !testd.attr_in_type_out<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededEqConstraint"}> ({
    %0 = "testd.eq"() : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAnyOfConstraint"}> ({
    %0 = "testd.anyof"() : () -> i32
    %1 = "testd.anyof"() : () -> i64
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAllOfConstraint"}> ({
    %0 = "testd.all_of"() : () -> i64
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAnyConstraint"}> ({
    %0 = "testd.any"() : () -> i32
    %1 = "testd.any"() : () -> i64
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededDynBaseConstraint"}> ({
    %0 = "testd.dyn_type_base"() : () -> !testd.parametric<i32>
    %1 = "testd.dyn_type_base"() : () -> !testd.parametric<i64>
    %2 = "testd.dyn_type_base"() : () -> !testd.parametric<!testd.parametric<i64>>
    "testd.dyn_attr_base"() {attr1 = #testd.parametric_attr<i32>} : () -> ()
    "testd.dyn_attr_base"() {attr1 = #testd.parametric_attr<i64>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededNamedBaseConstraint"}> ({
    %0 = "testd.named_type_base"() : () -> i32
    %1 = "testd.named_type_base"() : () -> i64
    "testd.named_attr_base"() {attr1 = 0 : i32} : () -> ()
    "testd.named_attr_base"() {attr1 = 0 : i64} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededDynParamsConstraint"}> ({
    %0 = "testd.dynparams"() : () -> !testd.parametric<i32>
    %1 = "testd.dynparams"() : () -> !testd.parametric<i64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededConstraintVars"}> ({
    %0:2 = "testd.constraint_vars"() : () -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededConstraintVars2"}> ({
    %0:2 = "testd.constraint_vars"() : () -> (i64, i64)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededAttrs"}> ({
    "testd.attrs"() {attr1 = i32, attr2 = i64} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededRegions"}> ({
    "testd.regions"() ({
      "llvm.unreachable"() : () -> ()
    }, {
    ^bb0(%arg0: i32, %arg1: i64):
      "llvm.unreachable"() : () -> ()
    }, {
      "cf.br"()[^bb2] : () -> ()
    ^bb1:  // no predecessors
      "cf.br"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "llvm.unreachable"() : () -> ()
    }, {
      "llvm.unreachable"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededRegionWithNoConstraints"}> ({
    "testd.regions"() ({
    ^bb0(%arg2: i32, %arg3: i64, %arg4: f64):
      "llvm.unreachable"() : () -> ()
    ^bb1(%0: i32, %1: i64, %2: f64):  // no predecessors
      "llvm.unreachable"() : () -> ()
    ^bb2(%3: i32, %4: i64, %5: f64):  // no predecessors
      "llvm.unreachable"() : () -> ()
    ^bb3(%6: i32, %7: i64, %8: f64):  // no predecessors
      "llvm.unreachable"() : () -> ()
    ^bb4(%9: i32, %10: i64, %11: f64):  // no predecessors
      "llvm.unreachable"() : () -> ()
    }, {
    ^bb0(%arg0: i32, %arg1: i64):
      "llvm.unreachable"() : () -> ()
    }, {
      "cf.br"()[^bb2] : () -> ()
    ^bb1:  // no predecessors
      "cf.br"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "llvm.unreachable"() : () -> ()
    }, {
      "llvm.unreachable"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "successReuseConstraintBetweenRegionAndOperand"}> ({
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "testd.region_and_operand"(%0) ({
    ^bb0(%arg0: i32):
      "llvm.unreachable"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

