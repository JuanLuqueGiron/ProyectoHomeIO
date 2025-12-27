function analog_read(block)
% Level-2 MATLAB file S-Function for unit delay demo.
%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);
  
%endfunction

function setup(block)
  %% Register number of input and output ports
  block.NumInputPorts  = 0;
  block.NumOutputPorts = 4;

  %% Setup functional port properties to dynamically
  block.SetPreCompPortInfoToDefaults;
 
  block.OutputPort(1).Dimensions       = 1;
  
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
EngineIO.MemoryMap.Instance.Update();
% In N Room
%block.OutputPort(1).Data = double(EngineIO.MemoryMap.Instance.GetFloat(127, EngineIO.MemoryType.Input).Value);
% In Living Room
block.OutputPort(1).Data = double(EngineIO.MemoryMap.Instance.GetFloat(104, EngineIO.MemoryType.Input).Value); 
block.OutputPort(2).Data = double(EngineIO.MemoryMap.Instance.GetFloat(105, EngineIO.MemoryType.Input).Value); 
Instante=EngineIO.MemoryMap.Instance.GetDateTime(0, EngineIO.MemoryType.Input).Value;
block.OutputPort(3).Data=double(Instante.Hour);

block.OutputPort(4).Data = double(EngineIO.MemoryMap.Instance.GetFloat(132, EngineIO.MemoryType.Memory).Value)-273.15; %%TAMB EN K
%block.OutputPort(5).Data = double(EngineIO.MemoryMap.Instance.GetFloat(139, EngineIO.MemoryType.Input).Value); 
% block.OutputPort(6).Data=double(Instante.Hour);
% block.OutputPort(7).Data=double(Instante.Day);


%endfunction


