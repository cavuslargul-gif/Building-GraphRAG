// ---------- Materialien ----------

MERGE (concrete:Material {MaterialId:"MAT-01"})
SET concrete.name="Stahlbeton"

MERGE (glass:Material {MaterialId:"MAT-02"})
SET glass.name="Glas"

MERGE (wood:Material {MaterialId:"MAT-03"})
SET wood.name="Holz"

MERGE (steel:Material {MaterialId:"MAT-04"})
SET steel.name="Stahl"

// ---------- Bauteile suchen ----------

MATCH (wall1:IfcWall {GlobalId:"W-01"})
MATCH (wall2:IfcWall {GlobalId:"W-02"})
MATCH (wall3:IfcWall {GlobalId:"W-03"})
MATCH (wall4:IfcWall {GlobalId:"W-04"})

MATCH (door1:IfcDoor {GlobalId:"D-01"})
MATCH (door2:IfcDoor {GlobalId:"D-02"})
MATCH (door3:IfcDoor {GlobalId:"D-03"})

MATCH (window1:IfcWindow {GlobalId:"WIN-01"})
MATCH (window2:IfcWindow {GlobalId:"WIN-02"})

MATCH (concrete:Material {MaterialId:"MAT-01"})
MATCH (glass:Material {MaterialId:"MAT-02"})
MATCH (wood:Material {MaterialId:"MAT-03"})
MATCH (steel:Material {MaterialId:"MAT-04"})

// ---------- Beziehungen ----------

// Wände
MERGE (wall1)-[:MADE_OF]->(concrete)
MERGE (wall2)-[:MADE_OF]->(concrete)
MERGE (wall3)-[:MADE_OF]->(concrete)
MERGE (wall4)-[:MADE_OF]->(concrete)

// Türen
MERGE (door1)-[:MADE_OF]->(wood)
MERGE (door2)-[:MADE_OF]->(wood)
MERGE (door3)-[:MADE_OF]->(steel)

// Fenster
MERGE (window1)-[:MADE_OF]->(glass)
MERGE (window2)-[:MADE_OF]->(glass)



