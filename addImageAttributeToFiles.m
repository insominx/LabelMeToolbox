
% Adds an imageAttribute name/value pair to one or more files.
% examples:
% xmlInject({'myPath/myFile1.xml', 'myPath/myFile2.xml}, 'myPath/myFile2.xml', 'myName', 'myValue); 
function addImageAttributeToFiles(filenameList, attributeName, attributeValue)

% Allow for taking a single string filename
if (~iscell(filenameList))
    filenameList = {filenameList};
end

% Make sure file lists are 1 dimensional
if (size(filenameList, 1) ~= 1)
   disp('filenameList must contain exactly 1 row');
   return; 
end

% Inject the image attribute into each desired file
for i=1:size(filenameList,2)
    xmlString = ['<imageattribute><name>', attributeName, '</name><value>', attributeValue, '</value></imageattribute>'];
    xmlInject(char(filenameList(i)), xmlString);
end

