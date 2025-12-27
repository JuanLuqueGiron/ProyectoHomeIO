function analog_write(block)
% Level-2 MATLAB file S-Function for unit delay demo.
%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);
  
%endfunction

function setup(block)
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 0;

  %% Setup functional port properties to dynamically
  block.SetPreCompPortInfoToDefaults;
 
  block.InputPort(1).Dimensions       = 1;
  
  %% Set block sample time
  block.SampleTimes = [200 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

    path = strcat(pwd,'\EngineIO.dll');
  NET.addAssembly(path);  
  
  %% Register methods
  block.RegBlockMethod('Outputs',                 @Output);  
%endfunction


function Output(block)
  %In N Room
  %livingRoomLight = EngineIO.MemoryMap.Instance.GetFloat(146, EngineIO.MemoryType.Output);
  %in LivingRoom
  Variable1 = EngineIO.MemoryMap.Instance.GetFloat(124, EngineIO.MemoryType.Output);
  Variable1.Value = block.InputPort(1).Data;
  EngineIO.MemoryMap.Instance.Update();


  
%endfunction


