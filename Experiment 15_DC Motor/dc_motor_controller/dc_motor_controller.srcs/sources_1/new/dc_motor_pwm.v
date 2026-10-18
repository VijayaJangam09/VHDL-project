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

//module dc_motor_pwm(
//    input clk,
//    input reset,
//    input [5:0] dip_sw,
//    output AIN1,
//    output AIN2,
//    output reg BIN1,
//    output reg BIN2,
//    output nsleep,
//    output debug_led
//);
    
//    assign AIN1 = 1'b0;
//    assign AIN2 = 1'b0;
//    assign nsleep = 1'b1;
    
//    // INVERT switches (they're active-low with PULLUP, like your stepper)
//    wire speed_0   = ~dip_sw[0];  
//    wire speed_25  = ~dip_sw[1];  
//    wire speed_75  = ~dip_sw[2];  
//    wire speed_100 = ~dip_sw[3];  
//    wire enable    = ~dip_sw[4];  // MUST INVERT!
//    wire direction = ~dip_sw[5];
    
//    assign debug_led = enable;  // Now LED will work
    
//    // PWM generation
//    reg [14:0] pwm_counter;
//    reg [14:0] duty_cycle;
//    wire pwm_signal;
    
//    always @(posedge clk or posedge reset) begin
//        if (reset)
//            pwm_counter <= 15'd0;
//        else
//            pwm_counter <= pwm_counter + 1'b1;
//    end
    
//    // Speed decode  
//    always @(*) begin
//        if (speed_100)
//            duty_cycle = 15'd32767;      // 100%
//        else if (speed_75)
//            duty_cycle = 15'd24575;      // 75%
//        else if (speed_25)
//            duty_cycle = 15'd8191;       // 25%
//        else
//            duty_cycle = 15'd0;          // 0%
//    end
    
//    assign pwm_signal = (pwm_counter < duty_cycle);
    
//    // Motor control
//    always @(*) begin
//        if (!enable || duty_cycle == 15'd0) begin
//            BIN1 = 1'b0;
//            BIN2 = 1'b0;
//        end else if (direction == 1'b0) begin
//            BIN1 = pwm_signal;
//            BIN2 = 1'b0;
//        end else begin
//            BIN1 = 1'b0;
//            BIN2 = pwm_signal;
//        end
//    end
//endmodule


`timescale 1ns / 1ps

module dc_motor_pwm(
    input clk,
    input reset,
    input [5:0] dip_sw,
    output reg AIN1,
    output reg AIN2,
    output BIN1,
    output BIN2,
    output nsleep,         
    output debug_led
);
    // Invert switches for PULLUP (active-low)
    wire speed_0   = ~dip_sw[0];  // SW0: 0% (stop)
    wire speed_25  = ~dip_sw[1];  // SW1: 25% speed
    wire speed_75  = ~dip_sw[2];  // SW2: 75% speed  
    wire speed_100 = ~dip_sw[3];  // SW3: 100% speed
    wire enable    = ~dip_sw[4];  // SW4: Enable
    wire direction = ~dip_sw[5];  // SW5: Direction
    
    assign BIN1 = 1'b0;
    assign BIN2 = 1'b0;
    assign nsleep = 1'b1;
    
    // Debug LED shows enable status
    assign debug_led = enable;
    
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



//`timescale 1ns / 1ps

//module dc_motor_pwm(
//    input clk,
//    input [5:0] dip_sw,
//    output AIN1,
//    output AIN2,
//    output BIN1,
//    output BIN2,
//    output nsleep,
//    output debug_led
//);
    
//    assign nsleep = 1'b1;
//    assign BIN1 = 1'b0;
//    assign BIN2 = 1'b0;
    
//    // Invert switches
//    wire enable = ~dip_sw[4];
//    wire direction = ~dip_sw[5];
//    wire [1:0] speed = ~dip_sw[1:0];
    
//    assign debug_led = enable;
    
//    // Clock divider for speed control
//    reg [15:0] clk_div = 0;
    
//    always @(posedge clk) begin
//        clk_div <= clk_div + 1;
//    end
    
//    // Create speed signals (simple on/off, not PWM)
//    wire speed_signal;
    
//    assign speed_signal = (speed == 2'b00) ? 1'b1 :           // 100% (always on)
//                          (speed == 2'b01) ? clk_div[10] :    // ~50% 
//                          (speed == 2'b10) ? clk_div[12] :    // ~25%
//                                             clk_div[14];      // ~12.5%
    
//    // Motor control
//    assign AIN1 = enable & speed_signal & ~direction;
//    assign AIN2 = enable & speed_signal & direction;
    
//endmodule