classdef OclMatrix < OclStructure
  %OCLMATRIX Matrix valued structure for variables
  %
  properties
    msize
    children
  end
  
  methods
    
    function self = OclMatrix(size)
      % OclMatrix(size)
      self.msize = size;
      self.children = struct;
    end
    
    function [N,M,K] = size(self)
      s = self.msize();
      if nargout>1
        N = s(1);
        M = s(2);
        K = 1;
      else
        N = s;
      end
    end
    
  end
end

