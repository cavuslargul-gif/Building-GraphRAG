// ---------- Wände ----------

MERGE (wall1:IfcWall {GlobalId:"W-01"})
SET wall1.name="Nordwand"

MERGE (wall2:IfcWall {GlobalId:"W-02"})
SET wall2.name="Südwand"

MERGE (wall3:IfcWall {GlobalId:"W-03"})
SET wall3.name="Brandschutzwand"

MERGE (wall4:IfcWall {GlobalId:"W-04"})
SET wall4.name="Flurwand"

// ---------- Türen ----------

MERGE (door1:IfcDoor {GlobalId:"D-01"})
SET door1.name="Tür Büro 1"

MERGE (door2:IfcDoor {GlobalId:"D-02"})
SET door2.name="Tür Büro 2"

MERGE (door3:IfcDoor {GlobalId:"D-03"})
SET door3.name="Haupteingang"

// ---------- Fenster ----------

MERGE (window1:IfcWindow {GlobalId:"WIN-01"})
SET window1.name="Fenster Büro 1"

MERGE (window2:IfcWindow {GlobalId:"WIN-02"})
SET window2.name="Fenster Büro 2"

// ---------- Lüftung ----------

MERGE (hvac:IfcFurnishingElement {GlobalId:"HVAC-01"})
SET hvac.name="Lüftungsanlage"

// ---------- Räume und Bauteile suchen ----------

MATCH (room1:IfcSpace {GlobalId:"R-01"})
MATCH (room2:IfcSpace {GlobalId:"R-02"})
MATCH (room3:IfcSpace {GlobalId:"R-03"})

MATCH (wall1:IfcWall {GlobalId:"W-01"})
MATCH (wall2:IfcWall {GlobalId:"W-02"})
MATCH (wall3:IfcWall {GlobalId:"W-03"})
MATCH (wall4:IfcWall {GlobalId:"W-04"})

MATCH (door1:IfcDoor {GlobalId:"D-01"})
MATCH (door2:IfcDoor {GlobalId:"D-02"})
MATCH (door3:IfcDoor {GlobalId:"D-03"})

MATCH (window1:IfcWindow {GlobalId:"WIN-01"})
MATCH (window2:IfcWindow {GlobalId:"WIN-02"})

MATCH (hvac:IfcFurnishingElement {GlobalId:"HVAC-01"})

// ---------- Beziehungen ----------

MERGE (room1)-[:CONTAINS]->(wall1)
MERGE (room1)-[:CONTAINS]->(wall3)
MERGE (room1)-[:CONTAINS]->(door1)
MERGE (room1)-[:CONTAINS]->(window1)

MERGE (room2)-[:CONTAINS]->(wall2)
MERGE (room2)-[:CONTAINS]->(wall3)
MERGE (room2)-[:CONTAINS]->(door2)
MERGE (room2)-[:CONTAINS]->(window2)

MERGE (room3)-[:CONTAINS]->(wall4)
MERGE (room3)-[:CONTAINS]->(door3)
MERGE (room3)-[:CONTAINS]->(hvac)

