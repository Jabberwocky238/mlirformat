module {
}

// -----
module {
  memref.global @gscalar : memref<f32> = dense<0.000000e+00>
  func.func @test_scalar_in_serial() {
    acc.serial {
      %0 = memref.get_global @gscalar : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.yield
    }
    return
  }
}

// -----
module {
  memref.global constant @gscalarconst : memref<f32> = dense<1.000000e+00>
  func.func @test_constant_in_serial() {
    acc.serial {
      %0 = memref.get_global @gscalarconst : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.yield
    }
    return
  }
}

// -----
module {
  memref.global @gscalar_routine : memref<f32> = dense<0.000000e+00>
  acc.routine @acc_routine_0 func(@test_scalar_in_accroutine)
  func.func @test_scalar_in_accroutine() attributes {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} {
    %0 = memref.get_global @gscalar_routine : memref<f32>
    %1 = memref.load %0[] : memref<f32>
    return
  }
}

// -----
module {
  memref.global constant @gscalarconst_routine : memref<f32> = dense<1.000000e+00>
  acc.routine @acc_routine_0 func(@test_constant_in_accroutine)
  func.func @test_constant_in_accroutine() attributes {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} {
    %0 = memref.get_global @gscalarconst_routine : memref<f32>
    %1 = memref.load %0[] : memref<f32>
    return
  }
}

// -----
module {
  memref.global @global_for_private : memref<f32> = dense<0.000000e+00>
  acc.private.recipe @private_recipe_with_global : memref<f32> init {
  ^bb0(%arg0: memref<f32>):
    %alloc = memref.alloc() : memref<f32>
    %0 = memref.get_global @global_for_private : memref<f32>
    %1 = memref.load %0[] : memref<f32>
    memref.store %1, %alloc[] : memref<f32>
    acc.yield %alloc : memref<f32>
  } destroy {
  ^bb0(%arg0: memref<f32>):
    memref.dealloc %arg0 : memref<f32>
    acc.terminator
  }
  func.func @test_private_recipe_referenced() {
    %alloc = memref.alloc() : memref<f32>
    %0 = acc.private varPtr(%alloc : memref<f32>) recipe(@private_recipe_with_global) -> memref<f32>
    acc.parallel private(%0 : memref<f32>) {
      %1 = memref.load %alloc[] : memref<f32>
      acc.yield
    }
    memref.dealloc %alloc : memref<f32>
    return
  }
}

// -----
module {
  memref.global @global_for_private_unused : memref<f32> = dense<0.000000e+00>
  acc.private.recipe @private_recipe_unused : memref<f32> init {
  ^bb0(%arg0: memref<f32>):
    %alloc = memref.alloc() : memref<f32>
    %0 = memref.get_global @global_for_private_unused : memref<f32>
    %1 = memref.load %0[] : memref<f32>
    memref.store %1, %alloc[] : memref<f32>
    acc.yield %alloc : memref<f32>
  } destroy {
  ^bb0(%arg0: memref<f32>):
    memref.dealloc %arg0 : memref<f32>
    acc.terminator
  }
  func.func @test_private_recipe_not_referenced() {
    %alloc = memref.alloc() : memref<f32>
    acc.parallel {
      %0 = memref.load %alloc[] : memref<f32>
      acc.yield
    }
    memref.dealloc %alloc : memref<f32>
    return
  }
}

// -----
module {
  memref.global @global_parallel : memref<f32> = dense<0.000000e+00>
  memref.global @global_kernels : memref<f32> = dense<0.000000e+00>
  memref.global constant @global_serial_const : memref<f32> = dense<1.000000e+00>
  func.func @test_multiple_constructs() {
    acc.parallel {
      %0 = memref.get_global @global_parallel : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.yield
    }
    acc.kernels {
      %0 = memref.get_global @global_kernels : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.terminator
    }
    acc.serial {
      %0 = memref.get_global @global_serial_const : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.yield
    }
    return
  }
}

// -----
module {
  memref.global @global_in_compute_region : memref<f32> = dense<0.000000e+00>
  func.func @test_scalar_in_compute_region() {
    acc.compute_region {
      %0 = memref.get_global @global_in_compute_region : memref<f32>
      %1 = memref.load %0[] : memref<f32>
      acc.yield
    } {origin = "acc.parallel"}
    return
  }
}

