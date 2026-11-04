#map = affine_map<(d0) -> (d0 floordiv 8)>
#map1 = affine_map<(d0) -> (d0 floordiv 16)>
module {
  func.func @test_subi_zero(%arg0: i32) -> i32 {
    %0 = arith.subi %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @test_subi_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = arith.subi %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @test_subi_zero_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %0 = arith.subi %arg0, %arg0 : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @dim(%arg0: tensor<8x4xf32>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<8x4xf32>
    return %dim : index
  }
  func.func @test_commutative(%arg0: i32) -> (i32, i32) {
    %c42_i32 = arith.constant 42 : i32
    %0 = arith.addi %c42_i32, %arg0 : i32
    %1 = arith.subi %c42_i32, %arg0 : i32
    return %0, %1 : i32, i32
  }
  func.func @trivial_dce(%arg0: tensor<8x4xf32>) {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<8x4xf32>
    return
  }
  func.func @load_dce(%arg0: index) {
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%c4) : memref<?xf32>
    %0 = memref.load %alloc[%arg0] : memref<?xf32>
    memref.dealloc %alloc : memref<?xf32>
    return
  }
  func.func @addi_zero(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.addi %c0_i32, %arg0 : i32
    return %0 : i32
  }
  func.func @addi_zero_index(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = arith.addi %c0, %arg0 : index
    return %0 : index
  }
  func.func @addi_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = arith.addi %cst, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @addi_zero_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<0> : tensor<4x5xi32>
    %0 = arith.addi %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @muli_zero(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.muli %c0_i32, %arg0 : i32
    return %0 : i32
  }
  func.func @muli_zero_index(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = arith.muli %c0, %arg0 : index
    return %0 : index
  }
  func.func @muli_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = arith.muli %cst, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @muli_zero_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<0> : tensor<4x5xi32>
    %0 = arith.muli %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @muli_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.muli %c1_i32, %arg0 : i32
    return %0 : i32
  }
  func.func @muli_one_index(%arg0: index) -> index {
    %c1 = arith.constant 1 : index
    %0 = arith.muli %c1, %arg0 : index
    return %0 : index
  }
  func.func @muli_one_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst = arith.constant dense<1> : vector<4xi32>
    %0 = arith.muli %cst, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @muli_one_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.muli %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @and_self(%arg0: i32) -> i32 {
    %0 = arith.andi %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @and_self_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = arith.andi %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @and_self_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %0 = arith.andi %arg0, %arg0 : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @and_zero(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.andi %arg0, %c0_i32 : i32
    return %0 : i32
  }
  func.func @and_zero_index(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = arith.andi %arg0, %c0 : index
    return %0 : index
  }
  func.func @and_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = arith.andi %arg0, %cst : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @and_zero_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<0> : tensor<4x5xi32>
    %0 = arith.andi %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @or_self(%arg0: i32) -> i32 {
    %0 = arith.ori %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @or_self_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = arith.ori %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @or_self_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %0 = arith.ori %arg0, %arg0 : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @or_zero(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.ori %arg0, %c0_i32 : i32
    return %0 : i32
  }
  func.func @or_zero_index(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = arith.ori %arg0, %c0 : index
    return %0 : index
  }
  func.func @or_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = arith.ori %arg0, %cst : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @or_zero_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<0> : tensor<4x5xi32>
    %0 = arith.ori %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @or_all_ones(%arg0: i1, %arg1: i4) -> (i1, i4) {
    %true = arith.constant true
    %c-1_i4 = arith.constant -1 : i4
    %0 = arith.ori %arg0, %true : i1
    %1 = arith.ori %arg1, %c-1_i4 : i4
    return %0, %1 : i1, i4
  }
  func.func @xor_self(%arg0: i32) -> i32 {
    %0 = arith.xori %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @xor_self_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = arith.xori %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @xor_self_tensor(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %0 = arith.xori %arg0, %arg0 : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @memref_cast_folding(%arg0: memref<4xf32>, %arg1: f32) -> (f32, f32) {
    %cast = memref.cast %arg0 : memref<4xf32> to memref<?xf32>
    %c0 = arith.constant 0 : index
    %dim = memref.dim %cast, %c0 : memref<?xf32>
    %0 = affine.load %cast[%dim - 1] : memref<?xf32>
    memref.store %arg1, %cast[%c0] : memref<?xf32>
    %1 = memref.load %cast[%c0] : memref<?xf32>
    memref.dealloc %cast : memref<?xf32>
    return %0, %1 : f32, f32
  }
  func.func @fold_memref_cast_in_memref_cast(%arg0: memref<42x42xf64>) {
    %cast = memref.cast %arg0 : memref<42x42xf64> to memref<?x42xf64>
    %cast_0 = memref.cast %cast : memref<?x42xf64> to memref<?x?xf64>
    "test.user"(%cast_0) : (memref<?x?xf64>) -> ()
    return
  }
  func.func @fold_memref_cast_chain(%arg0: memref<42x42xf64>) {
    %cast = memref.cast %arg0 : memref<42x42xf64> to memref<?x42xf64>
    %cast_0 = memref.cast %cast : memref<?x42xf64> to memref<42x42xf64>
    "test.user"(%cast_0) : (memref<42x42xf64>) -> ()
    return
  }
  func.func @dead_alloc_fold() {
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%c4) : memref<?xf32>
    return
  }
  func.func @dead_dealloc_fold() {
    %alloc = memref.alloc() : memref<4xf32>
    memref.dealloc %alloc : memref<4xf32>
    return
  }
  func.func @dead_dealloc_fold_multi_use(%arg0: i1) {
    %alloc = memref.alloc() : memref<4xf32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.dealloc %alloc : memref<4xf32>
    return
  ^bb2:  // pred: ^bb0
    memref.dealloc %alloc : memref<4xf32>
    return
  }
  func.func @write_only_alloc_fold(%arg0: f32) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc(%c4) : memref<?xf32>
    memref.store %arg0, %alloc[%c0] : memref<?xf32>
    memref.dealloc %alloc : memref<?xf32>
    return
  }
  func.func @write_only_alloca_fold(%arg0: f32) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %alloca = memref.alloca(%c4) : memref<?xf32>
    memref.store %arg0, %alloca[%c0] : memref<?xf32>
    return
  }
  func.func @dead_block_elim() {
    builtin.module {
      func.func @nested() {
        return
      ^bb1:  // no predecessors
        return
      }
    }
    return
  }
  func.func @dyn_shape_fold(%arg0: index, %arg1: index) -> (memref<4x?x8x?x?xf32>, memref<?x?xi32>, memref<?x?xf32>, memref<4x?x8x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c9 = arith.constant 9 : index
    %c1024 = arith.constant 1024 : index
    %c512 = arith.constant 512 : index
    %alloc = memref.alloc(%arg0, %c1024) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%c1024, %c512, %arg1) : memref<4x?x8x?x?xf32>
    %alloc_1 = memref.alloc(%c512, %c1024) : memref<?x?xi32>
    %alloc_2 = memref.alloc(%c9, %c9) : memref<?x?xf32>
    %alloca = memref.alloca(%c1024, %c512, %arg1) : memref<4x?x8x?x?xf32>
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to 10 {
        %0 = memref.load %alloc[%arg2, %arg3] : memref<?x?xf32>
        memref.store %0, %alloc_0[%c0, %c0, %arg2, %arg3, %c0] : memref<4x?x8x?x?xf32>
      }
    }
    return %alloc_0, %alloc_1, %alloc_2, %alloca : memref<4x?x8x?x?xf32>, memref<?x?xi32>, memref<?x?xf32>, memref<4x?x8x?x?xf32>
  }
  func.func @dim_op_fold(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xi8>, %arg4: index, %arg5: index, %arg6: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg1, %arg2) : memref<?x8x?xf32>
    %dim = memref.dim %alloc_0, %c2 : memref<?x8x?xf32>
    affine.for %arg7 = 0 to %dim {
      %alloc_6 = memref.alloc(%arg0) : memref<?xi8>
      %dim_7 = memref.dim %alloc_6, %c0 : memref<?xi8>
      affine.for %arg8 = 0 to %dim_7 {
        %dim_8 = memref.dim %alloc, %c0 : memref<?x?xf32>
        %view_9 = memref.view %alloc_6[%c0][%arg8, %dim_8] : memref<?xi8> to memref<?x?xf32>
        %subview = memref.subview %alloc[%c0, %c0] [%dim_8, %arg8] [%c1, %c1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %dim_10 = memref.dim %view_9, %c1 : memref<?x?xf32>
        %dim_11 = memref.dim %subview, %c0 : memref<?x?xf32, strided<[?, ?], offset: ?>>
        affine.for %arg9 = %dim_10 to %dim_11 {
          "foo"() : () -> ()
        }
        %subview_12 = memref.subview %alloc[0, 0] [17, %arg8] [1, 1] : memref<?x?xf32> to memref<17x?xf32, strided<[?, 1]>>
        %dim_13 = memref.dim %view_9, %c1 : memref<?x?xf32>
        %dim_14 = memref.dim %subview_12, %c1 : memref<17x?xf32, strided<[?, 1]>>
        scf.for %arg9 = %dim_13 to %dim_14 step %c1 {
          "foo"() : () -> ()
        }
      }
    }
    %view = memref.view %arg3[%c0][%arg4, %arg6] : memref<?xi8> to memref<?x?xf32>
    %view_1 = memref.view %arg3[%c0][%arg6, %arg5] : memref<?xi8> to memref<?x?xf32>
    %view_2 = memref.view %arg3[%c0][%arg4, %arg5] : memref<?xi8> to memref<?x?xf32>
    %dim_3 = memref.dim %view, %c0 : memref<?x?xf32>
    %dim_4 = memref.dim %view, %c1 : memref<?x?xf32>
    %dim_5 = memref.dim %view_2, %c1 : memref<?x?xf32>
    scf.for %arg7 = %c0 to %dim_3 step %c1 {
      scf.for %arg8 = %c0 to %dim_5 step %c1 {
        scf.for %arg9 = %c0 to %dim_4 step %c1 {
        }
      }
    }
    return
  }
  func.func @merge_constants() -> (index, index) {
    %c42 = arith.constant 42 : index
    %c42_0 = arith.constant 42 : index
    return %c42, %c42_0 : index, index
  }
  func.func @hoist_constant(%arg0: memref<8xi32>) {
    affine.for %arg1 = 0 to 8 {
      %c42_i32 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[%arg1] : memref<8xi32>
    }
    return
  }
  func.func @const_fold_propagate() -> memref<?x?xf32> {
    %c512 = arith.constant 512 : index
    %0 = affine.apply #map(%c512)
    %1 = affine.apply #map1(%c512)
    %alloc = memref.alloc(%0, %1) : memref<?x?xf32>
    return %alloc : memref<?x?xf32>
  }
  func.func @indirect_target() {
    return
  }
  func.func @indirect_call_folding() {
    %f = constant @indirect_target : () -> ()
    call_indirect %f() : () -> ()
    return
  }
  func.func @lowered_affine_mod() -> (index, index) {
    %c-43 = arith.constant -43 : index
    %c42 = arith.constant 42 : index
    %0 = arith.remsi %c-43, %c42 : index
    %c0 = arith.constant 0 : index
    %1 = arith.cmpi slt, %0, %c0 : index
    %2 = arith.addi %0, %c42 : index
    %3 = arith.select %1, %2, %0 : index
    %c43 = arith.constant 43 : index
    %c42_0 = arith.constant 42 : index
    %4 = arith.remsi %c43, %c42_0 : index
    %c0_1 = arith.constant 0 : index
    %5 = arith.cmpi slt, %4, %c0_1 : index
    %6 = arith.addi %4, %c42_0 : index
    %7 = arith.select %5, %6, %4 : index
    return %3, %7 : index, index
  }
  func.func @lowered_affine_floordiv() -> (index, index) {
    %c-43 = arith.constant -43 : index
    %c42 = arith.constant 42 : index
    %c0 = arith.constant 0 : index
    %c-1 = arith.constant -1 : index
    %0 = arith.cmpi slt, %c-43, %c0 : index
    %1 = arith.subi %c-1, %c-43 : index
    %2 = arith.select %0, %1, %c-43 : index
    %3 = arith.divsi %2, %c42 : index
    %4 = arith.subi %c-1, %3 : index
    %5 = arith.select %0, %4, %3 : index
    %c43 = arith.constant 43 : index
    %c42_0 = arith.constant 42 : index
    %c0_1 = arith.constant 0 : index
    %c-1_2 = arith.constant -1 : index
    %6 = arith.cmpi slt, %c43, %c0_1 : index
    %7 = arith.subi %c-1_2, %c43 : index
    %8 = arith.select %6, %7, %c43 : index
    %9 = arith.divsi %8, %c42_0 : index
    %10 = arith.subi %c-1_2, %9 : index
    %11 = arith.select %6, %10, %9 : index
    return %5, %11 : index, index
  }
  func.func @lowered_affine_ceildiv() -> (index, index) {
    %c-43 = arith.constant -43 : index
    %c42 = arith.constant 42 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.cmpi sle, %c-43, %c0 : index
    %1 = arith.subi %c0, %c-43 : index
    %2 = arith.subi %c-43, %c1 : index
    %3 = arith.select %0, %1, %2 : index
    %4 = arith.divsi %3, %c42 : index
    %5 = arith.subi %c0, %4 : index
    %6 = arith.addi %4, %c1 : index
    %7 = arith.select %0, %5, %6 : index
    %c43 = arith.constant 43 : index
    %c42_0 = arith.constant 42 : index
    %c0_1 = arith.constant 0 : index
    %c1_2 = arith.constant 1 : index
    %8 = arith.cmpi sle, %c43, %c0_1 : index
    %9 = arith.subi %c0_1, %c43 : index
    %10 = arith.subi %c43, %c1_2 : index
    %11 = arith.select %8, %9, %10 : index
    %12 = arith.divsi %11, %c42_0 : index
    %13 = arith.subi %c0_1, %12 : index
    %14 = arith.addi %12, %c1_2 : index
    %15 = arith.select %8, %13, %14 : index
    return %7, %15 : index, index
  }
  func.func @cast_values(%arg0: memref<?xi32>) -> memref<2xi32> {
    %cast = memref.cast %arg0 : memref<?xi32> to memref<?xi32>
    %cast_0 = memref.cast %cast : memref<?xi32> to memref<2xi32>
    %cast_1 = memref.cast %cast_0 : memref<2xi32> to memref<2xi32>
    return %cast_1 : memref<2xi32>
  }
}

// -----
module {
  func.func @view(%arg0: index) -> (f32, f32, f32, f32) {
    %alloc = memref.alloc() : memref<2048xi8>
    %c0 = arith.constant 0 : index
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    %c15 = arith.constant 15 : index
    %view = memref.view %alloc[%c15][%c7, %c11] : memref<2048xi8> to memref<?x?xf32>
    %0 = memref.load %view[%c0, %c0] : memref<?x?xf32>
    %view_0 = memref.view %alloc[%c15][%arg0, %arg0, %c7] : memref<2048xi8> to memref<?x?x?xf32>
    %1 = memref.load %view_0[%c0, %c0, %c0] : memref<?x?x?xf32>
    %view_1 = memref.view %alloc[%c15][%c7] : memref<2048xi8> to memref<?x4xf32>
    %2 = memref.load %view_1[%c0, %c0] : memref<?x4xf32>
    %cast = memref.cast %alloc : memref<2048xi8> to memref<?xi8>
    %view_2 = memref.view %cast[%c15][%c15, %c7] : memref<?xi8> to memref<?x?xf32>
    %3 = memref.load %view_2[%c0, %c0] : memref<?x?xf32>
    return %0, %1, %2, %3 : f32, f32, f32, f32
  }
}

// -----
#set = affine_set<(d0) : (d0 - 2 >= 0)>
module {
  func.func @subview(%arg0: index, %arg1: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    %c15 = arith.constant 15 : index
    %alloc = memref.alloc() : memref<128x96x64xf32, strided<[6144, 64, 1]>>
    %subview = memref.subview %alloc[%c0, %c0, %c0] [%c7, %c11, %c2] [%c1, %c1, %c1] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %0 = memref.load %subview[%c0, %c0, %c0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_0 = memref.subview %alloc[%c0, %arg0, %c0] [%c7, %c11, %c15] [%c1, %c1, %c1] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_0[%c0, %c0, %c0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %alloc_1 = memref.alloc(%arg0) : memref<?x16x4xf32, strided<[64, 4, 1]>>
    %subview_2 = memref.subview %alloc_1[%c0, %c0, %c0] [%c7, %c11, %c2] [%c1, %c1, %c1] : memref<?x16x4xf32, strided<[64, 4, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_2[%c0, %c0, %c0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_3 = memref.subview %alloc[%c1, %c2, %c7] [%c7, %c11, %c2] [%c1, %c1, %c1] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_3[%c0, %c0, %c0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_4 = memref.subview %alloc[%c0, %c0, %c0] [%c7, %c11, %c2] [%c2, %c7, %c11] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_4[%c0, %c0, %c0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_5 = memref.subview %alloc[%arg0, %arg0, %arg0] [%c7, %c11, %c2] [%arg1, %arg1, %arg1] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_5[%arg1, %arg1, %arg1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_6 = memref.subview %alloc[%arg0, %arg0, %arg0] [%arg1, %arg1, %arg1] [%c2, %c7, %c11] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_6[%arg0, %arg0, %arg0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_7 = memref.subview %alloc[%c1, %c2, %c7] [%arg1, %arg1, %arg1] [%arg0, %arg0, %arg0] : memref<128x96x64xf32, strided<[6144, 64, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_7[%arg1, %arg1, %arg1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %alloc_8 = memref.alloc(%arg0, %arg0, %arg1) : memref<?x?x?xf32>
    %subview_9 = memref.subview %alloc_8[%arg0, %arg0, %arg0] [%c7, %c11, %c2] [%arg1, %arg1, %arg1] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_9[%arg1, %arg1, %arg1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_10 = memref.subview %alloc_8[%arg0, %arg0, %arg0] [%arg1, %arg1, %arg1] [%c2, %c2, %c2] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_10[%arg0, %arg0, %arg0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_11 = memref.subview %alloc_8[%c1, %c1, %c1] [%arg0, %arg0, %arg0] [%arg1, %arg1, %arg1] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    memref.store %0, %subview_11[%arg0, %arg0, %arg0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %alloc_12 = memref.alloc() : memref<128x64xf32>
    %c4 = arith.constant 4 : index
    %subview_13 = memref.subview %alloc_12[%arg1, %arg1] [%c2, %c4] [1, 1] : memref<128x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    memref.store %0, %subview_13[%arg1, %arg1] : memref<?x?xf32, strided<[64, 1], offset: ?>>
    %subview_14 = memref.subview %alloc_12[%c2, %c4] [12, 4] [1, 1] : memref<128x64xf32> to memref<12x4xf32, strided<[64, 1], offset: ?>>
    memref.store %0, %subview_14[%arg1, %arg1] : memref<12x4xf32, strided<[64, 1], offset: ?>>
    %dim = memref.dim %subview_2, %c0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %dim_15 = memref.dim %subview_2, %c1 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    return %dim, %dim_15 : index, index
  }
  func.func @index_cast(%arg0: i16) -> i16 {
    %0 = arith.index_cast %arg0 : i16 to index
    %1 = arith.index_cast %0 : index to i16
    return %1 : i16
  }
  func.func @index_cast_fold() -> (i16, index) {
    %c4 = arith.constant 4 : index
    %0 = arith.index_cast %c4 : index to i16
    %c4_i16 = arith.constant 4 : i16
    %1 = arith.index_cast %c4_i16 : i16 to index
    return %0, %1 : i16, index
  }
  func.func @remove_dead_else(%arg0: memref<100xi32>) {
    affine.for %arg1 = 0 to 100 {
      %0 = affine.load %arg0[%arg1] : memref<100xi32>
      affine.if #set(%arg1) {
        affine.for %arg2 = 0 to 100 {
          %2 = affine.load %arg0[%arg2] : memref<100xi32>
          "prevent.dce"(%2) : (i32) -> ()
        }
      } else {
      }
      %1 = affine.load %arg0[%arg1] : memref<100xi32>
    }
    return
  }
}

// -----
module {
  func.func @divi_signed_by_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.divsi %arg0, %c1_i32 : i32
    return %0 : i32
  }
  func.func @divi_unsigned_by_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.divui %arg0, %c1_i32 : i32
    return %0 : i32
  }
  func.func @tensor_divi_signed_by_one(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.divsi %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @tensor_divi_unsigned_by_one(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.divui %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
}

// -----
module {
  func.func @arith.floordivsi_by_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.floordivsi %arg0, %c1_i32 : i32
    return %0 : i32
  }
  func.func @tensor_arith.floordivsi_by_one(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.floordivsi %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
  func.func @arith.floordivsi_by_one_overflow() -> i64 {
    %c-1_i64 = arith.constant -1 : i64
    %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
    %0 = arith.floordivsi %c-9223372036854775808_i64, %c-1_i64 : i64
    return %0 : i64
  }
}

// -----
module {
  func.func @arith.ceildivsi_by_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.ceildivsi %arg0, %c1_i32 : i32
    return %0 : i32
  }
  func.func @tensor_arith.ceildivsi_by_one(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.ceildivsi %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
}

// -----
module {
  func.func @arith.ceildivui_by_one(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.ceildivui %arg0, %c1_i32 : i32
    return %0 : i32
  }
  func.func @tensor_arith.ceildivui_by_one(%arg0: tensor<4x5xi32>) -> tensor<4x5xi32> {
    %cst = arith.constant dense<1> : tensor<4x5xi32>
    %0 = arith.ceildivui %arg0, %cst : tensor<4x5xi32>
    return %0 : tensor<4x5xi32>
  }
}

// -----
module {
  func.func @memref_cast_folding_subview(%arg0: memref<4x5xf32>, %arg1: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
    %cast = memref.cast %arg0 : memref<4x5xf32> to memref<?x?xf32>
    %subview = memref.subview %cast[%arg1, %arg1] [%arg1, %arg1] [%arg1, %arg1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @memref_cast_folding_subview_static(%arg0: memref<16x16xf32>, %arg1: index, %arg2: index) -> memref<3x4xf32, strided<[?, 1]>> {
    %cast = memref.cast %arg0 : memref<16x16xf32> to memref<?x?xf32>
    %subview = memref.subview %cast[0, 0] [3, 4] [1, 1] : memref<?x?xf32> to memref<3x4xf32, strided<[?, 1]>>
    return %subview : memref<3x4xf32, strided<[?, 1]>>
  }
}

// -----
module {
  func.func @slice(%arg0: tensor<8x16x4xf32>, %arg1: index, %arg2: index) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %c0, %c0] [%c7, %c11, %c2] [%c1, %c1, %c1] : tensor<8x16x4xf32> to tensor<?x?x?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[%c0, %c0, %c0] [%c2, %arg1, %c2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
    return %extracted_slice_0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @fold_trunci(%arg0: i1) -> i1 {
    %0 = arith.extui %arg0 : i1 to i8
    %1 = arith.trunci %0 : i8 to i1
    return %1 : i1
  }
}

// -----
module {
  func.func @fold_trunci_vector(%arg0: vector<4xi1>) -> vector<4xi1> {
    %0 = arith.extui %arg0 : vector<4xi1> to vector<4xi8>
    %1 = arith.trunci %0 : vector<4xi8> to vector<4xi1>
    return %1 : vector<4xi1>
  }
}

// -----
module {
  func.func @fold_trunci(%arg0: i1) -> i2 {
    %0 = arith.extui %arg0 : i1 to i8
    %1 = arith.trunci %0 : i8 to i2
    return %1 : i2
  }
}

// -----
module {
  func.func @fold_trunci_vector(%arg0: vector<4xi1>) -> vector<4xi2> {
    %0 = arith.extui %arg0 : vector<4xi1> to vector<4xi8>
    %1 = arith.trunci %0 : vector<4xi8> to vector<4xi2>
    return %1 : vector<4xi2>
  }
}

// -----
module {
  func.func @fold_trunci_sexti(%arg0: i1) -> i1 {
    %0 = arith.extsi %arg0 : i1 to i8
    %1 = arith.trunci %0 : i8 to i1
    return %1 : i1
  }
  func.func @simple_clone_elimination() -> memref<5xf32> {
    %alloc = memref.alloc() : memref<5xf32>
    %0 = bufferization.clone %alloc : memref<5xf32> to memref<5xf32>
    memref.dealloc %0 : memref<5xf32>
    return %alloc : memref<5xf32>
  }
}

// -----
module {
  func.func @clone_loop_alloc(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    memref.dealloc %alloc : memref<2xf32>
    %0 = bufferization.clone %arg3 : memref<2xf32> to memref<2xf32>
    %1 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %0) -> (memref<2xf32>) {
      %2 = arith.cmpi eq, %arg5, %arg1 : index
      memref.dealloc %arg6 : memref<2xf32>
      %alloc_0 = memref.alloc() : memref<2xf32>
      %3 = bufferization.clone %alloc_0 : memref<2xf32> to memref<2xf32>
      memref.dealloc %alloc_0 : memref<2xf32>
      %4 = bufferization.clone %3 : memref<2xf32> to memref<2xf32>
      memref.dealloc %3 : memref<2xf32>
      scf.yield %4 : memref<2xf32>
    }
    memref.copy %1, %arg4 : memref<2xf32> to memref<2xf32>
    memref.dealloc %1 : memref<2xf32>
    return
  }
}

// -----
module {
  func.func @clone_nested_region(%arg0: index, %arg1: index, %arg2: index) -> memref<?x?xf32> {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    %1 = arith.cmpi eq, %arg0, %arg1 : index
    %alloc = memref.alloc(%arg0, %arg0) : memref<?x?xf32>
    %2 = scf.if %1 -> (memref<?x?xf32>) {
      %3 = scf.if %0 -> (memref<?x?xf32>) {
        %5 = bufferization.clone %alloc : memref<?x?xf32> to memref<?x?xf32>
        scf.yield %5 : memref<?x?xf32>
      } else {
        %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
        %5 = bufferization.clone %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
        memref.dealloc %alloc_0 : memref<?x?xf32>
        scf.yield %5 : memref<?x?xf32>
      }
      %4 = bufferization.clone %3 : memref<?x?xf32> to memref<?x?xf32>
      memref.dealloc %3 : memref<?x?xf32>
      scf.yield %4 : memref<?x?xf32>
    } else {
      %alloc_0 = memref.alloc(%arg1, %arg1) : memref<?x?xf32>
      %3 = bufferization.clone %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
      memref.dealloc %alloc_0 : memref<?x?xf32>
      scf.yield %3 : memref<?x?xf32>
    }
    memref.dealloc %alloc : memref<?x?xf32>
    return %2 : memref<?x?xf32>
  }
}

// -----
module {
  func.func @test_materialize_failure() -> i64 {
    %idx1234 = index.constant 1234
    %0 = index.castu %idx1234 : index to i64
    return %0 : i64
  }
}

