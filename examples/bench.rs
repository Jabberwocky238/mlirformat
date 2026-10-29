//! Parse / print timings against `mlir-opt` (BENCHMARK.md).
//!
//! `cargo run --release --example bench -- [--reps N] FILE...`; `$MLIR_OPT` is the `mlir-opt` to
//! compare with (22.1.8). A file is cut at `// -----` as `--split-input-file` does. mlirformat
//! runs in process on one thread: parse with [`MlirOpt::upstream`], print custom (upstream) and
//! generic ([`MlirOpt::new`]). `mlir-opt` runs as a process (startup included, measured on an
//! empty input), threading off, unregistered ops allowed, printing to /dev/null: as is, and with the parse-time verifier off.

use std::process::{Command, Stdio};
use std::time::{Duration, Instant};

use mlirformat::MlirOpt;

struct Bench {
    reps: usize,
    tool: String,
    upstream: MlirOpt,
    bare: MlirOpt,
}

impl Bench {
    fn best(&self, mut f: impl FnMut() -> Duration) -> Duration {
        (0..self.reps).map(|_| f()).min().unwrap_or_default()
    }

    fn mlir_opt(&self, file: &str, extra: &[&str]) -> Duration {
        self.best(|| {
            let t = Instant::now();
            let ok = Command::new(&self.tool)
                .args([file, "--split-input-file", "--allow-unregistered-dialect", "--mlir-disable-threading", "-o", "/dev/null"])
                .args(extra)
                .stderr(Stdio::null())
                .status()
                .is_ok_and(|s| s.success());
            assert!(ok, "{} {file} {extra:?} failed", self.tool);
            t.elapsed()
        })
    }

    fn file(&self, file: &str) {
        let src = std::fs::read_to_string(file).unwrap_or_else(|e| panic!("{file}: {e}"));
        let chunks: Vec<_> = src.split("// -----").map(|c| c.trim_start_matches('-')).collect();
        let parse = self.best(|| {
            let t = Instant::now();
            for c in &chunks {
                self.upstream.parse(c).unwrap_or_else(|e| panic!("{file}: {e}"));
            }
            t.elapsed()
        });
        let modules: Vec<_> = chunks.iter().map(|c| self.upstream.parse(c).unwrap()).collect();
        let print = |opt: &MlirOpt| {
            self.best(|| {
                let t = Instant::now();
                let n: usize = modules.iter().map(|m| opt.show(m).to_string().len()).sum();
                std::hint::black_box(n);
                t.elapsed()
            })
        };
        let (custom, generic) = (print(&self.upstream), print(&self.bare));
        let empty = std::env::temp_dir().join("mlirformat-bench-empty.mlir");
        std::fs::write(&empty, "").unwrap();
        let startup = self.mlir_opt(empty.to_str().unwrap(), &[]);
        let unsafe_parse = ["--mlir-very-unsafe-disable-verifier-on-parsing"];
        let opt_custom = self.mlir_opt(file, &[]);
        let opt_generic = self.mlir_opt(file, &["--mlir-print-op-generic"]);
        let opt_noverify = self.mlir_opt(file, &unsafe_parse);
        let ms = |d: Duration| d.as_secs_f64() * 1e3;
        println!(
            "{file}: {} chunks, {} lines, {:.1} MB",
            chunks.len(),
            src.lines().count(),
            src.len() as f64 / 1e6
        );
        println!(
            "  mlirformat  parse {:8.1}  print custom {:8.1}  print generic {:8.1}  parse+custom {:8.1}",
            ms(parse),
            ms(custom),
            ms(generic),
            ms(parse + custom)
        );
        println!(
            "  mlir-opt    custom {:8.1}  generic {:8.1}  custom, no parse verifier {:8.1}  (startup {:.1})",
            ms(opt_custom),
            ms(opt_generic),
            ms(opt_noverify),
            ms(startup)
        );
    }
}

fn main() {
    let mut args: Vec<String> = std::env::args().skip(1).collect();
    let reps = match args.iter().position(|a| a == "--reps") {
        Some(i) => args.drain(i..=i + 1).nth(1).and_then(|n| n.parse().ok()).expect("--reps N"),
        None => 5,
    };
    let tool = std::env::var("MLIR_OPT").unwrap_or_else(|_| "mlir-opt".into());
    let bench = Bench { reps, tool, upstream: MlirOpt::upstream(), bare: MlirOpt::new() };
    for f in &args {
        bench.file(f);
    }
}
