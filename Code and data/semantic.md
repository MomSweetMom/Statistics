# Trung Hoang  
trung.hoang-tran@edu.dsti.institute

### Q1.1 
```
<book>
<title>Architecture Now</title>
<author>Jodidio, Philip</author>
<ID isbn10=“3822840912”/>
</book>
```

### Q1.2
view-source: http://www.bbc.co.uk/nature/life/Great_white_shark
```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB">
<head profile="http://dublincore.org/documents/dcq-html/">

        <title>BBC Nature - Great white shark videos, news and facts</title>        <meta name="description" content="Great white sharks are at the very top of the marine food chain. " />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />        
<link rel="schema.dcterms" href="http://purl.org/dc/terms/" />
                                <meta name="DCTERMS.created" content="2009-07-28T12:00:00Z" />
        <meta name="DCTERMS.modified" content="2014-01-29T14:47:18+00:00" />        
```

http://www.bbc.co.uk/nature/life/Great_white_shark.rdf
```
<?xml version="1.0" encoding="utf-8"?><rdf:RDF
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:owl="http://www.w3.org/2002/07/owl#" 
    xmlns:foaf="http://xmlns.com/foaf/0.1/" 
    xmlns:dc="http://purl.org/dc/terms/" 
    xmlns:dctypes="http://purl.org/dc/dcmitype/" 
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#" 
    xmlns:po="http://purl.org/ontology/po/" 
```

### Q1.3
1. dbp:areaTotalKm: 1572
2. dbpedia.org/resource/Vienna
3. Wien

### Q1.4
1. curl -o Paris.html -L -H "Accept: text/html" http://dbpedia.org/resource/Paris

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:dbpprop="http://dbpedia.org/property/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    version="XHTML+RDFa 1.0"
    xml:lang="en"
>
```

curl -o Paris-rdf-xml.txt -L -H "Accept: application/rdf+xml" http://dbpedia.org/resource/Paris

```
<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:dbp="http://dbpedia.org/property/"
	xmlns:prov="http://www.w3.org/ns/prov#"
	xmlns:ns5="http://dbpedia.org/ontology/PopulatedPlace/"
	xmlns:dbo="http://dbpedia.org/ontology/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
```

2. curl -o fabien.html -L -H "Accept: text/html" http://ns.inria.fr/fabien.gandon#me

```
> <?xml version="1.0" encoding="utf-8" ?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <title>FOAF profile of Fabien GANDON</title>
 </head>
<body>
 <h1>FOAF profile of Fabien GANDON</h1>
 <p>You may have been redirected here by your browser.</p>
```

3. curl -o Vienna.html -L -H "Accept: text/html" http://dbpedia.org/resource/Vienna

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:dbpprop="http://dbpedia.org/property/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    version="XHTML+RDFa 1.0"
    xml:lang="en"
>
```

curl -o Vienna-rdf-xml.txt -L -H "Accept: application/rdf+xml" http://dbpedia.org/resource/Vienna
```
<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:dbp="http://dbpedia.org/property/"
	xmlns:prov="http://www.w3.org/ns/prov#"
	xmlns:ns5="http://dbpedia.org/ontology/PopulatedPlace/"
	xmlns:dbo="http://dbpedia.org/ontology/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
```

4. curl -o shark.html -L -H "Accept: text/html" http://www.bbc.co.uk/nautre/life/Great_white_shark

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB" lang="en-GB">
<head profile="http://dublincore.org/documents/dcq-html/"><title>BBC - Error 404 : Not Found</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="robots" content="noindex, nofollow" />
<link rel="schema.dcterms" href="http://purl.org/dc/terms/" />
<meta name="DCTERMS.created" content="2009-06-16T10:30:00Z" />
```

curl -o shark-rdf-xml.txt -L -H "Accept: application/rdf+xml" http://www.bbc.co.uk/nature/life/Great_white_shark

```
<?xml version="1.0" encoding="utf-8"?><rdf:RDF
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:owl="http://www.w3.org/2002/07/owl#" 
    xmlns:foaf="http://xmlns.com/foaf/0.1/" 
    xmlns:dc="http://purl.org/dc/terms/" 
    xmlns:dctypes="http://purl.org/dc/dcmitype/" 
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#" 
    xmlns:po="http://purl.org/ontology/po/" 
```

5. curl -o uniprot.html -L -H "Accept: text/html" http://purl.uniprot.org/uniprot/P43121

```
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"><head><title>MCAM - Cell surface glycoprotein MUC18 precursor - Homo sapiens (Human) - MCAM gene &amp; protein</title><meta content="IE=edge" http-equiv="X-UA-Compatible"/><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/><meta content="width=device-width, initial-scale=1" name="viewport"/><link href="/" rel="home"/><link href="http://creativecommons.org/licenses/by-nd/3.0/" rel="license"/><link type="image/vnd.microsoft.icon" href="/favicon.ico" rel="shortcut icon"/><link href="/css-compr.css2017_03" type="text/css" rel="stylesheet"/><script type="text/javascript">
			var BASE = '/';
			var image_x_inverse = '/images/x_inverse.png';
		</script><script src="/scripts/frontier/d3/d3.v3.min.js" type="text/javascript"></script><script type="text/javascript">
			var isInternal = false;
		</script><script src="/js-compr.js2017_03" type="text/javascript"></script><script type="text/javascript">
				uniprot.namespace = 'uniprot';
				onRdyFn(function(){
					if (true) {
```

curl -o uniprot.txt -L -H "Accept: Application/rdf+xml" http://purl.uniprot.org/uniprot/P43121

```
<?xml version='1.0' encoding='UTF-8'?>
<rdf:RDF xml:base="http://purl.uniprot.org/uniprot/" xmlns="http://purl.uniprot.org/core/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:bibo="http://purl.org/ontology/bibo/" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:void="http://rdfs.org/ns/void#" xmlns:sd="http://www.w3.org/ns/sparql-service-description#" xmlns:faldo="http://biohackathon.org/resource/faldo#">
<owl:Ontology rdf:about="http://purl.uniprot.org/uniprot/">
<owl:imports rdf:resource="http://purl.uniprot.org/core/"/>
</owl:Ontology>
<rdf:Description rdf:about="http://purl.uniprot.org/uniprot/P43121">
<rdf:type rdf:resource="http://purl.uniprot.org/core/Protein"/>
<reviewed rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</reviewed>
<created rdf:datatype="http://www.w3.org/2001/XMLSchema#date">1995-11-01</created>
<modified rdf:datatype="http://www.w3.org/2001/XMLSchema#date">2017-03-15</modified>
```

6. curl -o data1.json -L -H "Accept: application/json" https://www.wikidata.org/wiki/Special:EntityData/Q551861

> Topic: Xavier Dolan - Director  
> Format: json  

7. curl -o data2.txt -L -H "Accept: text/turtle" http://dx.doi.org/10.1007/3-54045741-0_18

http://www.doi.org/index.html
> DOI Not Found  
> Format: html  

### Q1.5
Five Rules of Linked Open data
1. One the web (Open Licence)
2. Machine-readable data
3. Non-proprietary format
4. RDF Standards
5. Linked data

- - - -

### Q2.1
It's too long ago and I can't find the Image link anymore

### Q2.2
AAA = rdf:Description
BBB = voc:hasSpouse
CCC = rdf:Resource
DDD = rdf:Type
EEE = rdf:Description

### Q2.3
AAA = ,
BBB = voc:woman
CCC = <http://www.unice.fr/data#Simon>
DDD a
EEE = <http://www.unice.fr/data#Simon>
FFF = voc:Man
GGG = voc:name
HHH = “Simon”

### Q2.4
https://www.w3.org/RDF/Validator/rdfval?URI=http%3A%2F%2Fns.inria.fr%2Ffabien.gandon%23me&PARSE=Parse+URI%3A+&TRIPLES_AND_GRAPH=PRINT_BOTH&FORMAT=PNG_EMBED

### Q2.5
A Report of doc.html, having 2 themes: Music & History, and the page number of 23 (int)

### Q2.6
Syntax: rdf-xml
Bug: en language was added to each

### Q2.7
Syntax: TriG
Describe a graph algebra with doc.html, whose subject is in an URI

- - - -

### Q3.1
```
1	<http://www.inria.fr/2015/humans-instances#John>
2	<http://www.inria.fr/2015/humans-instances#Sophie>
3	<http://www.inria.fr/2015/humans-instances#Mark>
4	<http://www.inria.fr/2015/humans-instances#Eve>
5	<http://www.inria.fr/2015/humans-instances#David>
6	<http://www.inria.fr/2015/humans-instances#Laura>
7	<http://www.inria.fr/2015/humans-instances#William>
8	<http://www.inria.fr/2015/humans-instances#Karl>
```
### Q3.2
```
x	p	v
:Paris [http]	rdf:type [http]	owl:Thing [http]
:Paris [http]	rdf:type [http]	dbpedia:ontology/Place [http]
:Paris [http]	rdf:type [http]	dbpedia:ontology/Location [http]
:Paris [http]	rdf:type [http]	<http://www.wikidata.org/entity/Q486972> [http]
:Paris [http]	rdf:type [http]	dbpedia:ontology/PopulatedPlace [http]
:Paris [http]	rdf:type [http]	dbpedia:ontology/Settlement [http]
:Paris [http]	rdf:type [http]	<http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing> [http]
:Paris [http]	rdf:type [http]	<http://schema.org/Place> [http]
:Paris [http]	rdf:type [http]	<http://umbel.org/umbel/rc/Location_Underspecified> [http]
:Paris [http]	rdf:type [http]	<http://umbel.org/umbel/rc/PopulatedPlace> 
```
### Q3.3
All American Presidents
```
SELECT ?president ?name WHERE
{ wd:Q30 p:P6/ps:P6 ?president . 
 ?president p:P734 ?pLabel . 
 ?pLabel ?x ?v .
 ?v rdfs:label ?name .
 FILTER (lang(?name)="en")  
}
```


### Q3.4
```
select * where 
{ ?x  a loaf:Person}
limit 20
```
### Q3.5 
```
select * where
{ ?x a foaf:Person}
limit 20
offset 10
```
### Q3.6
```
1. select ?age 
where {
	?x c:name ‘Fabien’;
	c:age ?age .
}
2. select ?name
where {
	?x c:name ?name;
	c:age ?age .
	filter(?age < 50)
}
3. select ?p ?y 
where {
	?x c:name “Fabien”; 
	c:age ?age;
	?p ?y .
	filter(?age < 50)
}
4. select ?name 
where {
	?x c:name ‘Fabien’ ,
	?name .
	filter(?name != ‘Fabien’)
}
5. select ?x
where {
	?x ?p ?v;
	?q ?v .
	filter(?p != ?q)	
}
6. select ?x
where {
	?x ?p ?v,
	?z .
	filter(?v != ?z)
}
```
### Q3.7
The ‘minus’ will do nothing so the query return everything satisfy
```
select * 
where {
	?x c:memberOf ?org
}
```
### Q3.8 
```
select ?mem
where {
	?mem c:memberOf ?org .
	filter ({! exist
		?mem c:author ?doc})
}
```
### Q3.9
Meaning: Counting the number of documents produced by each authors 
in descending order

1. Practice
```
select (Count(distinct ?x) as ?number)
where {
	?x c:memberOf ?org .
	minus {?x ex:author ?doc}
} 
```
### Q3.10
```
?x (foam:knows | refs:see Also)+ ?y
```
### Q3.11
Return person and names of the ones they know or return “John Doe” if that ones
don’t have name

### Q3.12
Return person and average age of the ones they know

### Q3.13
1. Study informatics or mathematics
```
select * 
where {
	?x c:study ?subject
	filter (?subject = c:math || c:informatics)
}

select *
where {
	{?x c:study c:math} union
	{?x c:study c:informatics}
	optional {?x c:name ?name}
} 

select *
where {
	{?x c:study c:math} union
	{?x c:study c:informatics}
	optional {graph ?g {?x c:name ?name}}
} 
```
### Q3.15
```
DELETE {?x foam:name ?n}
INSERT {?x rdfs:label ?n}
WHERE {?x foaf:name ?n}
```
### Q3.16
Replace the age of type “string” with “integer”

- - - -
 
### Q4.1
TRUE: 2, 3, 4, 5

### Q4.2
TRUE: 1, 3, 4

### Q4.3
B, C, D rdfs:subClassOf A
D rdfs:subClassOf B, C

### Q4.4
P2, P3, P4 rdfs:subPropertyOf P1
P4 rdfs:subPropertyOf P2, P3

- - - -

### Q5.1
```
ex:Jane a ex:Woman
ex:John a ex:Male, Human
ex:James a ex:Male
```
### Q5.2
```
ex:Jim a ex:GrandFather
ex:Jim a ex:Parent ex:Man
```
### Q5.3
Jim has a child named Jane | Jane has a ‘parent’ named Jim
Jane is a wife of John | John is a husband of Jane
Jim has a ‘parent’ (or ‘ancestor’) named James

### Q5.4
Class Human & Person contain the same result
Property foam:name and ex:name has the same relation
JimmyPage is Human (as well as Person) and JamesPatrickPage are two URIs 
identify exactly the same thing
JimmyHendrix and JimmyPage are two URIs represent different things

UnluckyPeson have the same class with (Lucky + Person)

### Q5.5 
John only has Parents (that are Human) : James and Jane

### Q5.6
abc is a PersonList (of a, b, c)

### Q5.7
John is Human, which only has Father named James and Mother named Jimmy

### Q5.8
John is Wealth and only has one child named Jim

- - - -

### Q6.1
Links to <#B-A-Ba>
Only allow 1 prefLabel per Concept per Language

### Q6.2
skos:narrowMatch is used to state a hierarchical mapping link between two conceptual resources in different concept schemes.<

```
<rdf:Description rdf:about="#relatedMatch">
    <rdfs:label xml:lang="en">has related match</rdfs:label>
    <rdfs:isDefinedBy rdf:resource="http://www.w3.org/2004/02/skos/core"/>
    <skos:definition xml:lang="en">skos:relatedMatch is used to state an associative mapping link between two conceptual resources in different concept schemes.</skos:definition>
    <!-- S38 -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <!-- S40 -->
    <rdfs:subPropertyOf rdf:resource="#mappingRelation"/>
    <!-- S41 -->
    <rdfs:subPropertyOf rdf:resource="#related"/>
    <!-- S44 -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#SymmetricProperty"/>
    <!-- For non-OWL aware applications -->
    <rdf:type rdf:resource="http://www.w3.org/1999/02/22-rdf-syntax-ns#Property"/>
  </rdf:Description>
```

### Q6.3
1. AgentClass is subclass of Class (find in <Description>)

```
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/elements/1.1/> .
@prefix dcterms: <http://purl.org/dc/terms/> .
<http://inria.fr/rr/doc.html>
dc:creator <http://ns.inria.fr/fabien.gandon#me> ,
<http://ns.inria.fr/catherine.faron#me> ,
<http://ns.inria.fr/olivier.corby#me> ;
dc:title "Introduction to Semantic Web standards" ;
dc:language "en" ;
dc:subject "RDF, RDFS, SPARQL, OWL, SKOS" ;
dc:date "2014-12-01" ;
dc:publisher <http://inria.fr> ;
dc:format "text/html" ; dc:type dcterms:Text .
```

```
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/elements/1.1/> .
@prefix dcterms: <http://purl.org/dc/terms/> .
<https://www.amazon.com/Mis%C3%A9rables-English-language-Victor-Hugo-ebook/dp/B004GHNIRK>
    dc:creator "Victor Hugo";
    dc:title "Les Misérables (English language)" ;
    dc:language "en" ;
    dc:subject "RDF, RDFS, SPARQL, OWL, SKOS" ;
    dc:date "2016-03-24" ;
    dc:publisher "Amazon.com" ;
    dc:format "text/html" ;
    dc:type dcterms:Text .
```

```
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/elements/1.1/> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefic cc: <http://creativecommons.org/ns#>

<InriaTopics> a skos:ConceptScheme ;
	dc:title "Les Misérables" ;
	cc:license [
		a cc:License ;
		cc:permits cc:DerivativeWorks, cc:Distribution ;
		cc:requires cc:Attribution, cc:Notice, cc:ShareAlike . ] ;
	skos:hasTopConcept <#ComputerScience> .
```

### Q6.4
```
<rdf:Property rdf:about="http://xmlns.com/foaf/0.1/weblog" vs:term_status="stable" rdfs:label="weblog" rdfs:comment="A weblog of some thing (whether person, group, company etc.).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
			# Always link uri, not literal
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
			# Inheritted from 'page'
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
			# Of type 'Inverse Functional Property'
			# e.g. Social Security Number (key) - identify
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
```


### Q6.5
1. RDF

```
<rdf:RDF
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      xmlns:admin="http://webns.net/mvcb/">
<foaf:PersonalProfileDocument rdf:about="">
  <foaf:maker rdf:resource="#me"/>
  <foaf:primaryTopic rdf:resource="#me"/>
  <admin:generatorAgent rdf:resource="http://www.ldodds.com/foaf/foaf-a-matic"/>
  <admin:errorReportsTo rdf:resource="mailto:leigh@ldodds.com"/>
</foaf:PersonalProfileDocument>
<foaf:Person rdf:ID="me">
<foaf:name>Trung Hoang</foaf:name>
<foaf:title>Mr.</foaf:title>
<foaf:givenname>Trung</foaf:givenname>
<foaf:family_name>Hoang</foaf:family_name>
<foaf:nick>Mr. Tea</foaf:nick>
<foaf:mbox_sha1sum>c827f2f74a177ea76daea02f4c704ed0001310dc</foaf:mbox_sha1sum>
<foaf:homepage rdf:resource="datacorner.eu"/>
<foaf:phone rdf:resource="tel:9704435017"/>
<foaf:workplaceHomepage rdf:resource="dsti.institute"/>
<foaf:schoolHomepage rdf:resource="Data ScienceTech Institute"/>
<foaf:knows>
<foaf:Person>
<foaf:name>Fabien</foaf:name>
<foaf:mbox_sha1sum>eac5693c3ee10c8e32c3b60414dd1fc7eb24f2e0</foaf:mbox_sha1sum>
<rdfs:seeAlso rdf:resource="http://fabien.info"/></foaf:Person></foaf:knows>
<foaf:knows>
<foaf:Person>
<foaf:name>ilhem</foaf:name>
<foaf:mbox_sha1sum>d8f677931175e68b3fac3a45094726c88f472e42</foaf:mbox_sha1sum>
<rdfs:seeAlso rdf:resource="ilhem@gmail.com"/></foaf:Person></foaf:knows>
<foaf:knows>
<foaf:Person>
<foaf:name>assan</foaf:name>
<foaf:mbox_sha1sum>1d9460e8aaa1b5bb10fba5b8e2d1567bcbe9f710</foaf:mbox_sha1sum></foaf:Person></foaf:knows></foaf:Person>
</rdf:RDF>
```

2. Turtle (N3)

```
@prefix admin: <http://webns.net/mvcb/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<> a foaf:PersonalProfileDocument ;
    admin:errorReportsTo <mailto:leigh@ldodds.com> ;
    admin:generatorAgent <http://www.ldodds.com/foaf/foaf-a-matic> ;
    foaf:maker <#me> ;
    foaf:primaryTopic <#me> .

<#me> a foaf:Person ;
    foaf:family_name "Hoang" ;
    foaf:givenname "Trung" ;
    foaf:homepage <datacorner.eu> ;
    foaf:knows [ a foaf:Person ;
            rdfs:seeAlso <http://fabien.info> ;
            foaf:mbox_sha1sum "eac5693c3ee10c8e32c3b60414dd1fc7eb24f2e0" ;
            foaf:name "Fabien" ],
        [ a foaf:Person ;
            rdfs:seeAlso <ilhem@gmail.com> ;
            foaf:mbox_sha1sum "d8f677931175e68b3fac3a45094726c88f472e42" ;
            foaf:name "ilhem" ],
        [ a foaf:Person ;
            foaf:mbox_sha1sum "1d9460e8aaa1b5bb10fba5b8e2d1567bcbe9f710" ;
            foaf:name "assan" ] ;
    foaf:mbox_sha1sum "c827f2f74a177ea76daea02f4c704ed0001310dc" ;
    foaf:name "Trung Hoang" ;
    foaf:nick "Mr. Tea" ;
    foaf:phone <tel:9704435017> ;
    foaf:schoolHomepage <DataScienceTechInstitute> ;
    foaf:title "Mr." ;
    foaf:workplaceHomepage <dsti.institute> .
```

### Q6.7
Default Query: 
SELECT DISTINCT ?endpoint WHERE { ?ds a void:Dataset . ?ds void:sparqlEndpoint ?endpoint }

### Q6.8

### Q6.10
1. Schemas: Music Ontology (mo)
2. 2.1.5
3. It is reused: 9
4. Class: 60
Properties: 166
5. Expressivity: RDF, RDFS, OWL

- - - -

### Q7.1
Meaning
{num}  dc:title  [ttl content]
2616  dc:title  “Hyper transfer Protocol — HTTP/1.1
2396  dc:title  “Uniform Resource Identifiers (URI): Generic Syntax”

### Q7.2
Triples:
#cathy (of type "Person") has:name "Catherine Faron"
#cathy (of type "Person") has:mbox "faron@i3s.unice.fr"
#cathy (of type "Person") has:knows "http://ns.inria.fr/fabien.gandon/me"

### Q7.3
404

### Q7.4
Played!
[RDFa / Play](https://rdfa.info/play/)

### Q7.5
```
@prefix ns1: <http://www.w3.org/1999/xhtml/vocab#> .
@prefix ns2: <http://www.facebook.com/2008/> .
@prefix og: <http://ogp.me/ns#> .

<http://www.imdb.com/title/tt3731562/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2773216402&pf_rd_r=19MECETR38Q7W0340B6C&pf_rd_s=right-7&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_cht_t1> og:description "Directed by Jordan Vogt-Roberts.  With Tom Hiddleston, Samuel L. Jackson, Brie Larson, John C. Reilly. A team of scientists explore an uncharted island in the Pacific, venturing into the domain of the mighty Kong, and must fight to escape a primal Eden.";
    og:image "https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwMzI5ODEwNF5BMl5BanBnXkFtZTgwNjAzNjI2MDI@._V1_UY1200_CR90,0,630,1200_AL_.jpg";
    og:site_name "IMDb";
    og:title "Kong: Skull Island (2017)";
    og:type "video.movie";
    og:url "http://www.imdb.com/title/tt3731562/";
    ns2:fbmlapp_id "115109575169727" .

<http://www.imdb.com/title/tt3731562/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2773216402&pf_rd_r=19MECETR38Q7W0340B6C&pf_rd_s=right-7&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_cht_t1#twitterIframe> ns1:role ns1:presentation .

[] ns1:role ns1:button .
```

### Q7.6
JSON-LD

```
{
  "@context": {
    "foaf": "http://xmlns.com/foaf/0.1/",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  },
  "@graph": [
    {
      "@id": "http://ns.inria.fr/fabien.gandon",
      "@type": "foaf:PersonalProfileDocument",
      "foaf:maker": {
        "@id": "http://ns.inria.fr/fabien.gandon#me"
      },
      "foaf:primaryTopic": {
        "@id": "http://ns.inria.fr/fabien.gandon#me"
      }
    },
    {
      "@id": "_:N798de8ecbf3b4ca4aeec8e98f51c826d",
      "@type": "foaf:Person",
      "foaf:mbox": {
        "@id": "mailto:olivier.corby@inria.fr"
      },
      "foaf:name": "Olivier Corby",
      "rdfs:seeAlso": {
        "@id": "http://www-sop.inria.fr/members/Olivier.Corby/"
      }
    },
    {
      "@id": "http://ns.inria.fr/fabien.gandon#me",
      "@type": "foaf:Person",
      "foaf:depiction": {
        "@id": "http://www-sop.inria.fr/members/Fabien.Gandon/common/FabienGandonBackground.jpg"
      },
      "foaf:family_name": "Gandon",
      "foaf:givenname": "Fabien",
      "foaf:homepage": {
        "@id": "http://fabien.info"
      },
      "foaf:knows": [
        {
          "@id": "_:N62cde8e87576497a933ebbc6bdcd96bb"
        },
        {
          "@id": "_:N798de8ecbf3b4ca4aeec8e98f51c826d"
        }
      ],
      "foaf:mbox": {
        "@id": "mailto:fabien.gandon@inria.fr"
      },
      "foaf:name": "Fabien Gandon",
      "foaf:nick": "Bafien",
      "foaf:phone": {
        "@id": "http://ns.inria.fr/tel:0492387788"
      },
      "foaf:schoolHomepage": {
        "@id": "http://www.insa-rouen.fr"
      },
      "foaf:title": "Dr",
      "foaf:workInfoHomepage": {
        "@id": "http://fabien.info"
      },
      "foaf:workplaceHomepage": {
        "@id": "http://www.inria.fr/"
      }
    },
    {
      "@id": "_:N62cde8e87576497a933ebbc6bdcd96bb",
      "@type": "foaf:Person",
      "foaf:mbox": {
        "@id": "mailto:faron@polytech.unice.fr"
      },
      "foaf:name": "Catherine Faron-Zucker",
      "rdfs:seeAlso": {
        "@id": "http://www.i3s.unice.fr/~faron/"
      }
    }
  ]
}
```

Flattened

```
{
  "@graph": [
    {
      "@id": "_:b0",
      "@type": "http://xmlns.com/foaf/0.1/Person",
      "http://www.w3.org/2000/01/rdf-schema#seeAlso": {
        "@id": "http://www-sop.inria.fr/members/Olivier.Corby/"
      },
      "http://xmlns.com/foaf/0.1/mbox": {
        "@id": "mailto:olivier.corby@inria.fr"
      },
      "http://xmlns.com/foaf/0.1/name": "Olivier Corby"
    },
    {
      "@id": "_:b1",
      "@type": "http://xmlns.com/foaf/0.1/Person",
      "http://www.w3.org/2000/01/rdf-schema#seeAlso": {
        "@id": "http://www.i3s.unice.fr/~faron/"
      },
      "http://xmlns.com/foaf/0.1/mbox": {
        "@id": "mailto:faron@polytech.unice.fr"
      },
      "http://xmlns.com/foaf/0.1/name": "Catherine Faron-Zucker"
    },
    {
      "@id": "http://ns.inria.fr/fabien.gandon",
      "@type": "http://xmlns.com/foaf/0.1/PersonalProfileDocument",
      "http://xmlns.com/foaf/0.1/maker": {
        "@id": "http://ns.inria.fr/fabien.gandon#me"
      },
      "http://xmlns.com/foaf/0.1/primaryTopic": {
        "@id": "http://ns.inria.fr/fabien.gandon#me"
      }
    },
    {
      "@id": "http://ns.inria.fr/fabien.gandon#me",
      "@type": "http://xmlns.com/foaf/0.1/Person",
      "http://xmlns.com/foaf/0.1/depiction": {
        "@id": "http://www-sop.inria.fr/members/Fabien.Gandon/common/FabienGandonBackground.jpg"
      },
      "http://xmlns.com/foaf/0.1/family_name": "Gandon",
      "http://xmlns.com/foaf/0.1/givenname": "Fabien",
      "http://xmlns.com/foaf/0.1/homepage": {
        "@id": "http://fabien.info"
      },
      "http://xmlns.com/foaf/0.1/knows": [
        {
          "@id": "_:b1"
        },
        {
          "@id": "_:b0"
        }
      ],
      "http://xmlns.com/foaf/0.1/mbox": {
        "@id": "mailto:fabien.gandon@inria.fr"
      },
      "http://xmlns.com/foaf/0.1/name": "Fabien Gandon",
      "http://xmlns.com/foaf/0.1/nick": "Bafien",
      "http://xmlns.com/foaf/0.1/phone": {
        "@id": "http://ns.inria.fr/tel:0492387788"
      },
      "http://xmlns.com/foaf/0.1/schoolHomepage": {
        "@id": "http://www.insa-rouen.fr"
      },
      "http://xmlns.com/foaf/0.1/title": "Dr",
      "http://xmlns.com/foaf/0.1/workInfoHomepage": {
        "@id": "http://fabien.info"
      },
      "http://xmlns.com/foaf/0.1/workplaceHomepage": {
        "@id": "http://www.inria.fr/"
      }
    }
  ]
}
```
 

