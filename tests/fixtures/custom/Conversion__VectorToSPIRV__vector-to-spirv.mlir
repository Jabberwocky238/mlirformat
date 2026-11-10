module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16], []>, #spirv.resource_limits<>>} {
  func.func @bitcast(%arg0: vector<2xf32>, %arg1: vector<2xf16>) -> (vector<4xf16>, vector<1xf32>) {
    %0 = vector.bitcast %arg0 : vector<2xf32> to vector<4xf16>
    %1 = vector.bitcast %arg1 : vector<2xf16> to vector<1xf32>
    return %0, %1 : vector<4xf16>, vector<1xf32>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @bitcast(%arg0: vector<2xf32>, %arg1: vector<2xf16>) -> (vector<4xf16>, vector<1xf32>) {
    %0 = vector.bitcast %arg0 : vector<2xf32> to vector<4xf16>
    %1 = vector.bitcast %arg1 : vector<2xf16> to vector<1xf32>
    return %0, %1 : vector<4xf16>, vector<1xf32>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} {
  func.func @cl_fma(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @cl_fma_size1_vector(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @cl_reduction_maximumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maximumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
  func.func @cl_reduction_minimumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minimumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
  func.func @cl_reduction_maxsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
  func.func @cl_reduction_minsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
  func.func @cl_reduction_maxui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
  func.func @cl_reduction_minui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @broadcast(%arg0: f32) -> (vector<4xf32>, vector<2xf32>) {
    %0 = vector.broadcast %arg0 : f32 to vector<4xf32>
    %1 = vector.broadcast %arg0 : f32 to vector<2xf32>
    return %0, %1 : vector<4xf32>, vector<2xf32>
  }
}

// -----
module {
  func.func @broadcast_index(%arg0: index) -> vector<4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @extract(%arg0: vector<2xf32>) -> f32 {
    %0 = vector.extract %arg0[1] : f32 from vector<2xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_poison_idx(%arg0: vector<4xf32>) -> f32 {
    %0 = vector.extract %arg0[-1] : f32 from vector<4xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_size1_vector(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.extract %arg0[0] : f32 from vector<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_size1_vector_dynamic(%arg0: vector<1xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_dynamic(%arg0: vector<4xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<4xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_dynamic_non_pow2(%arg0: vector<3xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<3xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_dynamic_cst(%arg0: vector<4xf32>) -> f32 {
    %c1 = arith.constant 1 : index
    %0 = vector.extract %arg0[%c1] : f32 from vector<4xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @to_elements_one_element(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.to_elements %arg0 : vector<1xf32>
    return %0 : f32
  }
  func.func @to_elements_no_dead_elements(%arg0: vector<4xf32>) -> (f32, f32, f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    return %0#0, %0#1, %0#2, %0#3 : f32, f32, f32, f32
  }
  func.func @to_elements_dead_elements(%arg0: vector<4xf32>) -> (f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    return %0#1, %0#3 : f32, f32
  }
}

// -----
module {
  func.func @from_elements_0d_f32(%arg0: f32) -> vector<f32> {
    %0 = vector.from_elements %arg0 : vector<f32>
    return %0 : vector<f32>
  }
  func.func @from_elements_1xf32(%arg0: f32) -> vector<1xf32> {
    %0 = vector.from_elements %arg0 : vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @from_elements_3xf32(%arg0: f32, %arg1: f32, %arg2: f32) -> vector<3xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2 : vector<3xf32>
    return %0 : vector<3xf32>
  }
  func.func @from_elements_3xi8(%arg0: i8, %arg1: i8, %arg2: i8) -> vector<3xi8> {
    %0 = vector.from_elements %arg0, %arg1, %arg2 : vector<3xi8>
    return %0 : vector<3xi8>
  }
}

// -----
module {
  func.func @insert(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = vector.insert %arg1, %arg0 [2] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_poison_idx(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = vector.insert %arg1, %arg0 [-1] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_index_vector(%arg0: vector<4xindex>, %arg1: index) -> vector<4xindex> {
    %0 = vector.insert %arg1, %arg0 [2] : index into vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @insert_size1_vector(%arg0: vector<1xf32>, %arg1: f32) -> vector<1xf32> {
    %0 = vector.insert %arg1, %arg0 [0] : f32 into vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @insert_size1_vector_dynamic(%arg0: vector<1xf32>, %arg1: f32, %arg2: index) -> vector<1xf32> {
    %0 = vector.insert %arg1, %arg0 [%arg2] : f32 into vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @insert_dynamic(%arg0: f32, %arg1: vector<4xf32>, %arg2: index) -> vector<4xf32> {
    %0 = vector.insert %arg0, %arg1 [%arg2] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_dynamic_non_pow2(%arg0: f32, %arg1: vector<3xf32>, %arg2: index) -> vector<3xf32> {
    %0 = vector.insert %arg0, %arg1 [%arg2] : f32 into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @insert_dynamic_cst(%arg0: f32, %arg1: vector<4xf32>) -> vector<4xf32> {
    %c2 = arith.constant 2 : index
    %0 = vector.insert %arg0, %arg1 [%c2] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @extract_strided_slice(%arg0: vector<4xf32>) -> (vector<2xf32>, vector<1xf32>) {
    %0 = vector.extract_strided_slice %arg0 {offsets = [1], sizes = [2], strides = [1]} : vector<4xf32> to vector<2xf32>
    %1 = vector.extract_strided_slice %arg0 {offsets = [1], sizes = [1], strides = [1]} : vector<4xf32> to vector<1xf32>
    return %0, %1 : vector<2xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice(%arg0: vector<2xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [1], strides = [1]} : vector<2xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_size1_vector(%arg0: vector<1xf32>, %arg1: vector<3xf32>) -> vector<3xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2], strides = [1]} : vector<1xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @fma(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fma_size1_vector(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @splat(%arg0: f32) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @splat_size1_vector(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xf32>, %arg1: vector<1xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 1, 0] : vector<1xf32>, vector<1xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @shuffle_index_vector(%arg0: vector<1xindex>, %arg1: vector<1xindex>) -> vector<4xindex> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 1, 0] : vector<1xindex>, vector<1xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<3xf32>, %arg1: vector<3xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [3, 2, 5, 1] : vector<3xf32>, vector<3xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<2x16xf32>, %arg1: vector<1x16xf32>) -> vector<3x16xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 2] : vector<2x16xf32>, vector<1x16xf32>
    return %0 : vector<3x16xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 2, 3] : vector<1xi32>, vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<3xi32>, %arg1: vector<1xi32>) -> vector<3xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 2, 3] : vector<3xi32>, vector<1xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xi32>, %arg1: vector<1xi32>) -> vector<2xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<1xi32>, vector<1xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<1xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0] : vector<4xi32>, vector<4xi32>
    return %0 : vector<1xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<1xi32> {
    %0 = vector.shuffle %arg0, %arg1 [5] : vector<4xi32>, vector<4xi32>
    return %0 : vector<1xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = vector.shuffle %arg0, %arg1 [1, -1, 5, -1] : vector<4xi32>, vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @interleave(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<4xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<2xf32> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @interleave_size1(%arg0: vector<1xf32>, %arg1: vector<1xf32>) -> vector<2xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<1xf32> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @deinterleave(%arg0: vector<4xf32>) -> (vector<2xf32>, vector<2xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<4xf32> -> vector<2xf32>
    return %res1, %res2 : vector<2xf32>, vector<2xf32>
  }
}

// -----
module {
  func.func @deinterleave_scalar(%arg0: vector<2xf32>) -> (vector<1xf32>, vector<1xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2xf32> -> vector<1xf32>
    return %res1, %res2 : vector<1xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @reduction_add(%arg0: vector<4xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<4xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_addf_mulf(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> f32 {
    %0 = arith.mulf %arg0, %arg1 : vector<4xf32>
    %1 = vector.reduction <add>, %0 : vector<4xf32> into f32
    return %1 : f32
  }
}

// -----
module {
  func.func @reduction_addf_acc_mulf(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg1 : vector<4xf32>
    %1 = vector.reduction <add>, %0, %arg2 : vector<4xf32> into f32
    return %1 : f32
  }
}

// -----
module {
  func.func @reduction_addf_mulf(%arg0: vector<4xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<4xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_addf_acc(%arg0: vector<4xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<4xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_addf_one_elem(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<1xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_addf_one_elem_acc(%arg0: vector<1xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<1xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_mul(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <mul>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_maximumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maximumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_minimumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minimumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_maxsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_minsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_maxui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_minui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_and(%arg0: vector<4xi32>) -> i32 {
    %0 = vector.reduction <and>, %arg0 : vector<4xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_and_acc(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <and>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_or(%arg0: vector<4xi32>) -> i32 {
    %0 = vector.reduction <or>, %arg0 : vector<4xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_or_acc(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <or>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_xor(%arg0: vector<4xi32>) -> i32 {
    %0 = vector.reduction <xor>, %arg0 : vector<4xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_xor_acc(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <xor>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_or_bool(%arg0: vector<4xi1>) -> i1 {
    %0 = vector.reduction <or>, %arg0 : vector<4xi1> into i1
    return %0 : i1
  }
}

// -----
module {
  func.func @reduction_and_bool(%arg0: vector<4xi1>) -> i1 {
    %0 = vector.reduction <and>, %arg0 : vector<4xi1> into i1
    return %0 : i1
  }
}

// -----
module {
  func.func @reduction_or_bool_acc(%arg0: vector<4xi1>, %arg1: i1) -> i1 {
    %0 = vector.reduction <or>, %arg0, %arg1 : vector<4xi1> into i1
    return %0 : i1
  }
}

// -----
module {
  func.func @reduction_and_bool_acc(%arg0: vector<4xi1>, %arg1: i1) -> i1 {
    %0 = vector.reduction <and>, %arg0, %arg1 : vector<4xi1> into i1
    return %0 : i1
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [BFloat16DotProductKHR], [SPV_KHR_bfloat16]>, #spirv.resource_limits<>>} {
  func.func @reduction_bf16_addf_mulf(%arg0: vector<4xbf16>, %arg1: vector<4xbf16>) -> bf16 {
    %0 = arith.mulf %arg0, %arg1 : vector<4xbf16>
    %1 = vector.reduction <add>, %0 : vector<4xbf16> into bf16
    return %1 : bf16
  }
}

// -----
module {
  func.func @shape_cast_same_type(%arg0: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.shape_cast %arg0 : vector<2xf32> to vector<2xf32>
    return %arg0 : vector<2xf32>
  }
}

// -----
module {
  func.func @shape_cast_size1_vector(%arg0: vector<f32>) -> vector<1xf32> {
    %0 = vector.shape_cast %arg0 : vector<f32> to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @step() -> vector<4xindex> {
    %0 = vector.step : vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @step_size1() -> vector<1xindex> {
    %0 = vector.step : vector<1xindex>
    return %0 : vector<1xindex>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Shader], []>, #spirv.resource_limits<>>} {
  func.func @step_i8() -> vector<4xi8> {
    %0 = vector.step : vector<4xi8>
    return %0 : vector<4xi8>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int16, Shader], []>, #spirv.resource_limits<>>} {
  func.func @step_size1_i16() -> vector<1xi16> {
    %0 = vector.step : vector<1xi16>
    return %0 : vector<1xi16>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @vector_load(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.load %arg0[%c0] : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @vector_load_single_elem(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>) -> vector<1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.load %arg0[%c0] : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @vector_load_aligned(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0] {alignment = 8 : i64} : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @vector_load_2d(%arg0: memref<4x4xf32, #spirv.storage_class<StorageBuffer>>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.load %arg0[%c0, %c1] : memref<4x4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @vector_store(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0] : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return
  }
  func.func @vector_store_aligned(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0] {alignment = 8 : i64} : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return
  }
  func.func @vector_store_single_elem(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0] : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<1xf32>
    return
  }
  func.func @vector_store_2d(%arg0: memref<4x4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    vector.store %arg1, %arg0[%c0, %c1] : memref<4x4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return
  }
  func.func @vector_store_index(%arg0: memref<4xindex, #spirv.storage_class<StorageBuffer>>, %arg1: vector<4xindex>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0] : memref<4xindex, #spirv.storage_class<StorageBuffer>>, vector<4xindex>
    return
  }
}

// -----
module {
  func.func @vector_load(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0] : memref<4xf32, #spirv.storage_class<StorageBuffer>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

