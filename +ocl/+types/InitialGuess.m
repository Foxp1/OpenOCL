classdef InitialGuess < handle

  properties
    data
    states_struct
  end

  methods

    function self = InitialGuess(states_struct)
      self.states_struct = states_struct;
    end
    
    function add(self, id, xdata, ydata)
      
      % check if id is a state id
      trajectory_structure = OclStructure();
      trajectory_structure.addRepeated({'states'}, ...
                                       {self.states_struct.get(id)}, ...
                                       length(xdata));
      
      trajectory = Variable.create(trajectory_structure, 0);
      states = trajectory.states;
      states.set(ydata);
      
      self.data.(id).x = xdata;
      self.data.(id).y = ocl.types.variable.toNdMatrix(states);
    end

  end

end