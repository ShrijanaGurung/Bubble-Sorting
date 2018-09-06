%The program reads the given data.txt file or any provided, uses bubblesort to sort the
%values within the file and created a movie of the bubblesort data plot.
%The created movie plot potraits the bubble sort movement.
%Arguments: A file with numerical data (dimension: 1 * n) is required for this program.

clear; clc; close all; %clear any data from command line, close any open windows
file_name = 'data.txt'; %default file for sorting if no file is provided by user

user_response = input('Would you like to enter a file name for bubble sorting Y or N? ', 's');
if ( strcmp(user_response, 'Y') | strcmp(user_response, 'y') )
    file_name = input('Enter a valid filename with extension. ', 's');
    %check if the supplied file exists
    while (exist(file_name) ~= 2)
        file_name = input('File not found! Enter a valid filename with extension. ', 's');
    end
end

sample_row_sort = read_file(file_name); %read data from the given file

swap = 1; %swap value is 1 when swap is made and 0 is no swap is made
[m, total] = size(sample_row_sort); %obtain the total number of elements in the vector.
%the following min and max data are evaulated for plotting graph limits
min_sample = round(min(sample_row_sort));
max_sample = round(max(sample_row_sort));

%setting up animated movie for the bubble sorting
%%movie turning on and frame site
movie_on = 1;
movie_steps = 30;
%%set up movie
if movie_on == 1;
    aviobj = VideoWriter('mymovie.avi', 'Uncompressed AVI');
    aviobj.FrameRate = 10; % frame rate in frame/sec
    open(aviobj); %now opening the avi object
end

%sorting process starts here
while swap == 1
    %before iterating through all elements the value of swap is changed to 0
    %since no swap is made yet
    swap = 0;
    for i = 1: total - 1 
        if (sample_row_sort(i+1) < sample_row_sort(i))
            % if the conditon is met the values are swapped
            sample_row_sort = swap_value(sample_row_sort, i);
            swap = 1; %swap value changed
            
        end %if (sample_row_sort(i+1) < sample_row_sort(i))
        
        %plot new positions for the elements after each while loop
        %and record it as a movie
        if mod(i, movie_steps) == 0 && movie_on == 1;
                plot([0, total], [min_sample, max_sample]);
                hold on;
                myplot = plot(sample_row_sort,'m*');
                ylabel('element values');
                xlabel('elements position of sample row data');
                title('Bubble sorting for sample row sort data');
                %axis([0, duration, 0, 100]);
                hold off;
                frame = getframe(gcf); %capture current image
                writeVideo(aviobj, frame);
        end %if mod(i, movie_steps) == 0 && movie_on == 1;
        
    end %for i = 1: total - 1 
    
end %while

%close the movie
if movie_on == 1;
    close(aviobj);
end