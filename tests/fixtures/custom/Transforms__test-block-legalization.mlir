module {
  func.func @complex_block_signature_conversion() {
    %cst = complex.constant [0.000000e+00, 0.000000e+00] : complex<f64>
    %true = arith.constant true
    %0 = scf.if %true -> (complex<f64>) {
      scf.yield %cst : complex<f64>
    } else {
      scf.yield %cst : complex<f64>
    }
    "test.consumer_of_complex"(%0) : (complex<f64>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.dialect_to_llvm "cf"
        transform.apply_conversion_patterns.func.func_to_llvm
        transform.apply_conversion_patterns.scf.scf_to_control_flow
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter
      } {legal_dialects = ["llvm"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

