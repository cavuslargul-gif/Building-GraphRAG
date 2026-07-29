// Gebäude anlegen
MERGE (building:IfcBuilding {GlobalId: "B-01"})
SET building.name = "Portfolio Tower"

// Stockwerk anlegen
MERGE (storey:IfcBuildingStorey {GlobalId: "S-01"})
SET storey.name = "Erdgeschoss"

// Räume anlegen
MERGE (room1:IfcSpace {GlobalId: "R-01"})
SET room1.name = "Büro 1"

MERGE (room2:IfcSpace {GlobalId: "R-02"})
SET room2.name = "Büro 2"

MERGE (room3:IfcSpace {GlobalId: "R-03"})
SET room3.name = "Flur"

// Beziehungen anlegen
MERGE (building)-[:HAS_STOREY]->(storey)

MERGE (storey)-[:HAS_SPACE]->(room1)
MERGE (storey)-[:HAS_SPACE]->(room2)
MERGE (storey)-[:HAS_SPACE]->(room3)

