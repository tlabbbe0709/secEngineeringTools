#repo=aidr
| Vendor.status = reported
| myArray := Vendor.findings.topic.data.entities
| regex(field=myArray, "\\[(?<myString>.*)\\]")
| parseJson(myString)
| topic=?topic
| case {
  confidence >= 0.9 | confidence_range := "90+";
  confidence >= 0.8 | confidence_range := "80-89";
  confidence >= 0.7 | confidence_range := "70-79";
  confidence >= 0.6 | confidence_range := "60-69";
  confidence >= 0.5 | confidence_range := "50-59";
  * | confidence_range := "0-49"
}
| groupBy([topic, confidence_range])