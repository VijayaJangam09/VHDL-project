`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 09:28:31 AM
// Design Name: 
// Module Name: dc_motor_pwm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dc_motor_pwm(
    input clk,
    input reset,
    input [5:0] dip_sw,
    input fault_n,
    output reg AIN1,
    output reg AIN2,
    output BIN1,
    output BIN2,
    output nsleep,         
    output fault_led
);

    // DIP switch assignments
    wire speed_0   = dip_sw[0];  // SW1: 0% (stop)
    wire speed_25  = dip_sw[1];  // SW2: 75% speed
    wire speed_75  = dip_sw[2];  // SW3: 90% speed  
    wire speed_100 = dip_sw[3];  // SW4: 100% speed
    wire enable    = dip_sw[4];  // SW5: Enable
    wire direction = dip_sw[5];  // SW6: Direction
    
    assign BIN1 = 1'b0;
    assign BIN2 = 1'b0;
    assign nsleep = 1'b1;   // Always enable the driver
    
    // Fault LED (nFAULT is active low, so invert for LED)
    assign fault_led = direction;
    //assign fault_led = enable;
    
    // PWM generation
    reg [14:0] pwm_counter;
    reg [14:0] duty_cycle;
    wire pwm_signal;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            pwm_counter <= 15'd0;
        else
            pwm_counter <= pwm_counter + 1'b1;
    end
    
    // Speed decode  
    always @(*) begin
        if (speed_100)
            duty_cycle = 15'd32767;      // 100%
        else if (speed_75)
            duty_cycle = 15'd24575;      // 75%
        else if (speed_25)
            duty_cycle = 15'd8191;       // 25%
        else
            duty_cycle = 15'd0;          // 0%
    end

//    always @(*) begin
//        if (speed_100)
//            duty_cycle = 15'd32767;      // 100%
//        else if (speed_75)
//            duty_cycle = 15'd29490;      // 90% (was 75%)
//        else if (speed_25)
//            duty_cycle = 15'd24575;      // 75% (was 25%)
//        else
//            duty_cycle = 15'd0;          // 0%
//    end
    
    assign pwm_signal = (pwm_counter < duty_cycle);
    
    // Motor control
    always @(*) begin
        if (!enable || duty_cycle == 15'd0) begin
            AIN1 = 1'b0;
            AIN2 = 1'b0;
        end else if (direction == 1'b0) begin
            AIN1 = pwm_signal;
            AIN2 = 1'b0;
        end else begin
            AIN1 = 1'b0;
            AIN2 = pwm_signal;
        end
    end
endmodule
