module {
  func.func private @second_order_arg(() -> ())
  func.func private @second_order_result() -> (() -> ())
  func.func private @second_order_multi_result() -> (() -> i32, () -> i64, () -> f32)
  func.func private @memref_call_conv(memref<?xf32>)
  func.func private @memref_call_conv_nested((memref<?xf32>) -> ())
  func.func @pass_through(%arg0: () -> ()) -> (() -> ()) {
    cf.br ^bb1(%arg0 : () -> ())
  ^bb1(%0: () -> ()):  // pred: ^bb0
    return %0 : () -> ()
  }
  func.func private @llvmlinkage(i32) attributes {llvm.linkage = #llvm.linkage<extern_weak>}
  func.func private @llvmreadnone(i32) attributes {llvm.readnone}
  func.func private @body(i32)
  func.func @indirect_const_call(%arg0: i32) {
    %f = constant @body : (i32) -> ()
    call_indirect %f(%arg0) : (i32) -> ()
    return
  }
  func.func @indirect_call(%arg0: (f32) -> i32, %arg1: f32) -> i32 {
    %0 = call_indirect %arg0(%arg1) : (f32) -> i32
    return %0 : i32
  }
  func.func @variadic_func(%arg0: i32) attributes {func.varargs = true} {
    return
  }
  func.func private @target_cpu() attributes {llvm.target_cpu = "gfx90a"}
  func.func private @target_features() attributes {llvm.target_features = #llvm.target_features<["+sme", "+sve"]>}
  func.func private @passthrough_attr() attributes {llvm.passthrough = ["presplitcoroutine"]}
}

// -----
module {
  func.func private @private_callee(%arg0: f32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
  func.func @caller_private_callee(%arg0: f32) -> i32 {
    %0 = call @private_callee(%arg0) : (f32) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @empty_res_attrs() {
    return
  }
}

// -----
module {
  func.func @host_next_to_gpu_module() attributes {llvm.linkage = #llvm.linkage<internal>} {
    return
  }
  gpu.module @gpu_mod {
    gpu.func @gpu_kernel() kernel {
      gpu.return
    }
  }
}

