function xReturn = getAphiaClassificationByID(obj,AphiaID)
%getAphiaClassificationByID(obj,AphiaID)
%
%   <strong>Get the complete classification for one taxon. This also includes any sub or super ranks.</strong>
%   
%     Input:
%       AphiaID = (int)
%   
%     Output:
%       return = (Classification)

% Build up the argument lists.
values = { ...
   AphiaID, ...
   };
names = { ...
   'AphiaID', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/Classification', ...
    'getAphiaClassificationByID', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaClassificationByID', ...
    soapMessage);
xReturn = parseSoapResponse(response);
