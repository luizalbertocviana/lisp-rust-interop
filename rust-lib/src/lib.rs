#[no_mangle]
pub extern "C" fn add(x: i64, y: i64) -> i64 {
    x + y
}

#[no_mangle]
pub extern "C" fn hello() -> *const u8 {
    "hello from rust\0".as_ptr()
}

#[repr(C)]
pub struct Point {
    x: i64,
    y: i64,
}

impl Point {
    fn new(x: i64, y: i64) -> Self {
        Self {x, y}
    }
    fn get_x(&self) -> i64 {
        self.x
    }
    fn get_y(&self) -> i64 {
        self.y
    }
}

#[no_mangle]
pub extern "C" fn new_point(x: i64, y: i64) -> *const Point {
    &Point::new(x, y)
}

#[no_mangle]
pub extern "C" fn get_x(p: *const Point) -> i64 {
    unsafe {
        p.as_ref().expect("invalid pointer").get_x()
    }
}

#[no_mangle]
pub extern "C" fn get_y(p: *const Point) -> i64 {
    unsafe {
        p.as_ref().expect("invalid pointer").get_y()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn it_works() {
        assert_eq!(4, add(2, 2));
    }
}
