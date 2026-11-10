module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @global_double_load() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable, %global_variable_0) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @global_double_store() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @global_store_load() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @global_store_load_region() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    "unregistered.dummy2"() ({
      %cst = arith.constant dense<0> : tensor<4xi32>
      ml_program.global_store @global_variable = %cst : tensor<4xi32>
      "unregistered.terminator"() : () -> ()
    }) : () -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @interrupt() {
    %cst = arith.constant dense<0> : tensor<4xi32>
    ml_program.global_store @global_variable = %cst : tensor<4xi32>
    return
  }
  func.func @call_global_store() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    call @interrupt() : () -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @interrupt_indirect() {
    %cst = arith.constant dense<0> : tensor<4xi32>
    ml_program.global_store @global_variable = %cst : tensor<4xi32>
    return
  }
  func.func @interrupt() {
    call @interrupt_indirect() : () -> ()
    return
  }
  func.func @call_indirect_store() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    call @interrupt() : () -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @interrupt_indirect() -> tensor<4xi32> {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    return %global_variable : tensor<4xi32>
  }
  func.func @interrupt() {
    %0 = call @interrupt_indirect() : () -> tensor<4xi32>
    "unregistered.dummy"(%0) : (tensor<4xi32>) -> ()
    return
  }
  func.func @call_indirect_load() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    call @interrupt() : () -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @call_with_unresolvable_callee(%arg0: memref<f32>) {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    test.call_and_store @callee(%arg0), %arg0 {store_before_call = false} : (memref<f32>, memref<f32>) -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    return
  }
}

// -----
module {
  ml_program.global private mutable @global_variable(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @call_recursive() {
    %global_variable = ml_program.global_load @global_variable : tensor<4xi32>
    %0 = "unregistered.dummy"(%global_variable) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %0 : tensor<4xi32>
    call @call_recursive() : () -> ()
    %global_variable_0 = ml_program.global_load @global_variable : tensor<4xi32>
    %1 = "unregistered.dummy"(%global_variable_0) : (tensor<4xi32>) -> tensor<4xi32>
    ml_program.global_store @global_variable = %1 : tensor<4xi32>
    return
  }
}

