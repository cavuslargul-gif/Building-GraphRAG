// ---------- Dokumente ----------

MERGE (floorPlan:Document {DocumentId:"DOC-01"})
SET floorPlan.name="Grundriss Erdgeschoss",
    floorPlan.status = "Approved",
    floorPlan.statusChangedAt = datetime(),
    floorPlan.statusNote = "Approved for construction" 

MERGE (fireReport:Document {DocumentId:"DOC-02"})
SET fireReport.name="Brandschutzprotokoll",
    fireReport.status = "In Review",
    fireReport.statusChangedAt = datetime(),
    fireReport.statusNote = "Waiting for fire safety approval"

MERGE (maintenance:Document {DocumentId:"DOC-03"})
SET maintenance.name="Wartungsprotokoll Lüftung",
    maintenance.status = "Open",
    maintenance.statusChangedAt = datetime(),
    maintenance.statusNote = "Initial version"

MERGE (acceptance:Document {DocumentId:"DOC-04"})
SET acceptance.name="Abnahmeprotokoll",
    acceptance.status = "Approved",
    acceptance.statusChangedAt = datetime(),
    acceptance.statusNote = "Final acceptance completed"

// ---------- Bauteile suchen ----------

MATCH (wall3:IfcWall {GlobalId:"W-03"})
MATCH (hvac:IfcFurnishingElement {GlobalId:"HVAC-01"})
MATCH (building:IfcBuilding {GlobalId:"B-01"})

MATCH (floorPlan:Document {DocumentId:"DOC-01"})
MATCH (fireReport:Document {DocumentId:"DOC-02"})
MATCH (maintenance:Document {DocumentId:"DOC-03"})
MATCH (acceptance:Document {DocumentId:"DOC-04"})

// ---------- Beziehungen ----------

MERGE (building)-[:HAS_DOCUMENT]->(floorPlan)

MERGE (wall3)-[:HAS_DOCUMENT]->(fireReport)

MERGE (hvac)-[:HAS_DOCUMENT]->(maintenance)

MERGE (building)-[:HAS_DOCUMENT]->(acceptance)

