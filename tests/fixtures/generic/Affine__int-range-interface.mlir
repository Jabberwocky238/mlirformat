#map = affine_map<() -> (42)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0) -> (d0 floordiv 4)>
#map4 = affine_map<(d0) -> (d0 ceildiv 4)>
#map5 = affine_map<(d0) -> (d0 mod 4)>
#map6 = affine_map<(d0, d1) -> (d0 floordiv 2 + d1 mod 4)>
#map7 = affine_map<(d0)[s0] -> (d0 * s0 + s0)>
#map8 = affine_map<(d0, d1) -> (d0 - d1)>
#map9 = affine_map<(d0) -> (d0 * 4)>
#map10 = affine_map<(d0) -> (d0 mod 10)>
#map11 = affine_map<(d0)[s0] -> (d0 mod s0)>
#map12 = affine_map<(d0) -> (d0 mod 8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_constant"}> ({
    %48 = "affine.apply"() <{map = #map}> : () -> index
    %49 = "test.reflect_bounds"(%48) : (index) -> index
    "func.return"(%49) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_add"}> ({
    %44 = "test.with_bounds"() <{smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index}> : () -> index
    %45 = "test.with_bounds"() <{smax = 10 : index, smin = 4 : index, umax = 10 : index, umin = 4 : index}> : () -> index
    %46 = "affine.apply"(%44, %45) <{map = #map1}> : (index, index) -> index
    %47 = "test.reflect_bounds"(%46) : (index) -> index
    "func.return"(%47) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mul"}> ({
    %40 = "test.with_bounds"() <{smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index}> : () -> index
    %41 = "test.with_bounds"() <{smax = 6 : index, smin = 6 : index, umax = 6 : index, umin = 6 : index}> : () -> index
    %42 = "affine.apply"(%40, %41) <{map = #map2}> : (index, index) -> index
    %43 = "test.reflect_bounds"(%42) : (index) -> index
    "func.return"(%43) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_floordiv"}> ({
    %37 = "test.with_bounds"() <{smax = 10 : index, smin = 5 : index, umax = 10 : index, umin = 5 : index}> : () -> index
    %38 = "affine.apply"(%37) <{map = #map3}> : (index) -> index
    %39 = "test.reflect_bounds"(%38) : (index) -> index
    "func.return"(%39) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_ceildiv"}> ({
    %34 = "test.with_bounds"() <{smax = 10 : index, smin = 5 : index, umax = 10 : index, umin = 5 : index}> : () -> index
    %35 = "affine.apply"(%34) <{map = #map4}> : (index) -> index
    %36 = "test.reflect_bounds"(%35) : (index) -> index
    "func.return"(%36) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod"}> ({
    %31 = "test.with_bounds"() <{smax = 27 : index, smin = 5 : index, umax = 27 : index, umin = 5 : index}> : () -> index
    %32 = "affine.apply"(%31) <{map = #map5}> : (index) -> index
    %33 = "test.reflect_bounds"(%32) : (index) -> index
    "func.return"(%33) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_complex"}> ({
    %27 = "test.with_bounds"() <{smax = 20 : index, smin = 10 : index, umax = 20 : index, umin = 10 : index}> : () -> index
    %28 = "test.with_bounds"() <{smax = 7 : index, smin = 3 : index, umax = 7 : index, umin = 3 : index}> : () -> index
    %29 = "affine.apply"(%27, %28) <{map = #map6}> : (index, index) -> index
    %30 = "test.reflect_bounds"(%29) : (index) -> index
    "func.return"(%30) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_with_symbols"}> ({
    %23 = "test.with_bounds"() <{smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index}> : () -> index
    %24 = "test.with_bounds"() <{smax = 4 : index, smin = 3 : index, umax = 4 : index, umin = 3 : index}> : () -> index
    %25 = "affine.apply"(%23, %24) <{map = #map7}> : (index, index) -> index
    %26 = "test.reflect_bounds"(%25) : (index) -> index
    "func.return"(%26) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_sub"}> ({
    %19 = "test.with_bounds"() <{smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index}> : () -> index
    %20 = "test.with_bounds"() <{smax = 10 : index, smin = 4 : index, umax = 10 : index, umin = 4 : index}> : () -> index
    %21 = "affine.apply"(%19, %20) <{map = #map8}> : (index, index) -> index
    %22 = "test.reflect_bounds"(%21) : (index) -> index
    "func.return"(%22) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mul_constant"}> ({
    %16 = "test.with_bounds"() <{smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index}> : () -> index
    %17 = "affine.apply"(%16) <{map = #map9}> : (index) -> index
    %18 = "test.reflect_bounds"(%17) : (index) -> index
    "func.return"(%18) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod_small_range"}> ({
    %13 = "test.with_bounds"() <{smax = 6 : index, smin = 5 : index, umax = 6 : index, umin = 5 : index}> : () -> index
    %14 = "affine.apply"(%13) <{map = #map5}> : (index) -> index
    %15 = "test.reflect_bounds"(%14) : (index) -> index
    "func.return"(%15) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod_already_in_range"}> ({
    %10 = "test.with_bounds"() <{smax = 7 : index, smin = 5 : index, umax = 7 : index, umin = 5 : index}> : () -> index
    %11 = "affine.apply"(%10) <{map = #map10}> : (index) -> index
    %12 = "test.reflect_bounds"(%11) : (index) -> index
    "func.return"(%12) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod_variable_divisor"}> ({
    %6 = "test.with_bounds"() <{smax = 20 : index, smin = 10 : index, umax = 20 : index, umin = 10 : index}> : () -> index
    %7 = "test.with_bounds"() <{smax = 5 : index, smin = 3 : index, umax = 5 : index, umin = 3 : index}> : () -> index
    %8 = "affine.apply"(%6, %7) <{map = #map11}> : (index, index) -> index
    %9 = "test.reflect_bounds"(%8) : (index) -> index
    "func.return"(%9) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod_cross_boundary"}> ({
    %3 = "test.with_bounds"() <{smax = 17 : index, smin = 14 : index, umax = 17 : index, umin = 14 : index}> : () -> index
    %4 = "affine.apply"(%3) <{map = #map12}> : (index) -> index
    %5 = "test.reflect_bounds"(%4) : (index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_mod_negative_dividend"}> ({
    %0 = "test.with_bounds"() <{smax = 2 : index, smin = -2 : index, umax = 2 : index, umin = 0 : index}> : () -> index
    %1 = "affine.apply"(%0) <{map = #map5}> : (index) -> index
    %2 = "test.reflect_bounds"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

