module functionexample::functionexample{
    // 1. basic function example with no parameters and no return value
    // public fun basic_function(){};

    
    // 2. basic function example with parameters and return value
    public fun add(a: u64, b: u64): u64 {
        private_function(a, b)
    }

    // 3. function with multiple parameters and return value 
    public fun calculator(a: u64, b: u64): (u64, u64, u64,  u64) {
        // let sum = a + b;
        // let diff = a - b;
        // let prod = a * b;
        // let div = a / b;
        // return (sum, diff, prod, div);
        (
            a + b,
            a - b,
            a * b,
            a / b
        )
    }

    // 4 . private function (not accessible outside the module)
    fun private_function(a: u64, b: u64): u64 {
        return a * b
    }

    // 5. function with early return
    public fun find_minimum(a: u64, b: u64): u64 {
        if (a < b) {
            return a
        }else {
            return b
        }
    }


    // 6. function making use of the return values
    public fun divmod(abort_code: u64, a: u64, b: u64): (u64, u64) {
        // assert(b != 0, 0);
        // let q = a / b;
        // let r = a % b;
        // (q, r)
        if (b == 0) {
            abort abort_code
        };
        let q: u64 = a / b;
        let r = a % b;
        (q, r)
    }


    #[test]
    public fun test_add() {
        let result = add(5, 10);
        assert!(result == 50);
    }

    #[test]
    public fun test_calculator() {
        let (sum, diff, prod, div) = calculator(10, 5);
        assert!(sum == 15);
        assert!(diff == 5);
        assert!(prod == 50);
        assert!(div == 2);
    }   


    #[test]
    public fun test_divmod(){
        let (q, r) = divmod(0, 9, 3);
        assert!(q == 3);
        assert!(r == 0);
    }

}
