module {
  func.func @test_private_2d_memref() {
    %alloca = memref.alloca() {test.recipe_name = #acc.recipe_kind<private_recipe>} : memref<5x10xf32>
    return
  }
}

// -----
module {
  func.func @test_firstprivate_2d_memref() {
    %alloca = memref.alloca() {test.recipe_name = #acc.recipe_kind<firstprivate_recipe>} : memref<8x16xf64>
    return
  }
}

// -----
module {
  func.func @test_reduction_2d_memref() {
    %alloca = memref.alloca() {test.recipe_name = #acc.recipe_kind<reduction_recipe>} : memref<4x8xi32>
    return
  }
}

// -----
module {
  func.func @test_private_dynamic_memref(%arg0: memref<5x10xi32>) {
    %cast = memref.cast %arg0 {test.recipe_name = #acc.recipe_kind<private_recipe>} : memref<5x10xi32> to memref<?x10xi32>
    return
  }
}

// -----
module {
  func.func @test_private_scalar_memref() {
    %alloca = memref.alloca() {test.recipe_name = #acc.recipe_kind<private_recipe>} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_private_unranked_memref(%arg0: memref<10xi32>) {
    %cast = memref.cast %arg0 {test.recipe_name = #acc.recipe_kind<private_recipe>} : memref<10xi32> to memref<*xi32>
    return
  }
}

