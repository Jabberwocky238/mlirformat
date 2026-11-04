module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} {
  func.func @check_poison() {
    %0 = ub.poison : index
    %1 = ub.poison : i16
    %2 = ub.poison : f64
    %3 = ub.poison : vector<4xf32>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} {
  func.func @check_unrechable(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    ub.unreachable
  ^bb2:  // pred: ^bb0
    return
  }
}

