module {
  func.func @unsupported_trivial_forwarding(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0:8 = vector.to_elements %arg0 : vector<8xf32>
    %1 = vector.from_elements %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7 : vector<8xf32>
    return %1 : vector<8xf32>
  }
}

// -----
module {
  func.func @unsupported_multi_dim_vector_inputs(%arg0: vector<2x4xf32>, %arg1: vector<2x4xf32>) -> vector<4xf32> {
    %0:8 = vector.to_elements %arg0 : vector<2x4xf32>
    %1:8 = vector.to_elements %arg1 : vector<2x4xf32>
    %2 = vector.from_elements %0#0, %0#7, %1#0, %1#7 : vector<4xf32>
    return %2 : vector<4xf32>
  }
}

// -----
module {
  func.func @unsupported_multi_dim_vector_output(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> vector<2x2xf32> {
    %0:8 = vector.to_elements %arg0 : vector<8xf32>
    %1:8 = vector.to_elements %arg1 : vector<8xf32>
    %2 = vector.from_elements %0#0, %0#7, %1#0, %1#7 : vector<2x2xf32>
    return %2 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_single_input_shuffle(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0:8 = vector.to_elements %arg0 : vector<8xf32>
    %1 = vector.from_elements %0#7, %0#0, %0#6, %0#1, %0#5, %0#2, %0#4, %0#3 : vector<8xf32>
    return %1 : vector<8xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_single_shuffle(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0:8 = vector.to_elements %arg0 : vector<8xf32>
    %1:8 = vector.to_elements %arg1 : vector<8xf32>
    %2 = vector.from_elements %0#7, %1#0, %0#6, %1#1, %0#5, %1#2, %0#4, %1#3 : vector<8xf32>
    return %2 : vector<8xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_concat_4x8_to_32(%arg0: vector<8xf32>, %arg1: vector<8xf32>, %arg2: vector<8xf32>, %arg3: vector<8xf32>) -> vector<32xf32> {
    %0:8 = vector.to_elements %arg0 : vector<8xf32>
    %1:8 = vector.to_elements %arg1 : vector<8xf32>
    %2:8 = vector.to_elements %arg2 : vector<8xf32>
    %3:8 = vector.to_elements %arg3 : vector<8xf32>
    %4 = vector.from_elements %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7, %1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %3#0, %3#1, %3#2, %3#3, %3#4, %3#5, %3#6, %3#7 : vector<32xf32>
    return %4 : vector<32xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_concat_3x4_to_12(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> vector<12xf32> {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    %1:4 = vector.to_elements %arg1 : vector<4xf32>
    %2:4 = vector.to_elements %arg2 : vector<4xf32>
    %3 = vector.from_elements %0#0, %0#1, %0#2, %0#3, %1#0, %1#1, %1#2, %1#3, %2#0, %2#1, %2#2, %2#3 : vector<12xf32>
    return %3 : vector<12xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_concat_64x4_256(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: vector<4xf32>, %arg4: vector<4xf32>, %arg5: vector<4xf32>, %arg6: vector<4xf32>, %arg7: vector<4xf32>, %arg8: vector<4xf32>, %arg9: vector<4xf32>, %arg10: vector<4xf32>, %arg11: vector<4xf32>, %arg12: vector<4xf32>, %arg13: vector<4xf32>, %arg14: vector<4xf32>, %arg15: vector<4xf32>, %arg16: vector<4xf32>, %arg17: vector<4xf32>, %arg18: vector<4xf32>, %arg19: vector<4xf32>, %arg20: vector<4xf32>, %arg21: vector<4xf32>, %arg22: vector<4xf32>, %arg23: vector<4xf32>, %arg24: vector<4xf32>, %arg25: vector<4xf32>, %arg26: vector<4xf32>, %arg27: vector<4xf32>, %arg28: vector<4xf32>, %arg29: vector<4xf32>, %arg30: vector<4xf32>, %arg31: vector<4xf32>, %arg32: vector<4xf32>, %arg33: vector<4xf32>, %arg34: vector<4xf32>, %arg35: vector<4xf32>, %arg36: vector<4xf32>, %arg37: vector<4xf32>, %arg38: vector<4xf32>, %arg39: vector<4xf32>, %arg40: vector<4xf32>, %arg41: vector<4xf32>, %arg42: vector<4xf32>, %arg43: vector<4xf32>, %arg44: vector<4xf32>, %arg45: vector<4xf32>, %arg46: vector<4xf32>, %arg47: vector<4xf32>, %arg48: vector<4xf32>, %arg49: vector<4xf32>, %arg50: vector<4xf32>, %arg51: vector<4xf32>, %arg52: vector<4xf32>, %arg53: vector<4xf32>, %arg54: vector<4xf32>, %arg55: vector<4xf32>, %arg56: vector<4xf32>, %arg57: vector<4xf32>, %arg58: vector<4xf32>, %arg59: vector<4xf32>, %arg60: vector<4xf32>, %arg61: vector<4xf32>, %arg62: vector<4xf32>, %arg63: vector<4xf32>) -> vector<256xf32> {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    %1:4 = vector.to_elements %arg1 : vector<4xf32>
    %2:4 = vector.to_elements %arg2 : vector<4xf32>
    %3:4 = vector.to_elements %arg3 : vector<4xf32>
    %4:4 = vector.to_elements %arg4 : vector<4xf32>
    %5:4 = vector.to_elements %arg5 : vector<4xf32>
    %6:4 = vector.to_elements %arg6 : vector<4xf32>
    %7:4 = vector.to_elements %arg7 : vector<4xf32>
    %8:4 = vector.to_elements %arg8 : vector<4xf32>
    %9:4 = vector.to_elements %arg9 : vector<4xf32>
    %10:4 = vector.to_elements %arg10 : vector<4xf32>
    %11:4 = vector.to_elements %arg11 : vector<4xf32>
    %12:4 = vector.to_elements %arg12 : vector<4xf32>
    %13:4 = vector.to_elements %arg13 : vector<4xf32>
    %14:4 = vector.to_elements %arg14 : vector<4xf32>
    %15:4 = vector.to_elements %arg15 : vector<4xf32>
    %16:4 = vector.to_elements %arg16 : vector<4xf32>
    %17:4 = vector.to_elements %arg17 : vector<4xf32>
    %18:4 = vector.to_elements %arg18 : vector<4xf32>
    %19:4 = vector.to_elements %arg19 : vector<4xf32>
    %20:4 = vector.to_elements %arg20 : vector<4xf32>
    %21:4 = vector.to_elements %arg21 : vector<4xf32>
    %22:4 = vector.to_elements %arg22 : vector<4xf32>
    %23:4 = vector.to_elements %arg23 : vector<4xf32>
    %24:4 = vector.to_elements %arg24 : vector<4xf32>
    %25:4 = vector.to_elements %arg25 : vector<4xf32>
    %26:4 = vector.to_elements %arg26 : vector<4xf32>
    %27:4 = vector.to_elements %arg27 : vector<4xf32>
    %28:4 = vector.to_elements %arg28 : vector<4xf32>
    %29:4 = vector.to_elements %arg29 : vector<4xf32>
    %30:4 = vector.to_elements %arg30 : vector<4xf32>
    %31:4 = vector.to_elements %arg31 : vector<4xf32>
    %32:4 = vector.to_elements %arg32 : vector<4xf32>
    %33:4 = vector.to_elements %arg33 : vector<4xf32>
    %34:4 = vector.to_elements %arg34 : vector<4xf32>
    %35:4 = vector.to_elements %arg35 : vector<4xf32>
    %36:4 = vector.to_elements %arg36 : vector<4xf32>
    %37:4 = vector.to_elements %arg37 : vector<4xf32>
    %38:4 = vector.to_elements %arg38 : vector<4xf32>
    %39:4 = vector.to_elements %arg39 : vector<4xf32>
    %40:4 = vector.to_elements %arg40 : vector<4xf32>
    %41:4 = vector.to_elements %arg41 : vector<4xf32>
    %42:4 = vector.to_elements %arg42 : vector<4xf32>
    %43:4 = vector.to_elements %arg43 : vector<4xf32>
    %44:4 = vector.to_elements %arg44 : vector<4xf32>
    %45:4 = vector.to_elements %arg45 : vector<4xf32>
    %46:4 = vector.to_elements %arg46 : vector<4xf32>
    %47:4 = vector.to_elements %arg47 : vector<4xf32>
    %48:4 = vector.to_elements %arg48 : vector<4xf32>
    %49:4 = vector.to_elements %arg49 : vector<4xf32>
    %50:4 = vector.to_elements %arg50 : vector<4xf32>
    %51:4 = vector.to_elements %arg51 : vector<4xf32>
    %52:4 = vector.to_elements %arg52 : vector<4xf32>
    %53:4 = vector.to_elements %arg53 : vector<4xf32>
    %54:4 = vector.to_elements %arg54 : vector<4xf32>
    %55:4 = vector.to_elements %arg55 : vector<4xf32>
    %56:4 = vector.to_elements %arg56 : vector<4xf32>
    %57:4 = vector.to_elements %arg57 : vector<4xf32>
    %58:4 = vector.to_elements %arg58 : vector<4xf32>
    %59:4 = vector.to_elements %arg59 : vector<4xf32>
    %60:4 = vector.to_elements %arg60 : vector<4xf32>
    %61:4 = vector.to_elements %arg61 : vector<4xf32>
    %62:4 = vector.to_elements %arg62 : vector<4xf32>
    %63:4 = vector.to_elements %arg63 : vector<4xf32>
    %64 = vector.from_elements %0#0, %0#1, %0#2, %0#3, %1#0, %1#1, %1#2, %1#3, %2#0, %2#1, %2#2, %2#3, %3#0, %3#1, %3#2, %3#3, %4#0, %4#1, %4#2, %4#3, %5#0, %5#1, %5#2, %5#3, %6#0, %6#1, %6#2, %6#3, %7#0, %7#1, %7#2, %7#3, %8#0, %8#1, %8#2, %8#3, %9#0, %9#1, %9#2, %9#3, %10#0, %10#1, %10#2, %10#3, %11#0, %11#1, %11#2, %11#3, %12#0, %12#1, %12#2, %12#3, %13#0, %13#1, %13#2, %13#3, %14#0, %14#1, %14#2, %14#3, %15#0, %15#1, %15#2, %15#3, %16#0, %16#1, %16#2, %16#3, %17#0, %17#1, %17#2, %17#3, %18#0, %18#1, %18#2, %18#3, %19#0, %19#1, %19#2, %19#3, %20#0, %20#1, %20#2, %20#3, %21#0, %21#1, %21#2, %21#3, %22#0, %22#1, %22#2, %22#3, %23#0, %23#1, %23#2, %23#3, %24#0, %24#1, %24#2, %24#3, %25#0, %25#1, %25#2, %25#3, %26#0, %26#1, %26#2, %26#3, %27#0, %27#1, %27#2, %27#3, %28#0, %28#1, %28#2, %28#3, %29#0, %29#1, %29#2, %29#3, %30#0, %30#1, %30#2, %30#3, %31#0, %31#1, %31#2, %31#3, %32#0, %32#1, %32#2, %32#3, %33#0, %33#1, %33#2, %33#3, %34#0, %34#1, %34#2, %34#3, %35#0, %35#1, %35#2, %35#3, %36#0, %36#1, %36#2, %36#3, %37#0, %37#1, %37#2, %37#3, %38#0, %38#1, %38#2, %38#3, %39#0, %39#1, %39#2, %39#3, %40#0, %40#1, %40#2, %40#3, %41#0, %41#1, %41#2, %41#3, %42#0, %42#1, %42#2, %42#3, %43#0, %43#1, %43#2, %43#3, %44#0, %44#1, %44#2, %44#3, %45#0, %45#1, %45#2, %45#3, %46#0, %46#1, %46#2, %46#3, %47#0, %47#1, %47#2, %47#3, %48#0, %48#1, %48#2, %48#3, %49#0, %49#1, %49#2, %49#3, %50#0, %50#1, %50#2, %50#3, %51#0, %51#1, %51#2, %51#3, %52#0, %52#1, %52#2, %52#3, %53#0, %53#1, %53#2, %53#3, %54#0, %54#1, %54#2, %54#3, %55#0, %55#1, %55#2, %55#3, %56#0, %56#1, %56#2, %56#3, %57#0, %57#1, %57#2, %57#3, %58#0, %58#1, %58#2, %58#3, %59#0, %59#1, %59#2, %59#3, %60#0, %60#1, %60#2, %60#3, %61#0, %61#1, %61#2, %61#3, %62#0, %62#1, %62#2, %62#3, %63#0, %63#1, %63#2, %63#3 : vector<256xf32>
    return %64 : vector<256xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_arbitrary_4x4_to_16(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: vector<4xf32>) -> vector<16xf32> {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    %1:4 = vector.to_elements %arg1 : vector<4xf32>
    %2:4 = vector.to_elements %arg2 : vector<4xf32>
    %3:4 = vector.to_elements %arg3 : vector<4xf32>
    %4 = vector.from_elements %3#3, %0#0, %2#2, %1#1, %3#0, %2#1, %0#3, %1#2, %0#1, %3#2, %1#0, %2#3, %1#3, %0#2, %3#1, %2#0 : vector<16xf32>
    return %4 : vector<16xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_arbitrary_3x4_to_12(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> vector<12xf32> {
    %0:4 = vector.to_elements %arg0 : vector<4xf32>
    %1:4 = vector.to_elements %arg1 : vector<4xf32>
    %2:4 = vector.to_elements %arg2 : vector<4xf32>
    %3 = vector.from_elements %0#2, %1#1, %2#0, %0#1, %1#0, %2#2, %0#0, %1#3, %2#3, %0#3, %1#2, %2#1 : vector<12xf32>
    return %3 : vector<12xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_arbitrary_3x5_to_9(%arg0: vector<5xf32>, %arg1: vector<5xf32>, %arg2: vector<5xf32>) -> vector<9xf32> {
    %0:5 = vector.to_elements %arg0 : vector<5xf32>
    %1:5 = vector.to_elements %arg1 : vector<5xf32>
    %2:5 = vector.to_elements %arg2 : vector<5xf32>
    %3 = vector.from_elements %2#2, %1#1, %0#1, %0#1, %1#2, %2#2, %2#0, %1#1, %0#4 : vector<9xf32>
    return %3 : vector<9xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_broadcast_4x2_to_32(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>, %arg3: vector<2xf32>) -> vector<32xf32> {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    %1:2 = vector.to_elements %arg1 : vector<2xf32>
    %2:2 = vector.to_elements %arg2 : vector<2xf32>
    %3:2 = vector.to_elements %arg3 : vector<2xf32>
    %4 = vector.from_elements %0#0, %0#0, %0#0, %0#0, %0#1, %0#1, %0#1, %0#1, %1#0, %1#0, %1#0, %1#0, %1#1, %1#1, %1#1, %1#1, %2#0, %2#0, %2#0, %2#0, %2#1, %2#1, %2#1, %2#1, %3#0, %3#0, %3#0, %3#0, %3#1, %3#1, %3#1, %3#1 : vector<32xf32>
    return %4 : vector<32xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_arbitrary_mixed_sizes(%arg0: vector<2xf32>, %arg1: vector<1xf32>, %arg2: vector<3xf32>, %arg3: vector<1xf32>, %arg4: vector<5xf32>) -> vector<6xf32> {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    %1 = vector.to_elements %arg1 : vector<1xf32>
    %2:3 = vector.to_elements %arg2 : vector<3xf32>
    %3 = vector.to_elements %arg3 : vector<1xf32>
    %4:5 = vector.to_elements %arg4 : vector<5xf32>
    %5 = vector.from_elements %0#0, %2#0, %3, %4#0, %1, %4#3 : vector<6xf32>
    return %5 : vector<6xf32>
  }
}

// -----
module {
  func.func @shuffle_tree_odd_intermediate_vectors(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>, %arg3: vector<2xf32>, %arg4: vector<2xf32>, %arg5: vector<2xf32>) -> vector<6xf32> {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    %1:2 = vector.to_elements %arg1 : vector<2xf32>
    %2:2 = vector.to_elements %arg2 : vector<2xf32>
    %3:2 = vector.to_elements %arg3 : vector<2xf32>
    %4:2 = vector.to_elements %arg4 : vector<2xf32>
    %5:2 = vector.to_elements %arg5 : vector<2xf32>
    %6 = vector.from_elements %0#0, %1#1, %2#0, %3#1, %4#0, %5#1 : vector<6xf32>
    return %6 : vector<6xf32>
  }
}

