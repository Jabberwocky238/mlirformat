module {
  func.func @typeFitsType() {
    %0 = "testd.any"() : () -> !testd.parametric<i32>
    return
  }
}

// -----
module {
  func.func @attrDoesntFitType() {
    %0 = "testd.any"() : () -> !testd.parametric<"foo">
    return
  }
}

// -----
module {
  func.func @attrFitsAttr() {
    %0 = "testd.any"() : () -> !testd.attr_in_type_out<"foo">
    return
  }
}

// -----
module {
  func.func @typeFitsAttr() {
    %0 = "testd.any"() : () -> !testd.attr_in_type_out<i32>
    return
  }
}

// -----
module {
  func.func @succeededEqConstraint() {
    %0 = "testd.eq"() : () -> i32
    return
  }
}

// -----
module {
  func.func @succeededAnyOfConstraint() {
    %0 = "testd.anyof"() : () -> i32
    %1 = "testd.anyof"() : () -> i64
    return
  }
}

// -----
module {
  func.func @succeededAllOfConstraint() {
    %0 = "testd.all_of"() : () -> i64
    return
  }
}

// -----
module {
  func.func @succeededAnyConstraint() {
    %0 = "testd.any"() : () -> i32
    %1 = "testd.any"() : () -> i64
    return
  }
}

// -----
module {
  func.func @succeededDynBaseConstraint() {
    %0 = "testd.dyn_type_base"() : () -> !testd.parametric<i32>
    %1 = "testd.dyn_type_base"() : () -> !testd.parametric<i64>
    %2 = "testd.dyn_type_base"() : () -> !testd.parametric<!testd.parametric<i64>>
    "testd.dyn_attr_base"() {attr1 = #testd.parametric_attr<i32>} : () -> ()
    "testd.dyn_attr_base"() {attr1 = #testd.parametric_attr<i64>} : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededNamedBaseConstraint() {
    %0 = "testd.named_type_base"() : () -> i32
    %1 = "testd.named_type_base"() : () -> i64
    "testd.named_attr_base"() {attr1 = 0 : i32} : () -> ()
    "testd.named_attr_base"() {attr1 = 0 : i64} : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededDynParamsConstraint() {
    %0 = "testd.dynparams"() : () -> !testd.parametric<i32>
    %1 = "testd.dynparams"() : () -> !testd.parametric<i64>
    return
  }
}

// -----
module {
  func.func @succeededConstraintVars() {
    %0:2 = "testd.constraint_vars"() : () -> (i32, i32)
    return
  }
}

// -----
module {
  func.func @succeededConstraintVars2() {
    %0:2 = "testd.constraint_vars"() : () -> (i64, i64)
    return
  }
}

// -----
module {
  func.func @succeededAttrs() {
    "testd.attrs"() {attr1 = i32, attr2 = i64} : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededRegions() {
    "testd.regions"() ({
      llvm.unreachable
    }, {
    ^bb0(%arg0: i32, %arg1: i64):
      llvm.unreachable
    }, {
      cf.br ^bb2
    ^bb1:  // no predecessors
      cf.br ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      llvm.unreachable
    }, {
      llvm.unreachable
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededRegionWithNoConstraints() {
    "testd.regions"() ({
    ^bb0(%arg0: i32, %arg1: i64, %arg2: f64):
      llvm.unreachable
    ^bb1(%0: i32, %1: i64, %2: f64):  // no predecessors
      llvm.unreachable
    ^bb2(%3: i32, %4: i64, %5: f64):  // no predecessors
      llvm.unreachable
    ^bb3(%6: i32, %7: i64, %8: f64):  // no predecessors
      llvm.unreachable
    ^bb4(%9: i32, %10: i64, %11: f64):  // no predecessors
      llvm.unreachable
    }, {
    ^bb0(%arg0: i32, %arg1: i64):
      llvm.unreachable
    }, {
      cf.br ^bb2
    ^bb1:  // no predecessors
      cf.br ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      llvm.unreachable
    }, {
      llvm.unreachable
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @successReuseConstraintBetweenRegionAndOperand() {
    %c42_i32 = arith.constant 42 : i32
    "testd.region_and_operand"(%c42_i32) ({
    ^bb0(%arg0: i32):
      llvm.unreachable
    }) : (i32) -> ()
    return
  }
}

