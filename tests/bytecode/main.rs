use std::fs;
use std::path::{Path, PathBuf};

use mlirformat::{Bytecode, Item, MlirOpt};

fn dir() -> PathBuf {
    std::env::var_os("MLIRBC_DIR").map_or_else(|| Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/bytecode/fixtures"), PathBuf::from)
}

/// Every `.mlirbc` here is what `mlir-opt --emit-bytecode` (23.1.5) wrote for the `.in.mlir`
/// beside it (generic form, every location spelled out).
#[test]
fn writes_as_mlir_opt() {
    let opt = MlirOpt::upstream();
    let filter = std::env::var("FILTER").ok();
    let mut stems: Vec<String> = fs::read_dir(dir()).unwrap().filter_map(|e| e.ok()?.file_name().into_string().ok()?.strip_suffix(".mlirbc").map(str::to_owned)).collect();
    stems.sort();
    let bytecode = Bytecode::default();
    let (mut exact, mut failed) = (0, Vec::new());
    for stem in stems.iter().filter(|s| filter.as_deref().is_none_or(|f| s.contains(f))) {
        let want = fs::read(dir().join(format!("{stem}.mlirbc"))).unwrap();
        let text = fs::read_to_string(dir().join(format!("{stem}.in.mlir"))).unwrap();
        let got = opt.parse(&text).map_err(|e| e.to_string()).and_then(|m| {
            let op = m.items.into_iter().find_map(|i| if let Item::Op(o) = i { Some(o) } else { None }).ok_or("no op")?;
            bytecode.write(&op).map_err(|e| e.0)
        });
        match got {
            Ok(got) if got == want => exact += 1,
            Ok(got) => {
                if std::env::var_os("SHOW").is_some() {
                    let out = Path::new(env!("CARGO_MANIFEST_DIR")).join("target/mlirbc-got");
                    fs::create_dir_all(&out).unwrap();
                    fs::write(out.join(format!("{stem}.mlirbc")), &got).unwrap();
                }
                let at = (0..).find(|i| got.get(*i) != want.get(*i)).unwrap();
                failed.push(format!("{stem}: byte {at}: mlir-opt {:02x?}, ours {:02x?} ({} vs {} bytes)", want.get(at), got.get(at), want.len(), got.len()));
            }
            Err(e) => failed.push(format!("{stem}: {e}")),
        }
    }
    eprintln!("{exact} of {} write byte for byte", exact + failed.len());
    /// Modules written byte for byte; the rest use the llvm dialect's own encodings, floats of
    /// fewer than eight bits or `f8E8M0FNU`, resources, or string elements of a dialect type
    const FLOOR: usize = 2243;
    assert!(filter.is_some() || std::env::var_os("MLIRBC_DIR").is_some() || exact >= FLOOR, "{exact} written byte for byte, fewer than {FLOOR}");
    for f in &failed {
        eprintln!("  {f}");
    }
    assert!(Bytecode::recognizes(&fs::read(dir().join(format!("{}.mlirbc", stems[0]))).unwrap()));
}

/// Each `.mlirbc` read back prints as its `.in.mlir` does, and writes back to the same bytes
#[test]
fn reads_as_mlir_opt() {
    let opt = MlirOpt::upstream();
    let plain = MlirOpt::default();
    let filter = std::env::var("FILTER").ok();
    let mut stems: Vec<String> = fs::read_dir(dir()).unwrap().filter_map(|e| e.ok()?.file_name().into_string().ok()?.strip_suffix(".mlirbc").map(str::to_owned)).collect();
    stems.sort();
    let bytecode = Bytecode::default();
    let (mut exact, mut round, mut failed) = (0, 0, Vec::new());
    for stem in stems.iter().filter(|s| filter.as_deref().is_none_or(|f| s.contains(f))) {
        let bytes = fs::read(dir().join(format!("{stem}.mlirbc"))).unwrap();
        let text = fs::read_to_string(dir().join(format!("{stem}.in.mlir"))).unwrap();
        let want = plain.show(&opt.parse(&text).unwrap()).to_string();
        let got = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| Bytecode::read(&bytes))).map_err(|_| String::from("panicked")).and_then(|r| r.map_err(|e| e.0));
        match got {
            Ok(op) => {
                if bytecode.write(&op).is_ok_and(|b| b == bytes) {
                    round += 1;
                }
                let got = plain.show(&mlirformat::Module { items: vec![Item::Op(op)] }).to_string();
                if got == want {
                    exact += 1;
                } else {
                    let line = got.lines().zip(want.lines()).position(|(a, b)| a != b).unwrap_or(0);
                    failed.push(format!("{stem}: line {}: ours `{}` / mlir-opt `{}`", line + 1, got.lines().nth(line).unwrap_or("").trim(), want.lines().nth(line).unwrap_or("").trim()));
                }
            }
            Err(e) => failed.push(format!("{stem}: {e}")),
        }
    }
    eprintln!("{exact} of {} read as mlir-opt prints them, {round} written back byte for byte", exact + failed.len());
    /// Modules read as printed, and read then written back to the same bytes; the rest use what
    /// the writer leaves out, two print `distinct` ids or a calibrated bound otherwise
    const READ_FLOOR: usize = 2245;
    const ROUND_FLOOR: usize = 2243;
    let all = filter.is_none() && std::env::var_os("MLIRBC_DIR").is_none();
    assert!(!all || exact >= READ_FLOOR, "{exact} read as printed, fewer than {READ_FLOOR}");
    assert!(!all || round >= ROUND_FLOOR, "{round} written back, fewer than {ROUND_FLOOR}");
    for f in &failed {
        eprintln!("  {}", &f[..f.len().min(300)]);
    }
}
