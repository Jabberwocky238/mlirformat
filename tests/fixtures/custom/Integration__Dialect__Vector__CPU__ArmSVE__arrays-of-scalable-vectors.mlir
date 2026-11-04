module {
  func.func @read_and_print_2d_vector(%arg0: memref<3x?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<3x?xf32>
    %0 = vector.create_mask %c2, %dim : vector<3x[8]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<3x?xf32>, vector<3x[8]xf32>
    %2 = vector.extract %1[0] : vector<[8]xf32> from vector<3x[8]xf32>
    %3 = vector.extract %1[1] : vector<[8]xf32> from vector<3x[8]xf32>
    %4 = vector.extract %1[2] : vector<[8]xf32> from vector<3x[8]xf32>
    vector.print str "read_and_print_2d_vector()\0A"
    vector.print %2 : vector<[8]xf32>
    vector.print %3 : vector<[8]xf32>
    vector.print %4 : vector<[8]xf32>
    return
  }
  func.func @print_1x2xVSCALExf32(%arg0: vector<1x2x[4]xf32>) {
    %0 = vector.extract %arg0[0, 1] : vector<[4]xf32> from vector<1x2x[4]xf32>
    %1 = vector.extract %arg0[0, 1] : vector<[4]xf32> from vector<1x2x[4]xf32>
    vector.print %0 : vector<[4]xf32>
    vector.print %1 : vector<[4]xf32>
    return
  }
  func.func @add_arrays_of_scalable_vectors(%arg0: memref<1x2x?xf32>, %arg1: memref<1x2x?xf32>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c2_0 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c2 : memref<1x2x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<1x2x?xf32>
    %0 = vector.create_mask %c2, %c2_0, %dim : vector<1x2x[4]xi1>
    %1 = vector.create_mask %c2, %c2_0, %dim_1 : vector<1x2x[4]xi1>
    vector.print str "\0AVector A\0A"
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst, %0 {in_bounds = [true, true, true]} : memref<1x2x?xf32>, vector<1x2x[4]xf32>
    call @print_1x2xVSCALExf32(%2) : (vector<1x2x[4]xf32>) -> ()
    vector.print str "\0AVector B\0A"
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst, %1 {in_bounds = [true, true, true]} : memref<1x2x?xf32>, vector<1x2x[4]xf32>
    call @print_1x2xVSCALExf32(%3) : (vector<1x2x[4]xf32>) -> ()
    vector.print str "\0ASum\0A"
    %4 = arith.addf %2, %3 : vector<1x2x[4]xf32>
    call @print_1x2xVSCALExf32(%4) : (vector<1x2x[4]xf32>) -> ()
    return
  }
  func.func @entry() {
    %vscale = vector.vscale
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 8.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    %cst_1 = arith.constant 4.000000e+00 : f32
    %c8_vscale = arith.muli %vscale, %c8 : index
    %alloca = memref.alloca(%c8_vscale) : memref<3x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloca : memref<3x?xf32>)
    vector.print str "=> Print and read 2D arrays of scalable vectors:\0A"
    call @read_and_print_2d_vector(%alloca) : (memref<3x?xf32>) -> ()
    vector.print str "\0A====================\0A"
    %c4_vscale = arith.muli %vscale, %c4 : index
    %alloca_2 = memref.alloca(%c4_vscale) : memref<1x2x?xf32>
    %alloca_3 = memref.alloca(%c4_vscale) : memref<1x2x?xf32>
    linalg.fill ins(%cst_0 : f32) outs(%alloca_2 : memref<1x2x?xf32>)
    linalg.fill ins(%cst_1 : f32) outs(%alloca_3 : memref<1x2x?xf32>)
    vector.print str "=> Reading and adding two 3D arrays of scalable vectors:\0A"
    call @add_arrays_of_scalable_vectors(%alloca_2, %alloca_3) : (memref<1x2x?xf32>, memref<1x2x?xf32>) -> ()
    return
  }
}

