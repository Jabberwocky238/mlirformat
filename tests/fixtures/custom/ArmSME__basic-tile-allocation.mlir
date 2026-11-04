module {
}

// -----
module {
  func.func @mixed_tiles() {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %2 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %3 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%3) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @za_b() {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = arm_sme.get_tile : vector<[16]x[16]xi8>
    "test.some_use"(%0) : (vector<[16]x[16]xi8>) -> ()
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @za_b_overlapping_za_q() {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[16]x[16]xi8>) -> ()
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @za_h() {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %2 = arm_sme.get_tile : vector<[8]x[8]xi16>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%2) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @za_h_overlapping_za_s() {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %2 = arm_sme.get_tile : vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @za_h_overlapping_za_d() {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %2 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %3 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %4 = arm_sme.get_tile : vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%3) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%4) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @za_h_overlapping_za_q() {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %2 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %3 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %4 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %5 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %6 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %7 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %8 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %9 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%3) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%4) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%5) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%6) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%7) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%8) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%9) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @za_s() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %2 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %3 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %4 = arm_sme.get_tile : vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%4) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @za_s_overlapping_za_d() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %2 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %3 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %4 = arm_sme.get_tile : vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%3) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%4) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @za_s_overlapping_za_q() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %2 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %3 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %4 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %5 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %6 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %7 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %8 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %9 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %10 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %11 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %12 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %13 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%3) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%4) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%5) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%6) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%7) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%8) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%9) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%10) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%11) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%12) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%13) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @za_d() {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %2 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %3 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %4 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %5 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %6 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %7 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %8 = arm_sme.get_tile : vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%1) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%3) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%4) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%5) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%6) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%7) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%8) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @za_d_overlapping_za_q() {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %2 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %3 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %4 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %5 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %6 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %7 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %8 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %9 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %10 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %11 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %12 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %13 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %14 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %15 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%3) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%4) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%5) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%6) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%7) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%8) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%9) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%10) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%11) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%12) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%13) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%14) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%15) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @za_q() {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %2 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %3 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %4 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %5 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %6 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %7 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %8 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %9 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %10 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %11 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %12 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %13 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %14 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %15 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %16 = arm_sme.get_tile : vector<[1]x[1]xi128>
    "test.some_use"(%0) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%3) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%4) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%5) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%6) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%7) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%8) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%9) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%10) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%11) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%12) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%13) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%14) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%15) : (vector<[1]x[1]xi128>) -> ()
    "test.some_use"(%16) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

