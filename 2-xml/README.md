# Loading XML

MongoDB doesn't handle XML natively, but since XML's structure is largely analagous to JSON's, it's fairly straightforward to convert XML documents to JSON. Once converted into JSON, it can be easily loaded into MongoDB. Some users choose to store the original XML right inside the coverted JSON document, preserving the data lineage.

This data comes from the OME (Open Microscopy Environment), a document standard for describing microscope images. See here: https://github.com/ome/ome-model

You can find xml files for download here: https://downloads.openmicroscopy.org/images/OME-XML/

Two files have been downloaded from the 2016-06 directory:
  ROI.ome.xml
  single-image.ome.xml

For demonstration purposes, cut and paste the contents of the XML file into an online XML-to-JSON converter, such as this one:
  https://www.freeformatter.com/xml-to-json-converter.html

The converted output has been saved to this folder. Note that the converter option to Prefix the XML attributes was cleared when generating the JSON.

Import the JSON via mongoimport, and view the results using MongoDB Compass.

