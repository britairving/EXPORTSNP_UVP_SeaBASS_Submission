function xReturn = getAphiaTaxonRanksByID(obj,taxonRankID,AphiaID)
%getAphiaTaxonRanksByID(obj,taxonRankID,AphiaID)
%
%   <strong>Get taxonomic ranks by their identifier</strong>
%   		<br />Output fields include:
%   		<br /> <ul><li>	<u><b>taxonRankID</b></u> : A taxonomic rank identifier</li><li>	<u><b>taxonRank</b></u> : A taxonomic rank name</li><li>	<u><b>AphiaID</b></u> : AphiaID of the kingdom</li><li>	<u><b>kingdom</b></u> : The name of a taxonomic kingdom the rank is used in</li></ul>
%   
%     Input:
%       taxonRankID = (int)
%       AphiaID = (int)
%   
%     Output:
%       return{:} = (AphiaRank)

% Build up the argument lists.
values = { ...
   taxonRankID, ...
   AphiaID, ...
   };
names = { ...
   'taxonRankID', ...
   'AphiaID', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/AphiaRanks', ...
    'getAphiaTaxonRanksByID', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaTaxonRanksByID', ...
    soapMessage);
xReturn = parseSoapResponse(response);
