module {
  func.func @checkVScale() attributes {no_inline} {
    %vscale = vector.vscale
    vector.print str "vscale = "
    vector.print %vscale : index
    return
  }
  func.func @setAndCheckVL(%arg0: i32) {
    call @setArmVLBits(%arg0) : (i32) -> ()
    call @checkVScale() : () -> ()
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setAndCheckVL(%c128_i32) : (i32) -> ()
    %c256_i32 = arith.constant 256 : i32
    call @setAndCheckVL(%c256_i32) : (i32) -> ()
    %c512_i32 = arith.constant 512 : i32
    call @setAndCheckVL(%c512_i32) : (i32) -> ()
    %c1024_i32 = arith.constant 1024 : i32
    call @setAndCheckVL(%c1024_i32) : (i32) -> ()
    %c2048_i32 = arith.constant 2048 : i32
    call @setAndCheckVL(%c2048_i32) : (i32) -> ()
    return
  }
  func.func private @setArmVLBits(i32)
}

