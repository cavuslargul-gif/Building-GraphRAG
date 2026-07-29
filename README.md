# Building GraphRAG

<img width="1113" height="498" alt="v_n_d" src="https://github.com/user-attachments/assets/42ce8edf-1d57-44f6-9200-08fba0afbae8" />

Figure 1. Example visualization of the Building Knowledge Graph.

## Project Description

Building GraphRAG demonstrates how Building Information Modeling (BIM) data can be represented as a Neo4j knowledge graph.

The Building Knowledge Graph combines buildings, spaces, building elements, documents, materials, standards, responsibilities and process information to support graph-based querying, GraphRAG retrieval and future AI-assisted workflows.

This repository serves as a portfolio project demonstrating graph modeling, Cypher querying and domain-driven knowledge graph design.

---

## Architecture

The repository is organized into modular Cypher scripts. Each file is responsible for one part of the knowledge graph and can be executed independently after the database has been reset.

This modular structure keeps the project maintainable, extensible and easy to understand.

---

## Data Model

The current implementation models the following domain entities, relationships and shared process properties.

### Labels

```
IfcBuilding
IfcBuildingStorey
IfcSpace
IfcWall
IfcDoor
IfcWindow
IfcFurnishingElement
Document
Material
Norm
Role
Issue
```

### Relationships

```
HAS_STOREY
HAS_SPACE
CONTAINS
HAS_DOCUMENT
MADE_OF
COMPLIES_WITH
HAS_ISSUE
RESPONSIBLE_FOR
DESIGNED
MANAGED
INSPECTED
```

### Shared Process Properties

```
status
statusChangedAt
statusNote
```

---

## Shared Process Model

The Building Knowledge Graph distinguishes between domain entities (e.g. buildings, documents or issues) and shared process metadata.

Several domain entities share a common set of process properties to enable consistent workflow tracking, reporting, GraphRAG retrieval and future workflow automation.

### Shared Process Properties

| Property | Description |
|----------|-------------|
| `status` | Current processing state of an entity. |
| `statusChangedAt` | Timestamp of the latest status change. |
| `statusNote` | Optional note describing the current status or latest process event. |

### Status Values

The process model defines a shared set of possible status values. The applicable values depend on the entity type.

Common examples include:

- Open
- No Review
- In Review
- Needs Revision
- Approved
- Paused
- Closed
- Cancelled

> **Note:** Not every status is meaningful for every entity. For example, an Issue may be **Open** or **Closed**, whereas a Document is typically **No Review**, **In Review**, **Needs Revision**, or **Approved**.

### Design Principles

The shared process model follows these principles:

- Process information is stored as node properties rather than separate status nodes.
- A consistent property model is reused across multiple entity types.
- Status values depend on the domain entity.
- The model is intentionally lightweight and can be extended with workflow history if required.
- The current implementation stores only the latest process state. Historical status changes can be modeled later as dedicated graph entities if workflow traceability becomes necessary.

### Current Implementation

| Entity | Implemented |
|---------|:-----------:|
| Issue | ✅ |
| Document | ✅ |

### Planned Extensions

| Entity | Planned |
|---------|:-------:|
| Project | ⬜ |
| Work Order | ⬜ |
| Purchase Order | ⬜ |
| Inventory | ⬜ |

### Example Use Cases

The shared process model enables queries such as:

- How many open issues currently exist?
- Which documents are currently under review?
- Which documents have already been approved?
- Who is responsible for open issues?
- Which open issues exist in a specific room?

These queries provide the foundation for operational reporting, GraphRAG retrieval, business analytics and future workflow automation.

---

## Repository Structure

The project is organized into modular Cypher scripts that can be executed sequentially to build the complete knowledge graph.

```
01_constraints.cypher
02_building.cypher
03_elements.cypher
04_documents.cypher
05_materials.cypher
06_norms.cypher
07_roles.cypher
08_issues.cypher
09_queries.cypher
10_cleanup.cypher
README.md
```

---

## Getting Started

1. Open Neo4j Browser.
2. Execute `10_cleanup.cypher` (optional during development).
3. Execute `01_constraints.cypher`.
4. Execute the remaining scripts in numerical order.
5. Execute `09_queries.cypher` to explore the knowledge graph.

---

## Queries

The repository contains example Cypher queries grouped into four categories:

- Basic Queries
- Relationship Queries
- Business Queries
- Process Queries

Together they demonstrate how the Building Knowledge Graph can be explored, traversed and queried from both a technical and business perspective.

---

## Future Extensions

The current implementation represents Version 1.0 of the Building Knowledge Graph.

Future development may include:

- Project entities
- Work orders
- Purchase orders
- Inventory management
- Workflow history
- IFC import
- GraphRAG integration
- AI agent workflows

---

## Repository Goals

The goal of this project is to demonstrate:

- Knowledge graph modeling with Neo4j
- Domain-driven graph design
- Cypher query development
- Building information management
- Shared process modeling
- GraphRAG-ready data structures

---

## Technologies

- Neo4j
- Cypher
- Graph Database
- Knowledge Graph
- Building Information Modeling (BIM)
- GraphRAG

---

## License

This repository is published for educational and portfolio purposes.
