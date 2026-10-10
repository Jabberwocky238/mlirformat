module {
  llvm.func @opaque_ptr_load(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.return %0 : i32
  }
  llvm.func @opaque_ptr_store(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.store %arg0, %arg1 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @opaque_ptr_ptr_store(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    llvm.store %arg0, %arg1 : !llvm.ptr, !llvm.ptr
    llvm.return
  }
  llvm.func @opaque_ptr_alloca(%arg0: i32) -> !llvm.ptr {
    %0 = llvm.alloca %arg0 x f32 : (i32) -> !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @opaque_ptr_gep(%arg0: !llvm.ptr, %arg1: i32) -> !llvm.ptr {
    %0 = llvm.getelementptr %arg0[%arg1] : (!llvm.ptr, i32) -> !llvm.ptr, f32
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @opaque_ptr_gep_struct(%arg0: !llvm.ptr, %arg1: i32) -> !llvm.ptr {
    %0 = llvm.getelementptr %arg0[%arg1, 0, 1] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<(struct<(f32, f64)>, struct<(i32, i64)>)>
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @opaque_ptr_matrix_load_store(%arg0: !llvm.ptr, %arg1: i64) -> vector<48xf32> {
    %0 = llvm.intr.matrix.column.major.load %arg0, <stride = %arg1> {columns = 16 : i32, isVolatile = false, rows = 3 : i32} : vector<48xf32> from !llvm.ptr stride i64
    llvm.intr.matrix.column.major.store %0, %arg0, <stride = %arg1> {columns = 16 : i32, isVolatile = false, rows = 3 : i32} : vector<48xf32> to !llvm.ptr stride i64
    llvm.return %0 : vector<48xf32>
  }
  llvm.func @opaque_ptr_masked_load(%arg0: !llvm.ptr, %arg1: vector<7xi1>) -> vector<7xf32> {
    %0 = llvm.intr.masked.load %arg0, %arg1 {alignment = 1 : i32} : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    llvm.return %0 : vector<7xf32>
  }
  llvm.func @opaque_ptr_gather(%arg0: vector<7x!llvm.ptr>, %arg1: vector<7xi1>) -> vector<7xf32> {
    %0 = llvm.intr.masked.gather %arg0, %arg1 {alignment = 1 : i32} : (vector<7x!llvm.ptr>, vector<7xi1>) -> vector<7xf32>
    llvm.return %0 : vector<7xf32>
  }
}

