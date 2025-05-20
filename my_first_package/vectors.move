module my_first_package::vectors {
    // public fun add_vectors(v1: vector<u8>, v2: vector<u8>): vector<u8> {
    //     let mut result = vector::empty<u8>();
    //     let len = vector::length(&v1);
    //     assert!(len == vector::length(&v2), 0);
    //     let mut i = 0;
    //     while (i < len) {
    //         let sum = vector::borrow(&v1, i) + vector::borrow(&v2, i);
    //         vector::push_back(&mut result, sum);
    //         i = i + 1;
    //     }
    //     result
    // }


    use std::vector;
    use std::debug;

    public fun create_vector(): vector<u64>{
        //empty vector
        let empty_vector: vector<u64> = vector::empty<u64>();

        //vector with initial values
        let initial_vector: vector<u64> = vector[1, 2, 3, 4, 5];

        //return the vector with initial values
        return initial_vector;
    }

    //add elements to a vector
    public fun add_elements_to_vector(v: &mut vector<u64>, element: u64) {
        vector::push_back(v, 6);
        vector::push_back(v, 7);
        vector::push_back(v, 8);
        vector::push_back(v, 9);
    }

    
    //read elements from a vector
    public fun read_elements_from_vector(v: &vector<u64>) {
        // let len = vector::length(v);
        // let mut i = 0;
        // while (i < len) {
        //     let element = vector::borrow(v, i);
        //     // Do something with the element
        //     i = i + 1;
        // }

        let first_element = vector::borrow(v, 0);
        let second_element = vector::borrow(v, 1);

        //print the elements
        debug::print(&first_element);
        debug::print(&second_element);

    }

    #Entry function change the state of the vector but doesn't give you the return.

    //update elements in a vector
    public fun update_elements(v: &mut vector<u64>, index: u64, new_value: u64) {
        // Check if the index is within bounds
        // let len = vector::length(v);
        // assert!(index < len, 0);

        // Update the element at the specified index
        *vector::borrow_mut(v, index) = new_value;
        *vector::borrow_mut(v, 1) = 100;
    }


    //delete elements from a vector
    public fun delete_elements(v: &mut vector<u64>) {
        // Check if the index is within bounds
        let len = vector::length(v);
        assert!(index < len, 0);

        // Remove the element at the specified index
        vector::pop_back(v);
        vector::pop_back(v);
    }

    //et length of a vector
    public fun get_length(v: &vector<u64>) {
        let len = vector::length(v);
        debug::print(&len);
    }


    //check if a vector is empty
    public fun is_empty(v: &vector<u64>) {
        let len = vector::length(v);
        if (len == 0) {
            debug::print(&true);
        } else {
            debug::print(&false);
        }
    }


    //Check if a vector contains an element
    public fun contains_element(v: &vector<u64>, element: u64) {
        let len = vector::length(v);
        let mut found = false;
        let mut i = 0;
        while (i < len) {
            if (vector::borrow(v, i) == element) {
                found = true;
                break;
            }
            i = i + 1;
        }
        debug::print(&found);
    }



}