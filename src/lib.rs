#![feature(proc_macro, specialization)]

extern crate pyo3;
use pyo3::{Python, PyResult, PyModule, PyDict};

use pyo3::py::modinit as pymodinit;

/// Module documentation string
#[pymodinit(pycrust)]
fn init_module(py: Python, m: &PyModule) -> PyResult<()> {

    #[pyfn(m, "run_me")]
    fn run(params: &PyDict) -> PyResult<()> {
        println!("You are calling me from Python!");
        for key in params.keys() {
            let value = params.get_item(key);
            println!("Key {} = Value {:#?}", key, value.unwrap());
        }

        Ok(())
    }

    Ok(())
}
