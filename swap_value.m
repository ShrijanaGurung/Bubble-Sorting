 %swap_value is a function that takes an vector and position of the current item
 %in the sample_row_sort vector; Then swap its position with the
 %succeeding item in the vector and returns the swapped vector.
 %Arguments:
 %current_vector: the vector from which values are being swapped
 %position: element position in a vector 
 %
 %Return:
 %return_vector: a vector whose value at a given position has been swapped
 % with its succeeding element.
function return_vector = swap_value(current_vector, position)
    return_vector = current_vector;
    return_vector(position) = current_vector(position + 1);
    return_vector(position + 1) = current_vector(position);
end