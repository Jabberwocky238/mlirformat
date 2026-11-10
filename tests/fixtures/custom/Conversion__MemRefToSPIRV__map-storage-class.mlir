module {
  func.func @operand_result() {
    %0 = "dialect.memref_producer"() : () -> memref<f32>
    %1 = "dialect.memref_producer"() : () -> memref<4xi32, 1>
    %2 = "dialect.memref_producer"() : () -> memref<?x4xf16, 3>
    %3 = "dialect.memref_producer"() : () -> memref<*xf16, 4>
    %4 = "dialect.memref_producer"() : () -> memref<*xf16, 5>
    %5 = "dialect.memref_producer"() : () -> memref<*xf16, 6>
    %6 = "dialect.memref_producer"() : () -> memref<*xf16, 7>
    "dialect.memref_consumer"(%0) : (memref<f32>) -> ()
    "dialect.memref_consumer"(%1) : (memref<4xi32, 1>) -> ()
    "dialect.memref_consumer"(%2) : (memref<?x4xf16, 3>) -> ()
    "dialect.memref_consumer"(%3) : (memref<*xf16, 4>) -> ()
    "dialect.memref_consumer"(%4) : (memref<*xf16, 5>) -> ()
    "dialect.memref_consumer"(%5) : (memref<*xf16, 6>) -> ()
    "dialect.memref_consumer"(%6) : (memref<*xf16, 7>) -> ()
    return
  }
}

// -----
module {
  func.func @type_attribute() {
    "dialect.memref_producer"() {attr = memref<i32, 1>} : () -> ()
    return
  }
}

// -----
module {
  func.func @function_io(%arg0: memref<f64, 1>, %arg1: memref<4xi32, 3>) -> (memref<f64, 1>, memref<4xi32, 3>) {
    return %arg0, %arg1 : memref<f64, 1>, memref<4xi32, 3>
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @function_io(%arg0: memref<8xi32>) kernel {
      gpu.return
    }
  }
}

// -----
module {
  func.func @region(%arg0: i1, %arg1: memref<f32, 1>) {
    scf.if %arg0 {
      %0 = "dialect.memref_consumer"(%arg1) {attr = memref<i64, 3>} : (memref<f32, 1>) -> memref<f32, 1>
    }
    return
  }
}

// -----
module {
  func.func @non_memref_types(%arg0: f32) -> f32 {
    %0 = "dialect.op"(%arg0) {attr = 16 : i64} : (f32) -> f32
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} {
  func.func @operand_result() {
    %0 = "dialect.memref_producer"() : () -> memref<f32>
    %1 = "dialect.memref_producer"() : () -> memref<4xi32, 1>
    %2 = "dialect.memref_producer"() : () -> memref<?x4xf16, 3>
    %3 = "dialect.memref_producer"() : () -> memref<*xf16, 4>
    "dialect.memref_consumer"(%0) : (memref<f32>) -> ()
    "dialect.memref_consumer"(%1) : (memref<4xi32, 1>) -> ()
    "dialect.memref_consumer"(%2) : (memref<?x4xf16, 3>) -> ()
    "dialect.memref_consumer"(%3) : (memref<*xf16, 4>) -> ()
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @operand_result() {
    %0 = "dialect.memref_producer"() : () -> memref<f32>
    %1 = "dialect.memref_producer"() : () -> memref<4xi32, 1>
    %2 = "dialect.memref_producer"() : () -> memref<?x4xf16, 3>
    %3 = "dialect.memref_producer"() : () -> memref<*xf16, 4>
    "dialect.memref_consumer"(%0) : (memref<f32>) -> ()
    "dialect.memref_consumer"(%1) : (memref<4xi32, 1>) -> ()
    "dialect.memref_consumer"(%2) : (memref<?x4xf16, 3>) -> ()
    "dialect.memref_consumer"(%3) : (memref<*xf16, 4>) -> ()
    return
  }
}

