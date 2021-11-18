//====================================================================
//        Copyright (c) 2021 Carsten Wulff Software, Norway
// ===================================================================
// Created       : wulff at 2021-7-21
// ===================================================================
//  The MIT License (MIT)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//====================================================================

//----------------------------------------------------------------
// Model of pixel sensor, including
//  - Reset
//  - The sensor
//  - Comparator
//  - Memory latch
//  - Readout of latched value
//----------------------------------------------------------------
module PIXEL_SENSOR
  (
   input logic      VBN1,
   input logic      RAMP,
   input logic      RESET,
   input logic      CORR,
   input logic      ERASE,
   input logic      EXPOSE,
   input logic      READ,
   input logic      CDS,
   inout [7:0]      DATA,
   inout [7:0]      DATA_CORR,
   input logic[7:0] pixel_value
   );

   real             v_erase = 1.2;
   parameter real   padding = 0.1;
   real             lsb = v_erase/255;
   parameter real   dv_pixel = 0.5;

   real             tmp;
   logic            cmp;
   real             adc;

   // Values related to correlated double sampling
   parameter real   noise_precision = 1000;
   real             offset = ($itor($urandom_range(noise_precision))-(noise_precision/2))*(2*padding)/noise_precision;
   real             lsb_pad = (2*padding)/255;

   logic [7:0]      p_data;
   logic [7:0]      p_data_corr;


   //----------------------------------------------------------------
   // ERASE
   //----------------------------------------------------------------
   // Reset the pixel value on pixRst
   always @(ERASE) begin
      tmp = v_erase - padding + offset;
      p_data = 0;
      p_data_corr = 0;
      cmp  = 0;
      adc = 0;
   end

   //----------------------------------------------------------------
   // SENSOR
   //----------------------------------------------------------------
   // Use bias to provide a clock for integration when exposing
   always @(posedge VBN1) begin
      if(EXPOSE) begin
        tmp = tmp - (pixel_value/255.0)*(lsb-lsb_pad);
      end
   end

   //----------------------------------------------------------------
   // Comparator
   //----------------------------------------------------------------
   // Use ramp to provide a clock for ADC conversion, assume that ramp
   // and DATA are synchronous
   always @(posedge RAMP) begin
      adc = adc + lsb;
      if(adc > tmp)
        cmp <= 1;
   end

   always @(negedge CORR) begin
      cmp  = 0;
      adc = 0;
   end

   //----------------------------------------------------------------
   // Memory latch
   //----------------------------------------------------------------
   always_comb  begin
      if(!cmp) begin
         if (CORR) begin
             p_data_corr = DATA_CORR;
         end else begin
             p_data = DATA;
            if (!CDS) begin
                p_data_corr = DATA_CORR;
            end
         end
      end
   end

   //----------------------------------------------------------------
   // Readout
   //----------------------------------------------------------------
   // Assign data to bus when pixRead = 0
   assign DATA = READ ? p_data : 8'bZ;
   assign DATA_CORR = READ ? p_data_corr : 8'bZ;

endmodule // re_control
