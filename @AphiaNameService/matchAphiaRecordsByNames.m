function xReturn = matchAphiaRecordsByNames(obj,scientificnames,marine_only)
%matchAphiaRecordsByNames(obj,scientificnames,marine_only)
%
%   <strong>For each given scientific name (may include authority), try to find one or more AphiaRecords, using the TAXAMATCH fuzzy matching algorithm by Tony Rees.<br/>This allows you to (fuzzy) match multiple names in one call. Limited to 50 names at once for performance reasons</strong>
%   		<br/>Parameters:
%   		<ul>
%   			<li><u>marine_only</u>: Limit to marine taxa. Default=true</li>
%   		</ul>
%   		<br /> For the structure of the returned AphiaRecords, please refer to the function getAphiaRecordByID()
%   
%     Input:
%       scientificnames{:} = (string)
%       marine_only = (boolean)
%   
%     Output:
%       return{:} = (AphiaRecords)

% Build up the argument lists.
values = { ...
   scientificnames, ...
   marine_only, ...
   };
names = { ...
   'scientificnames', ...
   'marine_only', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}string[]', ...
   '{http://www.w3.org/2001/XMLSchema}boolean', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/AphiaMatches', ...
    'matchAphiaRecordsByNames', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'matchAphiaRecordsByNames', ...
    soapMessage);
xReturn = parseSoapResponse(response);
