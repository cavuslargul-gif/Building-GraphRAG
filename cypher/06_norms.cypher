// ---------- Normen ----------

MERGE (din4102:Norm {NormId:"NORM-01"})
SET din4102.name="DIN 4102"

MERGE (din16034:Norm {NormId:"NORM-02"})
SET din16034.name="DIN EN 16034"

MERGE (mbo:Norm {NormId:"NORM-03"})
SET mbo.name="Musterbauordnung"

MERGE (iso9001:Norm {NormId:"NORM-04"})
SET iso9001.name="DIN EN ISO 9001"

// ---------- Objekte suchen ----------

MATCH (building:IfcBuilding {GlobalId:"B-01"})

MATCH (wall3:IfcWall {GlobalId:"W-03"})

MATCH (door1:IfcDoor {GlobalId:"D-01"})
MATCH (door2:IfcDoor {GlobalId:"D-02"})
MATCH (door3:IfcDoor {GlobalId:"D-03"})

MATCH (din4102:Norm {NormId:"NORM-01"})
MATCH (din16034:Norm {NormId:"NORM-02"})
MATCH (mbo:Norm {NormId:"NORM-03"})
MATCH (iso9001:Norm {NormId:"NORM-04"})

// ---------- Beziehungen ----------

MERGE (wall3)-[:COMPLIES_WITH]->(din4102)

MERGE (door1)-[:COMPLIES_WITH]->(din16034)
MERGE (door2)-[:COMPLIES_WITH]->(din16034)
MERGE (door3)-[:COMPLIES_WITH]->(din16034)

MERGE (building)-[:COMPLIES_WITH]->(mbo)

MERGE (building)-[:COMPLIES_WITH]->(iso9001)

