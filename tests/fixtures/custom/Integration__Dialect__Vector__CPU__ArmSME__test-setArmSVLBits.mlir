module {
  func.func @checkSVL() {
    %0 = arm_sme.streaming_vl <byte>
    %1 = arm_sme.streaming_vl <half>
    %2 = arm_sme.streaming_vl <word>
    %3 = arm_sme.streaming_vl <double>
    vector.print str "SVL.b\0A"
    vector.print %0 : index
    vector.print str "SVL.h\0A"
    vector.print %1 : index
    vector.print str "SVL.w\0A"
    vector.print %2 : index
    vector.print str "SVL.d\0A"
    vector.print %3 : index
    return
  }
  func.func @setAndCheckSVL(%arg0: i32) {
    call @setArmSVLBits(%arg0) : (i32) -> ()
    call @checkSVL() : () -> ()
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setAndCheckSVL(%c128_i32) : (i32) -> ()
    %c256_i32 = arith.constant 256 : i32
    call @setAndCheckSVL(%c256_i32) : (i32) -> ()
    %c512_i32 = arith.constant 512 : i32
    call @setAndCheckSVL(%c512_i32) : (i32) -> ()
    return
  }
  func.func private @setArmSVLBits(i32)
}

