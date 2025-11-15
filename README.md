# Project-5
## Student Information
Name: Jaime Yah-Perez Student ID: 008856387 git: https://github.com/JaimeYahPerez/Project-5
## Collaboration and Resources
For this project part, I primarily referenced the provided analysis canvas pages and the part 1 spec page to know what needed to be implemented.<br>
Along with those pages as reference, I also reused the provided example program to do the needed implementations.<br>
Which would lead to the reusing of code for the modified and added files for this implementation of the batch then drain profile. <br>
when it came to troubleshooting compiling errors, chatgpt was once again used to help find errors and missing configurations for execution on CLion.<br>

## Implementation Details
"priority-queue-study\src\harness\main.cpp" <br>
The harness was modified to allow for argumenets to be passed into main(), and to setup the batch_then_drain generator by default. <br>

"priority-queue-study\src\trace-generators\batch_then_drain\main.cpp" <br>
This folder and file was made to as required for the batch then drain profile. Starting by copy and pasting over the code from the huffman generator over to this new main.cpp.<br>
The first needed edit was made to main(), the config path was changed to batch_then_drain and the following two for loops and random seed were kept the same, along with the minimum key. <br>
The max key was changed to be 2^20, utlizing a bitwise left shift operator thanks to the relation between binary and base 2 exponents. 2 << 20 would accurately represent 2^20 without needing a new library. <br>
The previously used function choose_key_upper_bound() was deleted as it was no longer needed. <br>
generateTrace() had a change to the trace generations by simplifying the writing into the output file. Due to the structure of batch then drain, we know all inserts occur before any extracts. Therefore distributions and id's can be done within the first loop. And in the second loop, extract can be rewritten continously for the trace. <br>

"priority-queue-study\csvs\batch_then_drain_profile.csv" <br>
This csv file was made preemptively due to an error occurring during execution, where the program could not locate the file within the folder. <br>

"priority-queue-study\charts\pq_multi_impl_anchor_heap_tooltips.html" <br>
The html file was adjusted to display csv data of a test run of my implemention of batch then drain by default. It was also adjusted to state "batch then drain trace" in the header. <br>

"priority-queue-study\CMakeLists.txt" <br>
A new executable was added for the batch then drain generator.
## Testing and Status

