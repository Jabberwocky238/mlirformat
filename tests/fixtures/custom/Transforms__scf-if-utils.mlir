module {
}

// -----
module {
  func.func @outline_if_else(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8) {
    %0 = scf.if %arg0 -> (i8) {
      %1 = "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> i8
      scf.yield %1 : i8
    } else {
      scf.yield %arg3 : i8
    }
    return
  }
}

// -----
module {
  func.func @outline_if(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8) {
    scf.if %arg0 {
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func @outline_empty_if_else(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8) {
    scf.if %arg0 {
    } else {
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
    }
    return
  }
}

// -----
module {
  llvm.func @llvm_func(%arg0: i1, %arg1: i32) {
    scf.if %arg0 {
    } else {
      "some_op"(%arg0, %arg1) : (i1, i32) -> ()
    }
    llvm.return
  }
}

