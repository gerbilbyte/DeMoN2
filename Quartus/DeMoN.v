`timescale 1ns / 1ps

//DeMoN logic code written by REbEL and na103
//adapted from the original Action Replay MK III GAL logic equations
//version 1.0

module DeMoN(               //                     HANDLED
                            // PIN NAME    TYPE    BY      DESCRIPTION            
                            // --- -------  ------- ------- --------------------------  
  input a1,                 // 4   A1
  input a2,                 // 5   A2
  input a3,                 // 6   A3
  input a4,                 // 8   A4
  input a5,                 // 9   A5
  input a6,                 // 10  A6
  input a7,                 // 11  A7
  input a8,                 // 12  A8
  input a9,                 // 14  A9
  input a10,                // 15  A10
  input a11,                // 16  A11
  input a12,                // 17  A12
  input a13,                // 18  A13
  input a14,                // 20  A14
  input a15,                // 21  A15
  input a16,                // 22  A16
  input a17,                // 23  A17
  input a18,                // 24  A18
  input a19,                // 25  A19
  input a20,                // 81  A20
  input a21,                // 80  A21
  input a22,                // 79  A22 
  input a23,                // 77  A23
  input slomosw,            // 55  slomosw
  input sw1,                // 33  sw1
  input jp1,                // 29  jp1
  input jp2,                // 30  jp2
  input slomotick,          // 31  slomotick
  input fc0,                // 27  fc0
  input fc1,                // 28  fc1
  input lds,                // 35  lds
  input uds,                // 36  uds
  input as,                 // 37  as
  output oe,                // 39  oe
  inout reg d0,             // 40  d0
  inout reg d1,             // 41  d1
  input r_w,                // 44  r_w
  input rst,                // 45  rst
  output ipl0,              // 46  ipl0
  output ipl1,              // 48  ipl1
  output ipl2,              // 49  ipl2
  inout hlt,                // 50  hlt
  output romce1,            // 51  romce1
  output romce2,            // 52  romce2
  output ramce1,            // 54  ramce1
  output ramce2,            // 34  ramce2
  output reg nmivec,        // 56  nmivec
  output reg ovrdrive,      // 57 ovr drive
  output ovr,               // 58  ovr
  output dtack,             // 60  dtack
  output reg u3o13,         // 73  u3o13
  output reg trigger,       // 74  trigger
  output reg runningflag,   // 75  runningflag
  output reg cause0,        // 76  cause0
  output reg cause1,        // 67  cause1
  output reg bfe001triggering,  // 68  bfe001triggering
  output reg bfd100triggering,  // 69  bfd100triggering
  output iack,              // 70  iack
  output ft_wr,             // 61  ft_rw
  output ft_rd,             // 62  ft_rd
  input ft_txe,             // 63  ft_txe
  input ft_rxf,             // 64  ft_rxf
  output ft_siwu            // 65  ft_siwu
  
);

  //ciaa pra register (used to trigger DeMoN) 
  wire addrbfe001 = a23 & !a22 & a21 & a20 & a19 & a18 & a17 & a16 & a15 & a14 & a13 & !a12 & !a11 & !a10 & !a9 & !a8 & !a7 & !a6 & !a5 & !a4 & !a3 & !a2 & !a1;

  //ciab prb register (used to trigger DeMoN)
  wire addrbfd100 = a23 & !a22 & a21 & a20 & a19 & a18 & a17 & a16 & a15 & a14 & !a13 & a12 & !a11 & !a10 & !a9 & a8 & !a7 & !a6 & !a5 & !a4 & !a3 & !a2 & !a1;

  //address 8 (triggers DeMoN on reset)
  wire addr000008 = !a23 & !a22 & !a21 & !a20 & !a19 & !a18 & !a17 & !a16 & !a15 & !a14 & !a13 & !a12 & !a11 & !a10 & !a9 & !a8 & !a7 & !a6 & !a5 & !a4 & a3 & !a2 & !a1;
  
  //a80000-abffff (DeMoN ROM space)
  wire romaddr = a23 & !a22 & a21 & !a20 & a19 & !a18;
  
  //ac0000-bbffff (DeMoN RAM space)
  wire ramaddr = (a23 & !a22 & a21 & !a20 & a19 & a18) | (a23 & !a22 & a21 & a20 & !a19) | (a23 & !a22 & a21 & a20 & a19 & !a18);

  //a80000 (DeMoN hardware register)
  wire arReg = a23 & !a22 & a21 & !a20 & a19 & !a18 & !a17 & !a16 & !a15 & !a14 & !a13 & !a12 & !a11 & !a10 & !a9 & !a8 & !a7 & !a6 & !a5 & !a4 & !a3 & !a2 & !a1;

  //dff000-dff1ff (Amiga custom chips)
  wire addrdffxxx = a23 & a22 & !a21 & a20 & a19 & a18 & a17 & a16 & a15 & a14 & a13 & a12;

  //$bbfff0 (DeMoN usb serial data register)
  wire usbreg1 = a23 & !a22 & a21 & a20 & a19 & !a18 & a17 & a16 & a15 & a14 & a13 & a12 & a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4 & !a3 & !a2 & !a1;

  //$bbfff2 (DeMoN usb serial status register)
  wire usbreg2 = a23 & !a22 & a21 & a20 & a19 & !a18 & a17 & a16 & a15 & a14 & a13 & a12 & a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4 & !a3 & !a2 & a1;

  //$bbfff0-$bbffff (DeMoN register area, allowing for future expansion
  wire addrbbfffx = a23 & !a22 & a21 & a20 & a19 & !a18 & a17 & a16 & a15 & a14 & a13 & a12 & a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4;

  
  initial nmivec = 1'b1;
  initial u3o13 = 1'b1;
  initial trigger = 1'b1;       //when it goes low it triggers the cart
  initial runningflag = 1'b1;   //indicates the cart is currently running code
                                //from the cart ROM or RAM area
  
  initial cause0 = 1'b1;        //cause0 and cause1 record the mechanism by which
  initial cause1 = 1'b1;        //the DeMoN was triggered and this value is accessed
                                //by reading the arReg hardware register
  
  initial bfe001triggering = 1'b1;    //this determines if reading from address $bfe001 causes
                                      //the cart to be triggered. This is used by breakpoints
                                      //tracing etc..
                           
  initial bfd100triggering = 1'b1;    //this determines if writing to address $bfd100 causes
                                      //the cart ot be triggered. This is used by some of the
                                      //options such as disk coding
  
  always @(*) begin
  
    
    u3o13 = (!trigger | (rst & !u3o13) | (hlt & !u3o13)) ? 1'b0 : 1'b1;
    
    
    trigger = 
            //trigger on NMI if we are not already executing code from the DeMoN ROM/RAM
            ((!sw1 & runningflag & !jp2) |

            //trigger on read of $bfee01 if it is enabled and we are not already executing code from the DeMoN ROM/RAM
            (addrbfe001 & !oe & !lds & !as & !bfe001triggering & runningflag & !jp2) |

            //trigger on write to $bfd100 if it is enabled and we are not already executing code from the DeMoN ROM/RAM
            (addrbfd100 & !uds & oe &  !as & !bfd100triggering & runningflag & !jp2) |

            //trigger on write of address 8 following a reset
            (addr000008 & u3o13 & !as & runningflag & !jp2) |

            //reset clears triggering flag
            (rst & !fc0 & !trigger) |
            (hlt & !fc0 & !trigger) |
            (rst & iack & !trigger) |
            (hlt & iack & !trigger) |
            (rst & as & !trigger) |
            (hlt & as & !trigger)) ? 1'b0 : 1'b1; 
    
    //is the cart running (controls if the DeMoN ROM/RAM/Registers can be seen)
    runningflag =
            //cart is currently being triggered
            (!trigger |

            //accesing the DeMoN ROM/Flash
            (romaddr & rst & hlt & !runningflag) |
            
            //accesing the DeMoN RAM
            (ramaddr & rst & hlt & !runningflag) |

            //reset clears running flag
            (rst & as & !runningflag) |
            (hlt & as & !runningflag) |
            (rst & fc0 & !runningflag) |
            (hlt & fc0 & !runningflag)) ? 1'b0 : 1'b1;

    if (runningflag)  
     //update cause0 and cause1 based on what triggerd the device
     if (!sw1) begin
      cause0 = 1'b0;
      cause1 = 1'b0;
     end else if (addrbfe001 & !oe & !lds & !as) begin
      cause0 = 1'b0;
      cause1 = 1'b1;
     end else if (addrbfd100  & oe & !uds & !as) begin
      cause0 = 1'b1;
      cause1 = 1'b0;
     end else begin
      cause0 = 1'b1;
      cause1 = 1'b1;
     end

    //are we writing to the arReg hardware register?    
    if ((arReg & oe & !as & !runningflag) | !rst) begin
        //enable/disable these two based on the value written
        bfd100triggering = !rst ? 1'b1 : d0 ? 1'b0: 1'b1;
        bfe001triggering = !rst ? 1'b1 : d1 ? 1'b0: 1'b1;
    end
  
    //precise triggering of the OVR to ensure it is enabled
    //exactly when the CPU is reading from the NMI interrupt vector
    nmivec = (!trigger | (!nmivec & !fc1) | (!nmivec & fc0) | (!nmivec & !r_w)) ? 1'b0 : 1'b1;  
    ovrdrive = (!nmivec & fc0 & !fc1 & r_w & !as & trigger) ? 1'b0 : 1'b1;

    //are we reading from the arReg hardware register?    
    if (arReg & !oe & !as & !runningflag) begin
      //return the cause of the trigger
      d0 = !cause1 ? 1'b0 : 1'b1;
      d1 = !cause0 ? 1'b0 : 1'b1;   
    //are we reading from the usb serial status register
    end else if (usbreg2 & !oe & !as & !runningflag) begin
      //return the current read and write status
      d0 = !ft_txe ? 1'b0 : 1'b1;
      d1 = !ft_rxf ? 1'b0 : 1'b1;
    end else
    begin
      //otherwise leave d0,d1 floating
      d0 = 1'bz;
      d1 = 1'bz;
    end
  end

  //chip enable flag for the ROM/Flash chip
  assign  romce1 = ((romaddr & !arReg & !as & !lds & !runningflag) |
              (romaddr & !arReg & !as & !lds & jp1) |
              (!ovrdrive & !as & !lds)) ? 1'b0 : 1'b1;
  
  //chip enable flag for the ROM/Flash chip
  assign  romce2 = ((romaddr & !arReg & !as & !uds & !runningflag) |
              (romaddr & !arReg & !as & !uds & jp1) |
              (!ovrdrive & !as & !uds)) ? 1'b0 : 1'b1;
  
  //chip enable flag for the RAM
  assign  ramce1 = ((addrdffxxx & oe & !as & !lds) |
              (ramaddr & !addrbbfffx & !as & !lds & !runningflag) |
              (ramaddr & !addrbbfffx & !as & !lds & jp1)) ? 1'b0 : 1'b1;
              
  
  //chip enable flag for the RAM
  assign  ramce2 = ((addrdffxxx & oe & !as & !uds) |
              (ramaddr & !addrbbfffx & !as & !uds & !runningflag) |
              (ramaddr & !addrbbfffx & !as & !uds & jp1)) ? 1'b0 : 1'b1;

  //output enable for Flash and RAM chips
  assign oe = r_w ? 1'b0 : 1'b1;

  //trigger send immediate when usb serial status register is written to
  assign ft_siwu = usbreg2 & oe & !as & !lds & !runningflag ? 1'b0 : 1'b1;
  
  //detects a write to the usb serial data register
  assign ft_wr = usbreg1 & oe & !as & !lds & !runningflag ? 1'b0 : 1'b1;
  
  //detects a read from the usb serial data register
  assign ft_rd = usbreg1 & !oe & !as & !runningflag ? 1'b0 : 1'b1;
  

  //slomo triggers hlt
  assign hlt = (slomotick & !slomosw & runningflag) ? 1'b0 : 1'bz;
  
  //ipl combined trigger the NMI
  assign ipl0 = !trigger ? 1'b0 : 1'bz;
  assign ipl1 = !trigger ? 1'b0 : 1'bz;
  assign ipl2 = !trigger ? 1'b0 : 1'bz;

  //detects the interrupt acknowledge cycle of the cpu
  //after the nmi has been triggered
  assign iack = (a3 & a2 & fc1 & a1) ? 1'b0 : 1'b1;
  
  //OVR is used during the triggering of the cart in order map the
  //cart ROM into addresses 0-3ffff so we can divert the
  //NMI interrupt vector to the cart ROM
  assign ovr = ( !ovrdrive | ((romaddr | ramaddr) & !as )) ? 1'b0 : 1'bz;
  
  //dtack is required when ovr is asserted
  assign dtack = ((!ovr & !romce1) | (!ovr & !romce2) | (!ovr & !ramce1) | (!ovr & !ramce2) | (!ovr & !arReg) | (!ovr & !addrbbfffx)) ? 1'b0 : 1'bz;
  
endmodule
