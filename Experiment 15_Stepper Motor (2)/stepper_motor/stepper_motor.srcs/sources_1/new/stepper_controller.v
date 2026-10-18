`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 02:43:44 PM
// Design Name: 
// Module Name: stepper_controller
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

`timescale 1ns / 1ps

module stepper_test(
    input clk,                     // System clock
    input [5:0] dip_sw,            // DIP switches used for speed, enable, and direction control
    output reg AIN1,               // Motor driver coil control signal AIN1
    output reg AIN2,               // Motor driver coil control signal AIN2
    output reg BIN1,               // Motor driver coil control signal BIN1
    output reg BIN2,               // Motor driver coil control signal BIN2
    output nsleep,                 // Sleep control for motor driver
    output debug_led               // LED used for debugging enable status
);
    
    // Keep motor driver awake (not in sleep mode)
    assign nsleep = 1'b1;
    
    // DIP switches have pull-up resistors, so invert them so ON = logic 1
    wire speed_slowest = ~dip_sw[0];  // SW0 ON selects slowest speed
    wire speed_slow    = ~dip_sw[1];  // SW1 ON selects slow speed
    wire speed_fast    = ~dip_sw[2];  // SW2 ON selects fast speed
    wire speed_fastest = ~dip_sw[3];  // SW3 ON selects fastest speed
    wire enable        = ~dip_sw[4];  // SW4 ON enables motor rotation
    wire direction     = ~dip_sw[5];  // SW5 ON sets reverse direction
    
    // Counter used to create delay between motor steps
    reg [24:0] counter = 0;
    
    // Tracks the current step in the motor stepping sequence
    reg [1:0] step_state = 0;
    
    // Variable storing how long to wait between steps
    reg [24:0] step_period;
    
    // LED indicates whether the motor is enabled
    assign debug_led = enable;
    
    // ================= SPEED SELECTION =================
    // Select the stepping speed depending on which DIP switch is active
    always @(*) begin
        if (speed_fastest)
            step_period = 25'd500000;      // Fastest speed (~100 steps/sec)
        else if (speed_fast)
            step_period = 25'd1048575;     // Fast speed (~48 steps/sec)
        else if (speed_slow)
            step_period = 25'd2500000;     // Slow speed (~20 steps/sec)
        else if (speed_slowest)
            step_period = 25'd25000000;    // Slowest speed (~2 steps/sec)
        else
            step_period = 25'd25000000;    // Default speed if none selected
    end
    
    // ================= STEP TIMING =================
    // Counter generates delays between each step
    always @(posedge clk) begin
        if (enable) begin                    // Only step motor if enabled
            if (counter >= step_period) begin
                counter <= 0;                // Reset counter after delay
                
                // Advance or reverse stepping sequence depending on direction
                if (direction)
                    step_state <= step_state - 1;
                else
                    step_state <= step_state + 1;
                    
            end else begin
                counter <= counter + 1;      // Continue counting delay
            end
        end else begin
            counter <= 0;                   // Reset when motor disabled
            step_state <= 0;                // Reset step sequence
        end
    end
    
    // ================= FULL STEP SEQUENCE =================
    // Control the four motor driver outputs to energize coils in sequence
    always @(*) begin
        if (enable) begin
            case(step_state)
                2'd0: begin AIN1=1'b1; AIN2=1'b0; BIN1=1'b0; BIN2=1'b1; end
                2'd1: begin AIN1=1'b1; AIN2=1'b0; BIN1=1'b1; BIN2=1'b0; end
                2'd2: begin AIN1=1'b0; AIN2=1'b1; BIN1=1'b1; BIN2=1'b0; end
                2'd3: begin AIN1=1'b0; AIN2=1'b1; BIN1=1'b0; BIN2=1'b1; end
                
// Alternative stepping pattern (commented out for reference)
//              2'd0: begin AIN1=1'b1; AIN2=1'b0; BIN1=1'b1; BIN2=1'b0; end
//              2'd1: begin AIN1=1'b1; AIN2=1'b0; BIN1=1'b0; BIN2=1'b1; end
//              2'd2: begin AIN1=1'b0; AIN2=1'b1; BIN1=1'b0; BIN2=1'b1; end
//              2'd3: begin AIN1=1'b0; AIN2=1'b1; BIN1=1'b1; BIN2=1'b0; end
            endcase
        end else begin
            // If motor disabled, turn off all coils
            AIN1 = 1'b0;
            AIN2 = 1'b0;
            BIN1 = 1'b0;
            BIN2 = 1'b0;
        end
    end
    
endmodule