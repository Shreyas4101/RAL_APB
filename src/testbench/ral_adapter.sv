class ral_adapter extends uvm_reg_adapter;
  `uvm_object_utils(ral_adapter)
  
  function new(string name = "ral_adapter");
    super.new(name);
  endfunction
  
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    ral_seq_item item;
    item = ral_seq_item::type_id::create("item");
    item.pwrite = (rw.kind == UVM_WRITE)?1'b1:1'b0;
    item.paddr = rw.addr;
    item.pwdata = rw.data;
    return item;
  endfunction
  
  function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
    ral_seq_item item;
    assert ($cast(item,bus_item));
    rw.kind = (item.pwrite == 1'b1)?UVM_WRITE:UVM_READ;
    rw.data = (item.pwrite == 1'b1)?item.pwdata:item.prdata;
    rw.addr = item.paddr;
    rw.status = UVM_IS_OK;
  endfunction
endclass
