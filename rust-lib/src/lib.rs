#[no_mangle]
pub extern "C" fn add(x: i64, y: i64) -> i64 {
    x + y
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
