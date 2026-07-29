// ---------- Rollen ----------

MERGE (architect:Role {RoleId:"R-01"})
SET architect.name="Architekt",
    architect.organization="Architektur Müller GmbH",
    architect.department="Planung"

MERGE (siteManager:Role {RoleId:"R-02"})
SET siteManager.name="Bauleiter",
    siteManager.organization="Bau AG",
    siteManager.department="Bauleitung"

MERGE (facilityManager:Role {RoleId:"R-03"})
SET facilityManager.name="Facility Manager",
    facilityManager.organization="FM Services GmbH",
    facilityManager.department="Gebäudemanagement"

MERGE (inspector:Role {RoleId:"R-04"})
SET inspector.name="Prüforganisation",
    inspector.organization="TÜV Nord",
    inspector.department="Brandschutz"

// ---------- Objekte suchen ----------

MATCH (building:IfcBuilding {GlobalId:"B-01"})

MATCH (wall3:IfcWall {GlobalId:"W-03"})

MATCH (hvac:IfcFurnishingElement {GlobalId:"HVAC-01"})

MATCH (architect:Role {RoleId:"R-01"})
MATCH (siteManager:Role {RoleId:"R-02"})
MATCH (facilityManager:Role {RoleId:"R-03"})
MATCH (inspector:Role {RoleId:"R-04"})

// ---------- Beziehungen ----------

MERGE (architect)-[:DESIGNED]->(building)

MERGE (siteManager)-[:MANAGED]->(building)

MERGE (facilityManager)-[:RESPONSIBLE_FOR]->(hvac)

MERGE (inspector)-[:INSPECTED]->(wall3)

