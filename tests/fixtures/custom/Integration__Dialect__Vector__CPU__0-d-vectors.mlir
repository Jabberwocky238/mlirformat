module {
  func.func @extract_element_0d(%arg0: vector<f32>) {
    %0 = vector.extract %arg0[] : f32 from vector<f32>
    vector.print %0 : f32
    return
  }
  func.func @insert_element_0d(%arg0: f32, %arg1: vector<f32>) -> vector<f32> {
    %0 = vector.insert %arg0, %arg1 [] : f32 into vector<f32>
    return %0 : vector<f32>
  }
  func.func @print_vector_0d(%arg0: vector<f32>) {
    vector.print %arg0 : vector<f32>
    return
  }
  func.func @broadcast_0d(%arg0: f32) {
    %0 = vector.broadcast %arg0 : f32 to vector<f32>
    vector.print %0 : vector<f32>
    %1 = vector.broadcast %0 : vector<f32> to vector<f32>
    vector.print %1 : vector<f32>
    %2 = vector.broadcast %0 : vector<f32> to vector<1xf32>
    vector.print %2 : vector<1xf32>
    %3 = vector.broadcast %0 : vector<f32> to vector<2xf32>
    vector.print %3 : vector<2xf32>
    %4 = vector.broadcast %0 : vector<f32> to vector<2x1xf32>
    vector.print %4 : vector<2x1xf32>
    %5 = vector.broadcast %0 : vector<f32> to vector<2x3xf32>
    vector.print %5 : vector<2x3xf32>
    return
  }
  func.func @bitcast_0d() {
    %c42_i32 = arith.constant 42 : i32
    %cst = arith.constant dense<0> : vector<i32>
    %0 = vector.insert %c42_i32, %cst [] : i32 into vector<i32>
    %1 = vector.bitcast %0 : vector<i32> to vector<f32>
    %2 = vector.extract %1[] : f32 from vector<f32>
    %3 = arith.bitcast %2 : f32 to i32
    vector.print %3 : i32
    return
  }
  func.func @constant_mask_0d() {
    %0 = vector.constant_mask [0] : vector<i1>
    vector.print %0 : vector<i1>
    %1 = vector.constant_mask [1] : vector<i1>
    vector.print %1 : vector<i1>
    return
  }
  func.func @arith_cmpi_0d(%arg0: vector<i32>, %arg1: vector<i32>) {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<i32>
    vector.print %0 : vector<i1>
    %1 = arith.cmpi ugt, %arg0, %arg1 : vector<i32>
    vector.print %1 : vector<i1>
    %2 = arith.cmpi eq, %arg0, %arg1 : vector<i32>
    vector.print %2 : vector<i1>
    return
  }
  func.func @create_mask_0d(%arg0: index, %arg1: index) {
    %0 = vector.create_mask %arg0 : vector<i1>
    vector.print %0 : vector<i1>
    %1 = vector.create_mask %arg1 : vector<i1>
    vector.print %1 : vector<i1>
    return
  }
  func.func @reduce_add(%arg0: vector<f32>) {
    %0 = vector.reduction <add>, %arg0 : vector<f32> into f32
    vector.print %0 : f32
    return
  }
  func.func @fma_0d(%arg0: vector<f32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<f32>
    vector.print %0 : vector<f32>
    return
  }
  func.func @transpose_0d(%arg0: vector<i32>) {
    %0 = vector.transpose %arg0, [] : vector<i32> to vector<i32>
    vector.print %0 : vector<i32>
    return
  }
  func.func @shuffle_0d(%arg0: vector<i32>, %arg1: vector<i32>) {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 0] : vector<i32>, vector<i32>
    vector.print %0 : vector<3xi32>
    return
  }
  func.func @entry() {
    %cst = arith.constant 4.200000e+01 : f32
    %cst_0 = arith.constant dense<0.000000e+00> : vector<f32>
    %0 = call @insert_element_0d(%cst, %cst_0) : (f32, vector<f32>) -> vector<f32>
    call @extract_element_0d(%0) : (vector<f32>) -> ()
    %cst_1 = arith.constant dense<4.200000e+01> : vector<f32>
    call @print_vector_0d(%cst_1) : (vector<f32>) -> ()
    %cst_2 = arith.constant 4.200000e+01 : f32
    call @broadcast_0d(%cst_2) : (f32) -> ()
    call @bitcast_0d() : () -> ()
    call @constant_mask_0d() : () -> ()
    %cst_3 = arith.constant dense<42> : vector<i32>
    %cst_4 = arith.constant dense<4242> : vector<i32>
    call @arith_cmpi_0d(%cst_3, %cst_4) : (vector<i32>, vector<i32>) -> ()
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    call @create_mask_0d(%c0, %c1) : (index, index) -> ()
    %cst_5 = arith.constant dense<5.000000e+00> : vector<f32>
    call @reduce_add(%cst_5) : (vector<f32>) -> ()
    %cst_6 = arith.constant dense<4.000000e+00> : vector<f32>
    call @fma_0d(%cst_6) : (vector<f32>) -> ()
    %cst_7 = arith.constant dense<42> : vector<i32>
    %cst_8 = arith.constant dense<43> : vector<i32>
    call @transpose_0d(%cst_7) : (vector<i32>) -> ()
    call @shuffle_0d(%cst_7, %cst_8) : (vector<i32>, vector<i32>) -> ()
    return
  }
}

