module {
  func.func @emulate_cmpi_eq(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi eq, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_eq(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_eq(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_ne(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi ne, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_ne(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_ne(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_sge(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi sge, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_sge(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_sge(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_sgt(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi sgt, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_sgt(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_sgt(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_sle(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi sle, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_sle(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_sle(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_slt(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi slt, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_slt(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_slt(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_uge(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi uge, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_uge(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_uge(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_ugt(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi ugt, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_ugt(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_ugt(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_ule(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi ule, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_ule(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_ule(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @emulate_cmpi_ult(%arg0: i16, %arg1: i16) -> i1 {
    %0 = arith.cmpi ult, %arg0, %arg1 : i16
    return %0 : i1
  }
  func.func @check_cmpi_ult(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_cmpi_ult(%arg0, %arg1) : (i16, i16) -> i1
    vector.print %0 : i1
    return
  }
  func.func @entry() {
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %c7_i16 = arith.constant 7 : i16
    %c-1_i16 = arith.constant -1 : i16
    %c1337_i16 = arith.constant 1337 : i16
    %c4096_i16 = arith.constant 4096 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    call @check_cmpi_eq(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_eq(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_ne(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_sge(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_sgt(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_sle(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_slt(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_uge(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_ugt(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_ule(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_cmpi_ult(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    return
  }
}

