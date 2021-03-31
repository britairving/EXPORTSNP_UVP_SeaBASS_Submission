function xReturn = getAphiaRecordsByDate(obj,startdate,enddate,marine_only,offset)
%getAphiaRecordsByDate(obj,startdate,enddate,marine_only,offset)
%
%   <strong>Lists all AphiaRecords (taxa) that have their last edit action (modified or added) during the specified period</strong>
%   		<br/>Parameters:
%   		<ul>
%   			<li><u>startdate</u>: ISO 8601 formatted start date(time). Default=today(). i.e. 2021-01-28T01:14:39+00:00</li>
%   			<li><u>enddate</u>: ISO 8601 formatted end date(time). Default=today().i.e. 2021-01-28T01:14:39+00:00</li>
%   			<li><u>marine_only</u>: Limit to marine taxa. Default=true</li>
%   			<li><u>offset</u>: Starting recordnumber, when retrieving next chunk of (50) records. Default=1</li>
%   		</ul>
%   		<br /> For the structure of the returned AphiaRecords, please refer to the function getAphiaRecordByID()
%   
%     Input:
%       startdate = (string)
%       enddate = (string)
%       marine_only = (boolean)
%       offset = (int)
%   
%     Output:
%       return{:} = (AphiaRecord)

% Build up the argument lists.
values = { ...
   startdate, ...
   enddate, ...
   marine_only, ...
   offset, ...
   };
names = { ...
   'startdate', ...
   'enddate', ...
   'marine_only', ...
   'offset', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}string', ...
   '{http://www.w3.org/2001/XMLSchema}string', ...
   '{http://www.w3.org/2001/XMLSchema}boolean', ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/AphiaRecords', ...
    'getAphiaRecordsByDate', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaRecordsByDate', ...
    soapMessage);
xReturn = parseSoapResponse(response);