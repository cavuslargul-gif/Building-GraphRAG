// ======================================================
// Basic Queries
// ======================================================

// ======================================================
// Basic Query 1
// Welche Gebäude sind vorhanden?
// ======================================================

MATCH (b:IfcBuilding)
RETURN b;

// ======================================================
// Basic Query 2
// Wie viele Stockwerke hat das Gebäude?
// ======================================================

MATCH (s:IfcBuildingStorey)
RETURN s;

// ======================================================
// Basic Query 3
// Welche Räume hat das Gebäude?
// ======================================================

MATCH (sp:IfcSpace)
RETURN sp;

// ======================================================
// Basic Query 4
// Wie viele Wände gibt es im Gebäude?
// ======================================================

MATCH (w:IfcWall)
RETURN w;

// ======================================================
// Basic Query 5
// Welche Türen hat das Gebäude?
// ======================================================

MATCH (d:IfcDoor)
RETURN d;

// ======================================================
// Basic Query 6
// Welche Fenster hat das Gebäude?
// ======================================================

MATCH (w:IfcWindow)
RETURN w;

// ======================================================
// Basic Query 7
// Welche Dokumente sind vorhanden?
// ======================================================

MATCH (d:Document)
RETURN d;

// ======================================================
// Basic Query 8
// Welche Materialien sind vorhanden?
// ======================================================

MATCH (m:Material)
RETURN m;

// ======================================================
// Basic Query 9
// Welche Normen gibt es?
// ======================================================

MATCH (n:Norm)
RETURN n;

// ======================================================
// Basic Query 10
// Welche Rollen gibt es?
// ======================================================

MATCH (r:Role)
RETURN r;

// ======================================================
// Basic Query 11
// Welche Mängel sind vorhanden?
// ======================================================

MATCH (i:Issue)
RETURN i;

// ======================================================
// Relationship Queries
// ======================================================

// ======================================================
// Relationship Query 12
// Welche Stockwerke gehören zu welchem Gebäude?
// ======================================================

MATCH (b:IfcBuilding)-[r:HAS_STOREY]->(s:IfcBuildingStorey)
RETURN b, r, s;

// ======================================================
// Relationship Query 13
// Welche Räume gehören zu welchem Stockwerk?
// ======================================================

MATCH (s:IfcBuildingStorey)-[r:HAS_SPACE]->(sp:IfcSpace)
RETURN s, r, sp;

// ======================================================
// Relationship Query 14
// Welche Bauteile befinden sich in welchem Raum?
// ======================================================

MATCH (sp:IfcSpace)-[r:CONTAINS]->(e)
RETURN sp, r, e;

// ======================================================
// Relationship Query 15
// Welche Dokumente gehören zu welchen Bauteilen?
// ======================================================

MATCH (e)-[r:HAS_DOCUMENT]->(d:Document)
RETURN e, r, d;

// ======================================================
// Relationship Query 16
// Aus welchen Materialien bestehen die Bauteile?
// ======================================================

MATCH (e)-[r:MADE_OF]->(m:Material)
RETURN e, r, m;

// ======================================================
// Relationship Query 17
// Welche Normen gelten für welche Bauteile?
// ======================================================

MATCH (e)-[r:COMPLIES_WITH]->(n:Norm)
RETURN e, r, n;

// ======================================================
// Relationship Query 18
// Welche Mängel sind welchen Bauteilen zugeordnet?
// ======================================================

MATCH (e)-[r:HAS_ISSUE]->(i:Issue)
RETURN e, r, i;

// ======================================================
// Relationship Query 19
// Wer ist für die Mängel verantwortlich?
// ======================================================

MATCH (r:Role)-[rel:RESPONSIBLE_FOR]->(i:Issue)
RETURN r, rel, i;

// ======================================================
// Business Queries
// ======================================================

// ======================================================
// Business Query 20
// Welche Räume befinden sich in den einzelnen Gebäuden?
// ======================================================

MATCH (b:IfcBuilding)-[:HAS_STOREY]->(s:IfcBuildingStorey)
      -[:HAS_SPACE]->(sp:IfcSpace)
RETURN b, s, sp;

// ======================================================
// Business Query 21
// Welche Materialien wurden für die Bauteile im Raum verwendet?
// ======================================================

MATCH (sp:IfcSpace)-[:CONTAINS]->(e)
      -[:MADE_OF]->(m:Material)
RETURN sp, e, m;

// ======================================================
// Business Query 22
// Welche Dokumente gehören zu den Bauteilen im Raum?
// ======================================================

MATCH (sp:IfcSpace)-[:CONTAINS]->(e)
      -[:HAS_DOCUMENT]->(d:Document)
RETURN sp, e, d;

// ======================================================
// Business Query 23
// Welche Normen gelten für die Bauteile im Raum?
// ======================================================

MATCH (sp:IfcSpace)-[:CONTAINS]->(e)
      -[:COMPLIES_WITH]->(n:Norm)
RETURN sp, e, n;

// ======================================================
// Business Query 24
// Welche offenen Mängel gibt es im Raum?
// ======================================================

MATCH (sp:IfcSpace)-[:CONTAINS]->(e)
      -[:HAS_ISSUE]->(i:Issue)
WHERE i.status = "Open"
RETURN sp, e, i;

// ======================================================
// Business Query 25
// Wer ist für die Mängel im Raum verantwortlich?
// ======================================================

MATCH (sp:IfcSpace)-[:CONTAINS]->(e)
      -[:HAS_ISSUE]->(i:Issue)
<-[:RESPONSIBLE_FOR]-(r:Role)
WHERE i.status = "Open"
RETURN sp, e, i, r;

// ======================================================
// Process Queries
// ======================================================

// ======================================================
// Process Query 26
// Welche offenen Mängel gibt es?
// ======================================================

MATCH (i:Issue)
WHERE i.status = "Open"
RETURN i;

