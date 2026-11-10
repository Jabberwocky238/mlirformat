module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @return_none_val() {
    return
  }
  func.func @return_one_val(%arg0: f32) -> f32 {
    return %arg0 : f32
  }
  func.func @return_multi_val(%arg0: f32) -> (f32, f32) {
    return %arg0, %arg0 : f32, f32
  }
  func.func @return_one_index(%arg0: index) -> index {
    return %arg0 : index
  }
  func.func @call_functions(%arg0: index) -> index {
    call @return_none_val() : () -> ()
    %0 = call @return_one_index(%arg0) : (index) -> index
    return %0 : index
  }
}

// -----
module {
}

