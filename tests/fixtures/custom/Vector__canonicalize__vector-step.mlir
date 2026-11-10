module {
  func.func @ugt_constant_3_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ugt_constant_2_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ugt_constant_3_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ugt_constant_max_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<9223372036854775807> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ugt_constant_2_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ugt_constant_1_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<1> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ugt, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @uge_constant_2_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi uge, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_uge_constant_1_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<1> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi uge, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @uge_constant_3_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi uge, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_uge_constant_2_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi uge, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ult_constant_2_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ult, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ult_constant_1_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<1> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ult, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ult_constant_3_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ult, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ult_constant_2_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ult, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ule_constant_3_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ule, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ule_constant_2_lhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ule, %cst, %0 : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ule_constant_2_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ule, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ule_constant_1_rhs() -> vector<3xi1> {
    %cst = arith.constant dense<1> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ule, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @eq_constant_3() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi eq, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_eq_constant_2() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi eq, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ne_constant_3() -> vector<3xi1> {
    %cst = arith.constant dense<3> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ne, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @negative_ne_constant_2() -> vector<3xi1> {
    %cst = arith.constant dense<2> : vector<3xindex>
    %0 = vector.step : vector<3xindex>
    %1 = arith.cmpi ne, %0, %cst : vector<3xindex>
    return %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @ult_i32_constant_4_rhs() -> vector<4xi1> {
    %cst = arith.constant dense<4> : vector<4xi32>
    %0 = vector.step : vector<4xi32>
    %1 = arith.cmpi ult, %0, %cst : vector<4xi32>
    return %1 : vector<4xi1>
  }
}

// -----
module {
  func.func @negative_ult_i32_constant_2_rhs() -> vector<4xi1> {
    %cst = arith.constant dense<2> : vector<4xi32>
    %0 = vector.step : vector<4xi32>
    %1 = arith.cmpi ult, %0, %cst : vector<4xi32>
    return %1 : vector<4xi1>
  }
}

// -----
module {
  func.func @negative_ult_i8_wrap() -> vector<300xi1> {
    %cst = arith.constant dense<100> : vector<300xi8>
    %0 = vector.step : vector<300xi8>
    %1 = arith.cmpi ult, %0, %cst : vector<300xi8>
    return %1 : vector<300xi1>
  }
}

