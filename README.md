# EE314-Term-Project
In this project, we were asked to design and implement a basic Quality of Service (QoS) network on FPGA using Verilog. There are 4 buffers each data can go through. A reading is made from these buffer contents according to an algorithm that obeys a predefined latency and reliability precedence requirement. The input data is a 4-bit sequence where first two bits indicate which buffer it belongs to and the last two bits indicate its content. Also, we display the whole process on a VGA screen. 


For this purpose, we wrote total of 5 modules on Verilog. [collect_input.v](https://github.com/semanuravsar/EE314-Term-Project/blob/main/collect_input.v) for collecting the input, [buffer_dist3.v](https://github.com/semanuravsar/EE314-Term-Project/blob/main/buffer_dist3.v) to store and update the buffer contents, [read_data_m.v](https://github.com/semanuravsar/EE314-Term-Project/blob/main/read_data_m.v) to perform the reading algorithm, [VGA_P.v](https://github.com/semanuravsar/EE314-Term-Project/blob/main/VGA_P.v) to display everything on the VGA screen, and finally, [MainModule.v](https://github.com/semanuravsar/EE314-Term-Project/blob/main/MainModule.v) to connect the modules. The project definition can be found in the [Project_Description](https://github.com/semanuravsar/EE314-Term-Project/blob/main/Project_Description.pdf) file. More detailed information on our implementation can be found on our [Term Project Report](https://github.com/semanuravsar/EE314-Term-Project/blob/main/EE314_Term_Project_Report.pdf).

Here is a working photo of our VGA screen


![link | width=10](https://user-images.githubusercontent.com/97013338/180616437-fa308479-4938-4cb1-8a2d-28c1f9a07e4e.jpeg)
