module {
  func.func @trunc_bf16(%arg0: f32) {
    %0 = arith.truncf %arg0 : f32 to bf16
    %1 = arith.extf %0 : bf16 to f32
    vector.print %1 : f32
    return
  }
  func.func @main() {
    %c1065385984_i32 = arith.constant 1065385984 : i32
    %0 = arith.bitcast %c1065385984_i32 : i32 to f32
    call @trunc_bf16(%0) : (f32) -> ()
    %c1065451520_i32 = arith.constant 1065451520 : i32
    %1 = arith.bitcast %c1065451520_i32 : i32 to f32
    call @trunc_bf16(%1) : (f32) -> ()
    %c-1082097664_i32 = arith.constant -1082097664 : i32
    %2 = arith.bitcast %c-1082097664_i32 : i32 to f32
    call @trunc_bf16(%2) : (f32) -> ()
    %c-1082097663_i32 = arith.constant -1082097663 : i32
    %3 = arith.bitcast %c-1082097663_i32 : i32 to f32
    call @trunc_bf16(%3) : (f32) -> ()
    %c2139095040_i32 = arith.constant 2139095040 : i32
    %4 = arith.bitcast %c2139095040_i32 : i32 to f32
    call @trunc_bf16(%4) : (f32) -> ()
    %c-8388608_i32 = arith.constant -8388608 : i32
    %5 = arith.bitcast %c-8388608_i32 : i32 to f32
    call @trunc_bf16(%5) : (f32) -> ()
    %c2139095039_i32 = arith.constant 2139095039 : i32
    %6 = arith.bitcast %c2139095039_i32 : i32 to f32
    call @trunc_bf16(%6) : (f32) -> ()
    %c-8388609_i32 = arith.constant -8388609 : i32
    %7 = arith.bitcast %c-8388609_i32 : i32 to f32
    call @trunc_bf16(%7) : (f32) -> ()
    %c2139029503_i32 = arith.constant 2139029503 : i32
    %8 = arith.bitcast %c2139029503_i32 : i32 to f32
    call @trunc_bf16(%8) : (f32) -> ()
    %c1070596095_i32 = arith.constant 1070596095 : i32
    %9 = arith.bitcast %c1070596095_i32 : i32 to f32
    call @trunc_bf16(%9) : (f32) -> ()
    %c-1076887553_i32 = arith.constant -1076887553 : i32
    %10 = arith.bitcast %c-1076887553_i32 : i32 to f32
    call @trunc_bf16(%10) : (f32) -> ()
    return
  }
}

