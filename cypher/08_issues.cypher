// ============================================================================
// Issues
// ============================================================================
//
// description:
// Represents defects, clashes, observations and other project-related issues.
//
// Current Process Metadata:
// - status
// - statusChangedAt
// - statusNote
//
// Example status Values:
// - Open
// - In Review
// - Needs Revision
// - Approved
// - Closed
//
// ============================================================================


MERGE (issue1:Issue {IssueId:"ISS-FIRE-001"})
SET issue1.title="Riss in Brandschutzwand",
    issue1.description = "Riss in Brandschutzwand",
    issue1.area = "Büro 1",
    issue1.category = "Brandschutz",
    issue1.status = "Open",
    issue1.statusChangedAt = datetime(),
    issue1.statusNote = "Issue created",
    issue1.priority = "High"

MERGE (issue2:Issue {IssueId:"ISS-HVAC-001"})
SET issue2.title="Lüftungswartung überfällig",
    issue2.description = "Lüftungswartung überfällig",
    issue2.area="Flur",
    issue2.category="Lüftung",
    issue2.status = "Open",
    issue2.statusChangedAt = datetime(),
    issue2.statusNote = "Issue created",
    issue2.priority="Medium"

MERGE (issue3:Issue {IssueId:"ISS-DOOR-001"})
SET issue3.title="Tür schließt nicht richtig",
    issue3.description = "Tür schließt nicht richtig",
    issue3.category="Tür",
    issue3.status="In Review",
    issue3.statusChangedAt = datetime(),
    issue3.statusNote = "Issue created",
    issue3.priority="Low"

// ---------- Objekte suchen ----------

MATCH (wall3:IfcWall {GlobalId:"W-03"})
MATCH (hvac:IfcFurnishingElement {GlobalId:"HVAC-01"})
MATCH (door1:IfcDoor {GlobalId:"D-01"})

MATCH (inspector:Role {RoleId:"R-04"})
MATCH (facilityManager:Role {RoleId:"R-03"})

MATCH (issue1:Issue {IssueId:"ISS-FIRE-001"})
MATCH (issue2:Issue {IssueId:"ISS-HVAC-001"})
MATCH (issue3:Issue {IssueId:"ISS-DOOR-001"})

// ---------- Beziehungen ----------

MERGE (wall3)-[:HAS_ISSUE]->(issue1)

MERGE (hvac)-[:HAS_ISSUE]->(issue2)

MERGE (door1)-[:HAS_ISSUE]->(issue3)

MERGE (inspector)-[:RESPONSIBLE_FOR]->(issue1)

MERGE (facilityManager)-[:RESPONSIBLE_FOR]->(issue2)


