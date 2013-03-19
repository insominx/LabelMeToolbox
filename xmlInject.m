
% Injects an xml string into an existing annotation file.
% examples:
% xmlInject('myPath/myFile.xml','<imageattribute>...</imageattribute>')
function v = xmlInject(filename, xmlString)

% Get the xml to inject into
[v, xml] = loadXML(filename);

if (isempty(xml))
    error(['Error: Unable to load: ',filename]);
end

% Convert the string into a structure
xmlStructure = xml2struct(xmlString);

% Get the name of the topmost element (should only be one)
nameList = fieldnames(xmlStructure);

if (size(nameList, 1) ~= 1)
    error('Error: Injections may currently only have a single root element');
end;

name = char(nameList);

% Add the new field
v.annotation.(name)(end + 1) = xmlStructure.(name);

% Save it
writeXML(filename, v);

