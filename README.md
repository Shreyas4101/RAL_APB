##RAL
This design describes an APB slave interface containing five registers that can be accessed through standard APB protocol signals. 
The interface receives inputs such as pclk, presetn, psel, penable, pwrite, pwdata[31:0], and paddr[31:0], and drives prdata[31:0] as output data during read operations.
 The register set includes a 4-bit control register at offset 0x00 with a reset value of 0x0, followed by four 32-bit registers: reg1 at offset 0x04 (reset value 0xA5A5_0000), reg2 at offset 0x08 (reset value 0x1234_9876), reg3 at offset 0x0C (reset value 0x5A5A_5555), and reg4 at offset 0x10 (reset value 0x0000_FFFF). 
All registers are configured as read/write (RW), allowing both modification and retrieval of their contents via APB transactions. 
The design omits the pready signal since no wait states are required, meaning data transfers complete in a single enable phase once penable is asserted.
 This setup provides a straightforward, low-latency APB register block suitable for control and status operations in a larger system.

<img width="782" height="377" alt="image" src="https://github.com/user-attachments/assets/def9affb-3da8-4ff6-96e8-4acc133493c7" />

<img width="701" height="201" alt="image" src="https://github.com/user-attachments/assets/b4476bc0-7970-444c-ba7f-cf0ade44ddc8" />
