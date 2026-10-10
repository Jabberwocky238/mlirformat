#map = affine_map<() -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "add_min_max"}> ({
  ^bb0(%arg79: index, %arg80: index):
    %477 = "arith.constant"() <{value = 1 : index}> : () -> index
    %478 = "arith.constant"() <{value = 2 : index}> : () -> index
    %479 = "arith.minsi"(%arg79, %477) : (index, index) -> index
    %480 = "arith.maxsi"(%479, %477) : (index, index) -> index
    %481 = "arith.minui"(%arg80, %478) : (index, index) -> index
    %482 = "arith.maxui"(%481, %478) : (index, index) -> index
    %483 = "arith.addi"(%480, %482) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%483) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "add_lower_bound"}> ({
  ^bb0(%arg77: i32, %arg78: i32):
    %469 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %470 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %471 = "arith.maxsi"(%arg77, %469) : (i32, i32) -> i32
    %472 = "arith.maxsi"(%arg78, %469) : (i32, i32) -> i32
    %473 = "arith.addi"(%471, %472) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %474 = "arith.cmpi"(%473, %470) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %475 = "arith.cmpi"(%473, %470) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %476 = "arith.andi"(%474, %475) : (i1, i1) -> i1
    "func.return"(%476) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i1, sym_name = "sub_signed_vs_unsigned"}> ({
  ^bb0(%arg76: i64):
    %460 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %461 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %462 = "arith.constant"() <{value = -5 : i64}> : () -> i64
    %463 = "arith.minsi"(%arg76, %461) : (i64, i64) -> i64
    %464 = "arith.maxsi"(%463, %462) : (i64, i64) -> i64
    %465 = "arith.subi"(%464, %461) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    %466 = "arith.cmpi"(%465, %460) <{predicate = 3 : i64}> : (i64, i64) -> i1
    %467 = "arith.cmpi"(%465, %460) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %468 = "arith.andi"(%466, %467) : (i1, i1) -> i1
    "func.return"(%468) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "multiply_negatives"}> ({
  ^bb0(%arg74: index, %arg75: index):
    %446 = "arith.constant"() <{value = 2 : index}> : () -> index
    %447 = "arith.constant"() <{value = 3 : index}> : () -> index
    %448 = "arith.constant"() <{value = -1 : index}> : () -> index
    %449 = "arith.constant"() <{value = -2 : index}> : () -> index
    %450 = "arith.constant"() <{value = -4 : index}> : () -> index
    %451 = "arith.constant"() <{value = -12 : index}> : () -> index
    %452 = "arith.maxsi"(%arg74, %446) : (index, index) -> index
    %453 = "arith.minsi"(%452, %447) : (index, index) -> index
    %454 = "arith.minsi"(%arg75, %448) : (index, index) -> index
    %455 = "arith.maxsi"(%454, %450) : (index, index) -> index
    %456 = "arith.muli"(%453, %455) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %457 = "arith.cmpi"(%456, %451) <{predicate = 2 : i64}> : (index, index) -> i1
    %458 = "arith.cmpi"(%448, %456) <{predicate = 2 : i64}> : (index, index) -> i1
    %459 = "arith.ori"(%457, %458) : (i1, i1) -> i1
    "func.return"(%459) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "multiply_unsigned_bounds"}> ({
  ^bb0(%arg72: i16, %arg73: i16):
    %436 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %437 = "arith.constant"() <{value = 4 : i16}> : () -> i16
    %438 = "arith.constant"() <{value = 16383 : i16}> : () -> i16
    %439 = "arith.constant"() <{value = -4 : i16}> : () -> i16
    %440 = "arith.andi"(%arg72, %438) : (i16, i16) -> i16
    %441 = "arith.minui"(%arg73, %437) : (i16, i16) -> i16
    %442 = "arith.muli"(%440, %441) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %443 = "arith.cmpi"(%442, %436) <{predicate = 9 : i64}> : (i16, i16) -> i1
    %444 = "arith.cmpi"(%442, %439) <{predicate = 7 : i64}> : (i16, i16) -> i1
    %445 = "arith.andi"(%443, %444) : (i1, i1) -> i1
    "func.return"(%445) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "for_loop_with_increasing_arg"}> ({
    %429 = "arith.constant"() <{value = 0 : index}> : () -> index
    %430 = "arith.constant"() <{value = 1 : index}> : () -> index
    %431 = "arith.constant"() <{value = 4 : index}> : () -> index
    %432 = "arith.constant"() <{value = 16 : index}> : () -> index
    %433 = "scf.for"(%429, %431, %430, %429) ({
    ^bb0(%arg70: index, %arg71: index):
      %435 = "arith.addi"(%arg70, %arg71) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%435) : (index) -> ()
    }) : (index, index, index, index) -> index
    %434 = "arith.cmpi"(%433, %432) <{predicate = 7 : i64}> : (index, index) -> i1
    "func.return"(%434) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "for_loop_with_constant_result"}> ({
    %422 = "arith.constant"() <{value = 0 : index}> : () -> index
    %423 = "arith.constant"() <{value = 1 : index}> : () -> index
    %424 = "arith.constant"() <{value = 4 : index}> : () -> index
    %425 = "arith.constant"() <{value = true}> : () -> i1
    %426 = "scf.for"(%422, %424, %423, %425) ({
    ^bb0(%arg68: index, %arg69: i1):
      %427 = "arith.cmpi"(%arg68, %424) <{predicate = 7 : i64}> : (index, index) -> i1
      %428 = "arith.andi"(%427, %arg69) : (i1, i1) -> i1
      "scf.yield"(%428) : (i1) -> ()
    }) : (index, index, index, i1) -> i1
    "func.return"(%426) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "while_false"}> ({
  ^bb0(%arg65: index):
    %416 = "arith.constant"() <{value = 0 : index}> : () -> index
    %417 = "arith.constant"() <{value = 1 : index}> : () -> index
    %418 = "arith.constant"() <{value = 2 : index}> : () -> index
    %419 = "arith.divui"(%arg65, %418) : (index, index) -> index
    %420 = "scf.while"(%419) ({
    ^bb0(%arg67: index):
      %421 = "arith.cmpi"(%arg67, %416) <{predicate = 2 : i64}> : (index, index) -> i1
      "scf.condition"(%421, %arg67) : (i1, index) -> ()
    }, {
    ^bb0(%arg66: index):
      "scf.yield"(%418) : (index) -> ()
    }) : (index) -> index
    "func.return"(%420) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_bounds_positive"}> ({
  ^bb0(%arg64: index):
    %403 = "arith.constant"() <{value = 0 : index}> : () -> index
    %404 = "arith.constant"() <{value = 2 : index}> : () -> index
    %405 = "arith.constant"() <{value = 4 : index}> : () -> index
    %406 = "arith.maxsi"(%arg64, %404) : (index, index) -> index
    %407 = "arith.divsi"(%405, %406) : (index, index) -> index
    %408 = "arith.divui"(%405, %406) : (index, index) -> index
    %409 = "arith.cmpi"(%407, %403) <{predicate = 5 : i64}> : (index, index) -> i1
    %410 = "arith.cmpi"(%407, %404) <{predicate = 3 : i64}> : (index, index) -> i1
    %411 = "arith.cmpi"(%408, %403) <{predicate = 5 : i64}> : (index, index) -> i1
    %412 = "arith.cmpi"(%407, %404) <{predicate = 3 : i64}> : (index, index) -> i1
    %413 = "arith.andi"(%409, %410) : (i1, i1) -> i1
    %414 = "arith.andi"(%413, %411) : (i1, i1) -> i1
    %415 = "arith.andi"(%414, %412) : (i1, i1) -> i1
    "func.return"(%415) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_bounds_negative"}> ({
  ^bb0(%arg63: index):
    %392 = "arith.constant"() <{value = 0 : index}> : () -> index
    %393 = "arith.constant"() <{value = -2 : index}> : () -> index
    %394 = "arith.constant"() <{value = 4 : index}> : () -> index
    %395 = "arith.minsi"(%arg63, %393) : (index, index) -> index
    %396 = "arith.divsi"(%394, %395) : (index, index) -> index
    %397 = "arith.divui"(%394, %395) : (index, index) -> index
    %398 = "arith.cmpi"(%396, %392) <{predicate = 3 : i64}> : (index, index) -> i1
    %399 = "arith.cmpi"(%396, %393) <{predicate = 5 : i64}> : (index, index) -> i1
    %400 = "arith.cmpi"(%397, %392) <{predicate = 0 : i64}> : (index, index) -> i1
    %401 = "arith.andi"(%398, %399) : (i1, i1) -> i1
    %402 = "arith.andi"(%401, %400) : (i1, i1) -> i1
    "func.return"(%402) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_zero_undefined"}> ({
  ^bb0(%arg62: index):
    %386 = "arith.constant"() <{value = 0 : index}> : () -> index
    %387 = "arith.constant"() <{value = 1 : index}> : () -> index
    %388 = "arith.constant"() <{value = 4 : index}> : () -> index
    %389 = "arith.andi"(%arg62, %387) : (index, index) -> index
    %390 = "arith.divui"(%388, %389) : (index, index) -> index
    %391 = "arith.cmpi"(%390, %388) <{predicate = 7 : i64}> : (index, index) -> i1
    "func.return"(%391) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_refine_min"}> ({
  ^bb0(%arg61: index):
    %380 = "arith.constant"() <{value = 1 : index}> : () -> index
    %381 = "arith.constant"() <{value = 2 : index}> : () -> index
    %382 = "arith.constant"() <{value = 4 : index}> : () -> index
    %383 = "arith.andi"(%arg61, %381) : (index, index) -> index
    %384 = "arith.divui"(%382, %383) : (index, index) -> index
    %385 = "arith.cmpi"(%384, %380) <{predicate = 9 : i64}> : (index, index) -> i1
    "func.return"(%385) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "ceil_divui"}> ({
  ^bb0(%arg60: index):
    %368 = "arith.constant"() <{value = 0 : index}> : () -> index
    %369 = "arith.constant"() <{value = 1 : index}> : () -> index
    %370 = "arith.constant"() <{value = 3 : index}> : () -> index
    %371 = "arith.constant"() <{value = 4 : index}> : () -> index
    %372 = "arith.minui"(%arg60, %370) : (index, index) -> index
    %373 = "arith.maxui"(%372, %369) : (index, index) -> index
    %374 = "arith.ceildivui"(%373, %371) : (index, index) -> index
    %375 = "arith.cmpi"(%374, %369) <{predicate = 0 : i64}> : (index, index) -> i1
    %376 = "arith.maxui"(%372, %368) : (index, index) -> index
    %377 = "arith.ceildivui"(%376, %371) : (index, index) -> index
    %378 = "arith.cmpi"(%377, %369) <{predicate = 0 : i64}> : (index, index) -> i1
    %379 = "arith.andi"(%375, %378) : (i1, i1) -> i1
    "func.return"(%379) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "ceil_divui_by_zero_issue_131273"}> ({
    %365 = "test.with_bounds"() <{smax = 0 : i32, smin = -1 : i32, umax = 0 : i32, umin = -1 : i32}> : () -> i32
    %366 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %367 = "arith.ceildivui"(%366, %365) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "ceil_divsi"}> ({
  ^bb0(%arg59: index):
    %349 = "arith.constant"() <{value = 0 : index}> : () -> index
    %350 = "arith.constant"() <{value = 1 : index}> : () -> index
    %351 = "arith.constant"() <{value = 3 : index}> : () -> index
    %352 = "arith.constant"() <{value = 4 : index}> : () -> index
    %353 = "arith.constant"() <{value = -4 : index}> : () -> index
    %354 = "arith.minsi"(%arg59, %351) : (index, index) -> index
    %355 = "arith.maxsi"(%354, %350) : (index, index) -> index
    %356 = "arith.ceildivsi"(%355, %352) : (index, index) -> index
    %357 = "arith.cmpi"(%356, %350) <{predicate = 0 : i64}> : (index, index) -> i1
    %358 = "arith.ceildivsi"(%355, %353) : (index, index) -> index
    %359 = "arith.cmpi"(%358, %349) <{predicate = 0 : i64}> : (index, index) -> i1
    %360 = "arith.andi"(%357, %359) : (i1, i1) -> i1
    %361 = "arith.maxsi"(%354, %349) : (index, index) -> index
    %362 = "arith.ceildivsi"(%361, %352) : (index, index) -> index
    %363 = "arith.cmpi"(%362, %350) <{predicate = 0 : i64}> : (index, index) -> i1
    %364 = "arith.andi"(%360, %363) : (i1, i1) -> i1
    "func.return"(%364) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "ceil_divsi_full_range"}> ({
  ^bb0(%arg58: index):
    %347 = "arith.constant"() <{value = 64 : index}> : () -> index
    %348 = "arith.ceildivsi"(%arg58, %347) : (index, index) -> index
    "func.return"(%348) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "ceil_divsi_intmin_bug_115293"}> ({
    %342 = "test.with_bounds"() <{smax = -9223372036854775808 : si64, smin = -9223372036854775808 : si64, umax = 9223372036854775808 : ui64, umin = 9223372036854775808 : ui64}> : () -> i64
    %343 = "test.with_bounds"() <{smax = 1189465982 : si64, smin = 1189465982 : si64, umax = 1189465982 : ui64, umin = 1189465982 : ui64}> : () -> i64
    %344 = "test.with_bounds"() <{smax = 7754212542 : si64, smin = 7754212542 : si64, umax = 7754212542 : ui64, umin = 7754212542 : ui64}> : () -> i64
    %345 = "arith.ceildivsi"(%342, %343) : (i64, i64) -> i64
    %346 = "arith.cmpi"(%345, %344) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%346) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "floor_divsi"}> ({
  ^bb0(%arg57: index):
    %334 = "arith.constant"() <{value = 4 : index}> : () -> index
    %335 = "arith.constant"() <{value = -1 : index}> : () -> index
    %336 = "arith.constant"() <{value = -3 : index}> : () -> index
    %337 = "arith.constant"() <{value = -4 : index}> : () -> index
    %338 = "arith.minsi"(%arg57, %335) : (index, index) -> index
    %339 = "arith.maxsi"(%338, %337) : (index, index) -> index
    %340 = "arith.floordivsi"(%339, %334) : (index, index) -> index
    %341 = "arith.cmpi"(%340, %335) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%341) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remui_base"}> ({
  ^bb0(%arg55: index, %arg56: index):
    %328 = "arith.constant"() <{value = 2 : index}> : () -> index
    %329 = "arith.constant"() <{value = 4 : index}> : () -> index
    %330 = "arith.minui"(%arg56, %329) : (index, index) -> index
    %331 = "arith.maxui"(%330, %328) : (index, index) -> index
    %332 = "arith.remui"(%arg55, %331) : (index, index) -> index
    %333 = "arith.cmpi"(%332, %329) <{predicate = 6 : i64}> : (index, index) -> i1
    "func.return"(%333) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remui_base_maybe_zero"}> ({
  ^bb0(%arg53: index, %arg54: index):
    %323 = "arith.constant"() <{value = 4 : index}> : () -> index
    %324 = "arith.constant"() <{value = 5 : index}> : () -> index
    %325 = "arith.minui"(%arg54, %323) : (index, index) -> index
    %326 = "arith.remui"(%arg53, %325) : (index, index) -> index
    %327 = "arith.cmpi"(%326, %324) <{predicate = 6 : i64}> : (index, index) -> i1
    "func.return"(%327) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remsi_base"}> ({
  ^bb0(%arg51: index, %arg52: index):
    %310 = "arith.constant"() <{value = 0 : index}> : () -> index
    %311 = "arith.constant"() <{value = 2 : index}> : () -> index
    %312 = "arith.constant"() <{value = 4 : index}> : () -> index
    %313 = "arith.constant"() <{value = -4 : index}> : () -> index
    %314 = "arith.constant"() <{value = true}> : () -> i1
    %315 = "arith.minsi"(%arg52, %312) : (index, index) -> index
    %316 = "arith.maxsi"(%315, %311) : (index, index) -> index
    %317 = "arith.remsi"(%arg51, %316) : (index, index) -> index
    %318 = "arith.cmpi"(%317, %313) <{predicate = 4 : i64}> : (index, index) -> i1
    %319 = "arith.cmpi"(%317, %312) <{predicate = 2 : i64}> : (index, index) -> i1
    %320 = "arith.cmpi"(%317, %310) <{predicate = 5 : i64}> : (index, index) -> i1
    %321 = "arith.andi"(%318, %319) : (i1, i1) -> i1
    %322 = "arith.andi"(%320, %321) : (i1, i1) -> i1
    "func.return"(%322) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remsi_positive"}> ({
  ^bb0(%arg49: index, %arg50: index):
    %299 = "arith.constant"() <{value = 0 : index}> : () -> index
    %300 = "arith.constant"() <{value = 2 : index}> : () -> index
    %301 = "arith.constant"() <{value = 4 : index}> : () -> index
    %302 = "arith.constant"() <{value = true}> : () -> i1
    %303 = "arith.minsi"(%arg50, %301) : (index, index) -> index
    %304 = "arith.maxsi"(%303, %300) : (index, index) -> index
    %305 = "arith.maxsi"(%arg49, %299) : (index, index) -> index
    %306 = "arith.remsi"(%305, %304) : (index, index) -> index
    %307 = "arith.cmpi"(%306, %299) <{predicate = 5 : i64}> : (index, index) -> i1
    %308 = "arith.cmpi"(%306, %301) <{predicate = 2 : i64}> : (index, index) -> i1
    %309 = "arith.andi"(%307, %308) : (i1, i1) -> i1
    "func.return"(%309) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remui_restricted"}> ({
  ^bb0(%arg48: index):
    %290 = "arith.constant"() <{value = 2 : index}> : () -> index
    %291 = "arith.constant"() <{value = 3 : index}> : () -> index
    %292 = "arith.constant"() <{value = 4 : index}> : () -> index
    %293 = "arith.minui"(%arg48, %291) : (index, index) -> index
    %294 = "arith.maxui"(%293, %290) : (index, index) -> index
    %295 = "arith.remui"(%294, %292) : (index, index) -> index
    %296 = "arith.cmpi"(%295, %291) <{predicate = 7 : i64}> : (index, index) -> i1
    %297 = "arith.cmpi"(%295, %290) <{predicate = 9 : i64}> : (index, index) -> i1
    %298 = "arith.andi"(%296, %297) : (i1, i1) -> i1
    "func.return"(%298) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remsi_restricted"}> ({
  ^bb0(%arg47: index):
    %281 = "arith.constant"() <{value = 2 : index}> : () -> index
    %282 = "arith.constant"() <{value = 3 : index}> : () -> index
    %283 = "arith.constant"() <{value = -4 : index}> : () -> index
    %284 = "arith.minsi"(%arg47, %282) : (index, index) -> index
    %285 = "arith.maxsi"(%284, %281) : (index, index) -> index
    %286 = "arith.remsi"(%285, %283) : (index, index) -> index
    %287 = "arith.cmpi"(%286, %282) <{predicate = 7 : i64}> : (index, index) -> i1
    %288 = "arith.cmpi"(%286, %281) <{predicate = 9 : i64}> : (index, index) -> i1
    %289 = "arith.andi"(%287, %288) : (i1, i1) -> i1
    "func.return"(%289) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remui_restricted_fails"}> ({
  ^bb0(%arg46: index):
    %273 = "arith.constant"() <{value = 2 : index}> : () -> index
    %274 = "arith.constant"() <{value = 3 : index}> : () -> index
    %275 = "arith.constant"() <{value = 4 : index}> : () -> index
    %276 = "arith.constant"() <{value = 5 : index}> : () -> index
    %277 = "arith.minui"(%arg46, %276) : (index, index) -> index
    %278 = "arith.maxui"(%277, %274) : (index, index) -> index
    %279 = "arith.remui"(%278, %275) : (index, index) -> index
    %280 = "arith.cmpi"(%279, %273) <{predicate = 1 : i64}> : (index, index) -> i1
    "func.return"(%280) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remsi_restricted_fails"}> ({
  ^bb0(%arg45: index):
    %265 = "arith.constant"() <{value = 2 : index}> : () -> index
    %266 = "arith.constant"() <{value = 3 : index}> : () -> index
    %267 = "arith.constant"() <{value = 5 : index}> : () -> index
    %268 = "arith.constant"() <{value = -4 : index}> : () -> index
    %269 = "arith.minsi"(%arg45, %267) : (index, index) -> index
    %270 = "arith.maxsi"(%269, %266) : (index, index) -> index
    %271 = "arith.remsi"(%270, %268) : (index, index) -> index
    %272 = "arith.cmpi"(%271, %265) <{predicate = 1 : i64}> : (index, index) -> i1
    "func.return"(%272) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "andi"}> ({
  ^bb0(%arg44: index):
    %256 = "arith.constant"() <{value = 2 : index}> : () -> index
    %257 = "arith.constant"() <{value = 5 : index}> : () -> index
    %258 = "arith.constant"() <{value = 7 : index}> : () -> index
    %259 = "arith.minsi"(%arg44, %257) : (index, index) -> index
    %260 = "arith.maxsi"(%259, %256) : (index, index) -> index
    %261 = "arith.andi"(%260, %258) : (index, index) -> index
    %262 = "arith.cmpi"(%261, %257) <{predicate = 8 : i64}> : (index, index) -> i1
    %263 = "arith.cmpi"(%261, %258) <{predicate = 7 : i64}> : (index, index) -> i1
    %264 = "arith.andi"(%262, %263) : (i1, i1) -> i1
    "func.return"(%264) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "andi_doesnt_make_nonnegative"}> ({
  ^bb0(%arg43: index):
    %251 = "arith.constant"() <{value = 0 : index}> : () -> index
    %252 = "arith.constant"() <{value = 1 : index}> : () -> index
    %253 = "arith.addi"(%arg43, %252) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %254 = "arith.andi"(%arg43, %253) : (index, index) -> index
    %255 = "arith.cmpi"(%254, %251) <{predicate = 5 : i64}> : (index, index) -> i1
    "func.return"(%255) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i128, i128) -> i1, sym_name = "ori"}> ({
  ^bb0(%arg41: i128, %arg42: i128):
    %246 = "arith.constant"() <{value = -1 : i128}> : () -> i128
    %247 = "arith.constant"() <{value = 0 : i128}> : () -> i128
    %248 = "arith.minsi"(%arg42, %246) : (i128, i128) -> i128
    %249 = "arith.ori"(%arg41, %248) : (i128, i128) -> i128
    %250 = "arith.cmpi"(%249, %247) <{predicate = 2 : i64}> : (i128, i128) -> i1
    "func.return"(%250) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "xori_issue_82168"}> ({
    %241 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %242 = "arith.constant"() <{value = 2060639849 : i64}> : () -> i64
    %243 = "test.with_bounds"() <{smax = 2060639850 : i64, smin = 2060639849 : i64, umax = 2060639850 : i64, umin = 2060639849 : i64}> : () -> i64
    %244 = "arith.xori"(%243, %242) : (i64, i64) -> i64
    %245 = "arith.cmpi"(%244, %241) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%245) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i1, i1), sym_name = "xori_i1"}> ({
    %236 = "arith.constant"() <{value = true}> : () -> i1
    %237 = "test.with_bounds"() <{smax = false, smin = false, umax = false, umin = false}> : () -> i1
    %238 = "test.with_bounds"() <{smax = true, smin = true, umax = true, umin = true}> : () -> i1
    %239 = "arith.xori"(%237, %236) : (i1, i1) -> i1
    %240 = "arith.xori"(%238, %236) : (i1, i1) -> i1
    "func.return"(%239, %240) : (i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "xori"}> ({
  ^bb0(%arg39: i64, %arg40: i64):
    %227 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %228 = "arith.constant"() <{value = 7 : i64}> : () -> i64
    %229 = "arith.constant"() <{value = 15 : i64}> : () -> i64
    %230 = "arith.constant"() <{value = true}> : () -> i1
    %231 = "arith.minui"(%arg39, %228) : (i64, i64) -> i64
    %232 = "arith.minui"(%arg40, %229) : (i64, i64) -> i64
    %233 = "arith.xori"(%231, %232) : (i64, i64) -> i64
    %234 = "arith.cmpi"(%233, %229) <{predicate = 3 : i64}> : (i64, i64) -> i1
    %235 = "arith.xori"(%234, %230) : (i1, i1) -> i1
    "func.return"(%235) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "extui"}> ({
  ^bb0(%arg38: i16):
    %224 = "arith.constant"() <{value = 65535 : i32}> : () -> i32
    %225 = "arith.extui"(%arg38) : (i16) -> i32
    %226 = "arith.cmpi"(%225, %224) <{predicate = 7 : i64}> : (i32, i32) -> i1
    "func.return"(%226) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "extsi"}> ({
  ^bb0(%arg37: i16):
    %218 = "arith.constant"() <{value = 32767 : i32}> : () -> i32
    %219 = "arith.constant"() <{value = -32768 : i32}> : () -> i32
    %220 = "arith.extsi"(%arg37) : (i16) -> i32
    %221 = "arith.cmpi"(%220, %218) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %222 = "arith.cmpi"(%220, %219) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %223 = "arith.andi"(%221, %222) : (i1, i1) -> i1
    "func.return"(%223) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i1, sym_name = "trunci"}> ({
  ^bb0(%arg36: i32):
    %206 = "arith.constant"() <{value = -14 : i32}> : () -> i32
    %207 = "arith.constant"() <{value = -14 : i16}> : () -> i16
    %208 = "arith.constant"() <{value = -32768 : i32}> : () -> i32
    %209 = "arith.minsi"(%arg36, %206) : (i32, i32) -> i32
    %210 = "arith.maxsi"(%209, %208) : (i32, i32) -> i32
    %211 = "arith.trunci"(%210) <{overflowFlags = #arith.overflow<none>}> : (i32) -> i16
    %212 = "arith.cmpi"(%211, %207) <{predicate = 3 : i64}> : (i16, i16) -> i1
    %213 = "arith.extsi"(%211) : (i16) -> i32
    %214 = "arith.cmpi"(%213, %206) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %215 = "arith.cmpi"(%213, %208) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %216 = "arith.andi"(%212, %214) : (i1, i1) -> i1
    %217 = "arith.andi"(%216, %215) : (i1, i1) -> i1
    "func.return"(%217) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "index_cast"}> ({
  ^bb0(%arg35: index):
    %201 = "arith.constant"() <{value = -2147483648 : i64}> : () -> i64
    %202 = "arith.index_cast"(%arg35) : (index) -> i32
    %203 = "arith.index_cast"(%202) : (i32) -> index
    %204 = "arith.index_cast"(%201) : (i64) -> index
    %205 = "arith.cmpi"(%203, %204) <{predicate = 5 : i64}> : (index, index) -> i1
    "func.return"(%205) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i1) -> i1, sym_name = "shli"}> ({
  ^bb0(%arg33: i32, %arg34: i1):
    %186 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %187 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %188 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %189 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %190 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %191 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %192 = "arith.maxsi"(%arg33, %190) : (i32, i32) -> i32
    %193 = "arith.minsi"(%192, %186) : (i32, i32) -> i32
    %194 = "arith.select"(%arg34, %186, %187) : (i1, i32, i32) -> i32
    %195 = "arith.shli"(%193, %194) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %196 = "arith.cmpi"(%195, %191) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %197 = "arith.cmpi"(%195, %189) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %198 = "arith.cmpi"(%195, %188) <{predicate = 4 : i64}> : (i32, i32) -> i1
    %199 = "arith.andi"(%196, %197) : (i1, i1) -> i1
    %200 = "arith.andi"(%199, %198) : (i1, i1) -> i1
    "func.return"(%200) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i1, sym_name = "shrui"}> ({
  ^bb0(%arg32: i1):
    %175 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %176 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %177 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %178 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %179 = "arith.select"(%arg32, %175, %176) : (i1, i32, i32) -> i32
    %180 = "arith.shrui"(%178, %179) : (i32, i32) -> i32
    %181 = "arith.cmpi"(%180, %177) <{predicate = 7 : i64}> : (i32, i32) -> i1
    %182 = "arith.cmpi"(%180, %175) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %183 = "arith.cmpi"(%180, %177) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %184 = "arith.andi"(%181, %182) : (i1, i1) -> i1
    %185 = "arith.andi"(%184, %183) : (i1, i1) -> i1
    "func.return"(%185) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i1) -> i1, sym_name = "shrsi"}> ({
  ^bb0(%arg30: i32, %arg31: i1):
    %160 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %161 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %162 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %163 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %164 = "arith.constant"() <{value = -8 : i32}> : () -> i32
    %165 = "arith.constant"() <{value = -32 : i32}> : () -> i32
    %166 = "arith.maxsi"(%arg30, %165) : (i32, i32) -> i32
    %167 = "arith.minsi"(%166, %163) : (i32, i32) -> i32
    %168 = "arith.select"(%arg31, %160, %161) : (i1, i32, i32) -> i32
    %169 = "arith.shrsi"(%167, %168) : (i32, i32) -> i32
    %170 = "arith.cmpi"(%169, %164) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %171 = "arith.cmpi"(%169, %162) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %172 = "arith.cmpi"(%169, %160) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %173 = "arith.andi"(%170, %171) : (i1, i1) -> i1
    %174 = "arith.andi"(%173, %172) : (i1, i1) -> i1
    "func.return"(%174) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "no_aggressive_eq"}> ({
  ^bb0(%arg29: index):
    %156 = "arith.constant"() <{value = 1 : index}> : () -> index
    %157 = "arith.andi"(%arg29, %156) : (index, index) -> index
    %158 = "arith.minui"(%arg29, %156) : (index, index) -> index
    %159 = "arith.cmpi"(%157, %158) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%159) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "select_union"}> ({
  ^bb0(%arg27: index, %arg28: i1):
    %146 = "arith.constant"() <{value = 64 : index}> : () -> index
    %147 = "arith.constant"() <{value = 100 : index}> : () -> index
    %148 = "arith.constant"() <{value = 128 : index}> : () -> index
    %149 = "arith.constant"() <{value = 192 : index}> : () -> index
    %150 = "arith.remui"(%arg27, %146) : (index, index) -> index
    %151 = "arith.addi"(%150, %148) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %152 = "arith.select"(%arg28, %150, %151) : (i1, index, index) -> index
    %153 = "arith.cmpi"(%152, %149) <{predicate = 2 : i64}> : (index, index) -> i1
    %154 = "arith.cmpi"(%147, %152) <{predicate = 1 : i64}> : (index, index) -> i1
    %155 = "arith.andi"(%153, %154) : (i1, i1) -> i1
    "func.return"(%155) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "if_union"}> ({
  ^bb0(%arg25: index, %arg26: i1):
    %135 = "arith.constant"() <{value = 4 : index}> : () -> index
    %136 = "arith.constant"() <{value = 16 : index}> : () -> index
    %137 = "arith.constant"() <{value = -1 : index}> : () -> index
    %138 = "arith.constant"() <{value = -4 : index}> : () -> index
    %139 = "arith.minui"(%arg25, %135) : (index, index) -> index
    %140 = "scf.if"(%arg26) ({
      %145 = "arith.muli"(%139, %139) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%145) : (index) -> ()
    }, {
      %144 = "arith.muli"(%139, %137) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%144) : (index) -> ()
    }) : (i1) -> index
    %141 = "arith.cmpi"(%140, %136) <{predicate = 3 : i64}> : (index, index) -> i1
    %142 = "arith.cmpi"(%140, %138) <{predicate = 5 : i64}> : (index, index) -> i1
    %143 = "arith.andi"(%141, %142) : (i1, i1) -> i1
    "func.return"(%143) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "branch_union"}> ({
  ^bb0(%arg23: index, %arg24: i1):
    %124 = "arith.constant"() <{value = 4 : index}> : () -> index
    %125 = "arith.constant"() <{value = 16 : index}> : () -> index
    %126 = "arith.constant"() <{value = -1 : index}> : () -> index
    %127 = "arith.constant"() <{value = -4 : index}> : () -> index
    %128 = "arith.minui"(%arg23, %124) : (index, index) -> index
    "cf.cond_br"(%arg24)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %129 = "arith.muli"(%128, %128) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%129)[^bb3] : (index) -> ()
  ^bb2:  // pred: ^bb0
    %130 = "arith.muli"(%128, %126) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%130)[^bb3] : (index) -> ()
  ^bb3(%131: index):  // 2 preds: ^bb1, ^bb2
    %132 = "arith.cmpi"(%131, %125) <{predicate = 3 : i64}> : (index, index) -> i1
    %133 = "arith.cmpi"(%131, %127) <{predicate = 5 : i64}> : (index, index) -> i1
    %134 = "arith.andi"(%132, %133) : (i1, i1) -> i1
    "func.return"(%134) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "loop_bound_not_inferred_with_branch"}> ({
  ^bb0(%arg21: index, %arg22: i1):
    %112 = "arith.constant"() <{value = 0 : index}> : () -> index
    %113 = "arith.constant"() <{value = 1 : index}> : () -> index
    %114 = "arith.constant"() <{value = 4 : index}> : () -> index
    %115 = "arith.minui"(%arg21, %114) : (index, index) -> index
    "cf.br"(%112)[^bb2] : (index) -> ()
  ^bb1(%116: index):  // pred: ^bb2
    %117 = "arith.addi"(%116, %113) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%117)[^bb2] : (index) -> ()
  ^bb2(%118: index):  // 2 preds: ^bb0, ^bb1
    %119 = "arith.cmpi"(%118, %114) <{predicate = 6 : i64}> : (index, index) -> i1
    "cf.cond_br"(%119, %118, %118)[^bb1, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, index, index) -> ()
  ^bb3(%120: index):  // pred: ^bb2
    %121 = "arith.cmpi"(%120, %112) <{predicate = 5 : i64}> : (index, index) -> i1
    %122 = "arith.cmpi"(%120, %114) <{predicate = 2 : i64}> : (index, index) -> i1
    %123 = "arith.andi"(%121, %122) : (i1, i1) -> i1
    "func.return"(%123) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>) -> index, sym_name = "truncation_spillover"}> ({
  ^bb0(%arg18: memref<?xi32>):
    %104 = "arith.constant"() <{value = 0 : index}> : () -> index
    %105 = "arith.constant"() <{value = 1 : index}> : () -> index
    %106 = "arith.constant"() <{value = 2 : index}> : () -> index
    %107 = "arith.constant"() <{value = 49 : index}> : () -> index
    %108 = "scf.for"(%104, %106, %105, %104) ({
    ^bb0(%arg19: index, %arg20: index):
      %109 = "arith.divsi"(%arg20, %107) : (index, index) -> index
      %110 = "arith.index_cast"(%109) : (index) -> i32
      "memref.store"(%110, %arg18, %104) : (i32, memref<?xi32>, index) -> ()
      %111 = "arith.addi"(%arg20, %arg19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%111) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"(%108) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_catches_overflow"}> ({
  ^bb0(%arg17: i16):
    %95 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %96 = "arith.constant"() <{value = 130 : i16}> : () -> i16
    %97 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %98 = "arith.maxui"(%arg17, %95) : (i16, i16) -> i16
    %99 = "arith.minui"(%98, %96) : (i16, i16) -> i16
    %100 = "arith.trunci"(%99) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %101 = "arith.cmpi"(%100, %97) <{predicate = 5 : i64}> : (i8, i8) -> i1
    %102 = "arith.cmpi"(%100, %97) <{predicate = 9 : i64}> : (i8, i8) -> i1
    %103 = "arith.andi"(%101, %102) : (i1, i1) -> i1
    "func.return"(%103) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_respects_same_high_half"}> ({
  ^bb0(%arg16: i16):
    %88 = "arith.constant"() <{value = 256 : i16}> : () -> i16
    %89 = "arith.constant"() <{value = 257 : i16}> : () -> i16
    %90 = "arith.constant"() <{value = 2 : i8}> : () -> i8
    %91 = "arith.maxui"(%arg16, %88) : (i16, i16) -> i16
    %92 = "arith.minui"(%91, %89) : (i16, i16) -> i16
    %93 = "arith.trunci"(%92) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %94 = "arith.cmpi"(%93, %90) <{predicate = 5 : i64}> : (i8, i8) -> i1
    "func.return"(%94) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_handles_small_signed_ranges"}> ({
  ^bb0(%arg15: i16):
    %78 = "arith.constant"() <{value = -2 : i16}> : () -> i16
    %79 = "arith.constant"() <{value = 2 : i16}> : () -> i16
    %80 = "arith.constant"() <{value = -2 : i8}> : () -> i8
    %81 = "arith.constant"() <{value = 2 : i8}> : () -> i8
    %82 = "arith.maxsi"(%arg15, %78) : (i16, i16) -> i16
    %83 = "arith.minsi"(%82, %79) : (i16, i16) -> i16
    %84 = "arith.trunci"(%83) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %85 = "arith.cmpi"(%84, %80) <{predicate = 5 : i64}> : (i8, i8) -> i1
    %86 = "arith.cmpi"(%84, %81) <{predicate = 3 : i64}> : (i8, i8) -> i1
    %87 = "arith.andi"(%85, %86) : (i1, i1) -> i1
    "func.return"(%87) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i1, sym_name = "extui_uses_unsigned"}> ({
  ^bb0(%arg14: i32):
    %70 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %71 = "arith.constant"() <{value = 2147483648 : i64}> : () -> i64
    %72 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %73 = "arith.minui"(%arg14, %70) : (i32, i32) -> i32
    %74 = "arith.extui"(%73) : (i32) -> i64
    %75 = "arith.cmpi"(%74, %72) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %76 = "arith.cmpi"(%74, %71) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %77 = "arith.andi"(%75, %76) : (i1, i1) -> i1
    "func.return"(%77) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xindex, 4>) -> (), sym_name = "caller"}> ({
  ^bb0(%arg13: memref<?xindex, 4>):
    "func.call"(%arg13) <{callee = @callee}> : (memref<?xindex, 4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xindex, 4>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg11: memref<?xindex, 4>):
    %67 = "arith.constant"() <{value = 1 : index}> : () -> index
    %68 = "arith.constant"() <{value = 0 : index}> : () -> index
    %69 = "affine.load"(%arg11) <{map = #map}> : (memref<?xindex, 4>) -> index
    "scf.for"(%68, %69, %67) ({
    ^bb0(%arg12: index):
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_i8_bounds"}> ({
    %63 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %64 = "test.with_bounds"() <{smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8}> : () -> i8
    %65 = "arith.addi"(%64, %63) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %66 = "test.reflect_bounds"(%65) : (i8) -> i8
    "func.return"(%66) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_1"}> ({
    %59 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %60 = "test.with_bounds"() <{smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8}> : () -> i8
    %61 = "arith.addi"(%60, %59) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %62 = "test.reflect_bounds"(%61) : (i8) -> i8
    "func.return"(%62) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_wrap1"}> ({
    %55 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %56 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %57 = "arith.addi"(%56, %55) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %58 = "test.reflect_bounds"(%57) : (i8) -> i8
    "func.return"(%58) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_wrap2"}> ({
    %51 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %52 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %53 = "arith.addi"(%52, %51) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %54 = "test.reflect_bounds"(%53) : (i8) -> i8
    "func.return"(%54) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_nowrap"}> ({
    %47 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %48 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %49 = "arith.addi"(%48, %47) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %50 = "test.reflect_bounds"(%49) : (i8) -> i8
    "func.return"(%50) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_wrap1"}> ({
    %43 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %44 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %45 = "arith.subi"(%44, %43) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %46 = "test.reflect_bounds"(%45) : (i8) -> i8
    "func.return"(%46) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_wrap2"}> ({
    %39 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %40 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %41 = "arith.subi"(%40, %39) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %42 = "test.reflect_bounds"(%41) : (i8) -> i8
    "func.return"(%42) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_nowrap"}> ({
    %35 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %36 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %37 = "arith.subi"(%36, %35) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %38 = "test.reflect_bounds"(%37) : (i8) -> i8
    "func.return"(%38) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_mul_i8_wrap"}> ({
    %31 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %32 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %33 = "arith.muli"(%32, %31) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %34 = "test.reflect_bounds"(%33) : (i8) -> i8
    "func.return"(%34) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_mul_i8_nowrap"}> ({
    %27 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %28 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %29 = "arith.muli"(%28, %27) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %30 = "test.reflect_bounds"(%29) : (i8) -> i8
    "func.return"(%30) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_wrap1"}> ({
    %23 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %24 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %25 = "arith.shli"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %26 = "test.reflect_bounds"(%25) : (i8) -> i8
    "func.return"(%26) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_wrap2"}> ({
    %19 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %20 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %21 = "arith.shli"(%20, %19) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %22 = "test.reflect_bounds"(%21) : (i8) -> i8
    "func.return"(%22) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_nowrap"}> ({
    %15 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %16 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : ui8, umin = 10 : i8}> : () -> i8
    %17 = "arith.shli"(%16, %15) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %18 = "test.reflect_bounds"(%17) : (i8) -> i8
    "func.return"(%18) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> index, sym_name = "test_cmpf_propagates"}> ({
  ^bb0(%arg9: f32, %arg10: f32):
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index
    %12 = "arith.cmpf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %13 = "arith.select"(%12, %10, %11) : (i1, index, index) -> index
    %14 = "test.reflect_bounds"(%13) : (index) -> index
    "func.return"(%14) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_trip_loop"}> ({
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%8, %8, %8) ({
    ^bb0(%arg8: index):
      %9 = "index.floordivs"(%arg8, %arg8) : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_trip_loop2"}> ({
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = -1 : index}> : () -> index
    "scf.for"(%5, %5, %6) ({
    ^bb0(%arg7: index):
      %7 = "index.floordivs"(%arg7, %arg7) : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "noninteger_operation_result"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: i1):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "some_fp_op"() : () -> f32
    %2:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %1) ({
    ^bb0(%arg4: index, %arg5: i32, %arg6: f32):
      %4:2 = "some_op"() : () -> (i32, f32)
      "scf.yield"(%4#0, %4#1) : (i32, f32) -> ()
    }) : (index, index, index, i32, f32) -> (i32, f32)
    %3 = "arith.select"(%arg3, %0, %2#0) : (i1, i32, i32) -> i32
    "use"(%3, %2#1) : (i32, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

