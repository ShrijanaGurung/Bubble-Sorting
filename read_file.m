%This functon reads the given file and creates a row vector
%based on the data.
%Argument: 
%file_name: The file from which data is extracted.
% 
%Return: 
%return_vector: A row vector that contains 
function return_vector = read_file(file_name)
My_file = fopen(file_name, 'r');  
return_vector = fscanf(My_file, '%f'); %read data
return_vector = return_vector'; %change column vector to row vector
fclose(My_file); 

end