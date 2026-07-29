// ============================================================================
// Neo4j Constraints
// ============================================================================
//
// description:
// Defines unique constraints for all node types in the Building Graph.
//
// ============================================================================


// ============================================================================
// Building Structure
// ============================================================================

CREATE CONSTRAINT building_id IF NOT EXISTS
FOR (b:IfcBuilding)
REQUIRE b.GlobalId IS UNIQUE;

CREATE CONSTRAINT storey_id IF NOT EXISTS
FOR (s:IfcBuildingStorey)
REQUIRE s.GlobalId IS UNIQUE;

CREATE CONSTRAINT space_id IF NOT EXISTS
FOR (s:IfcSpace)
REQUIRE s.GlobalId IS UNIQUE;

// ============================================================================
// Building Elements
// ============================================================================

CREATE CONSTRAINT wall_id IF NOT EXISTS
FOR (w:IfcWall)
REQUIRE w.GlobalId IS UNIQUE;

CREATE CONSTRAINT door_id IF NOT EXISTS
FOR (d:IfcDoor)
REQUIRE d.GlobalId IS UNIQUE;

CREATE CONSTRAINT window_id IF NOT EXISTS
FOR (w:IfcWindow)
REQUIRE w.GlobalId IS UNIQUE;

CREATE CONSTRAINT furnishing_id IF NOT EXISTS
FOR (f:IfcFurnishingElement)
REQUIRE f.GlobalId IS UNIQUE;

// ============================================================================
// Documents
// ============================================================================

CREATE CONSTRAINT document_id IF NOT EXISTS
FOR (d:Document)
REQUIRE d.DocumentId IS UNIQUE;

// ============================================================================
// Materials
// ============================================================================

CREATE CONSTRAINT material_id IF NOT EXISTS
FOR (m:Material)
REQUIRE m.MaterialId IS UNIQUE;

// ============================================================================
// Standards
// ============================================================================

CREATE CONSTRAINT norm_id IF NOT EXISTS
FOR (n:Norm)
REQUIRE n.NormId IS UNIQUE;

// ============================================================================
// Roles
// ============================================================================

CREATE CONSTRAINT role_id IF NOT EXISTS
FOR (r:Role)
REQUIRE r.RoleId IS UNIQUE;

// ============================================================================
// Issues
// ============================================================================

CREATE CONSTRAINT issue_id IF NOT EXISTS
FOR (i:Issue)
REQUIRE i.IssueId IS UNIQUE;

