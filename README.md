# SQL Piscine Bootcamp: Research-Grade Investigations in Advanced Relational Database Systems and SQL Methodologies

This repository encompasses a curated suite of research-intensive projects and experiments developed under the SQL Piscine Bootcamp, an advanced academic initiative centered on relational database systems and contemporary SQL engineering practices. The curriculum is designed to bridge fundamental database theory with the demands of modern data-driven systems, fostering both technical proficiency and research acumen.

## Overview

The educational arc of the bootcamp transitions from foundational constructs—relational algebra, entity-relationship (ER) modeling, and normalization theory—to advanced SQL querying paradigms, recursive algorithms for hierarchical data processing, rigorous transaction management compliant with ACID properties, and automated event auditing via trigger systems. Simultaneously, the bootcamp addresses Extract-Transform-Load (ETL) pipeline construction, Online Analytical Processing (OLAP) schema modeling, and systemic approaches to query and workload optimization.

A distinctive aspect of the program is its engagement with algorithmic modeling challenges, notably the formulation and resolution of the Traveling Salesman Problem (TSP) within SQL constraints. The course fosters competencies in operational data management, analytical data architecture, and hybrid LakeHouse systems, aligning academic inquiry with emergent industry standards.

## Core Domains of Scholarly Inquiry

- Foundations and applied techniques in relational modeling and third normal form (3NF) compliance
- Complex query construction, cost-based optimization, and plan analysis
- Recursive Common Table Expressions (CTEs) and hierarchical query models
- OLAP data cube design, dimension modeling, and analytical aggregation strategies
- Transaction management focusing on concurrency control and anomaly detection (Lost Update, Phantom Read)
- Trigger-based change data capture (CDC) and audit trail architectures
- Procedural and functional programming in PL/pgSQL for business logic integration
- Materialized view construction, maintenance, and impact on query performance
- Full-text search implementation, indexing strategies (B-Tree, GIN, GiST)
- ETL methodologies, data cleansing protocols, and metadata management
- Data governance frameworks: data retention, archival strategies, and GDPR compliance considerations
- Recursive graph traversal algorithms implemented in SQL
- LakeHouse architectural synthesis: balancing OLTP and OLAP system requirements

## Repository Structure and Thematic Progression

The organization of this repository mirrors a progressive deepening of theoretical understanding and applied mastery:

- **Day 00–Day 06:** Elementary to intermediate SQL querying, advanced set operations, and recursive structures
- **Day 07:** OLAP-centric schema modeling, star and snowflake schema elaboration
- **Day 08:** In-depth examination of transaction anomalies and systemic consistency strategies
- **Day 09:** Implementation of advanced procedural logic and automation through PostgreSQL triggers
- **Team 00:** Algorithmic modeling and recursive SQL formulation of the Traveling Salesman Problem
- **Team 01:** Design and execution of ETL processes, construction of a classical Data Warehouse (DWH), and temporal data modeling

## Technological and Methodological Stack

- **PostgreSQL:** Principal RDBMS platform utilized for all practical engagements
- **SQL / PL/pgSQL:** Languages for query development, schema evolution, and procedural extensions
- **pgbench:** Benchmarking and stress testing framework for transactional throughput and system latency assessment
- **Flyway:** Schema migration tool enabling continuous integration and delivery in database environments
- **DataGrip / pgAdmin:** Database management and diagnostic environments facilitating administrative and analytic tasks

## Environment Deployment and Reproducibility Protocol

To replicate experimental environments and validate outcomes:

1. Install the latest stable release of PostgreSQL, ensuring activation of necessary extensions such as `pg_trgm` and `btree_gin`.
2. Provision a dedicated database instance configured with tuned parameters for performance testing.
3. Sequentially deploy schema and dataset scripts corresponding to each module.
4. Execute and analyze experimental queries using diagnostic utilities such as `EXPLAIN ANALYZE` and visualize query plans for performance profiling.
5. Document experimental procedures, optimization strategies employed, and observed system behaviors for subsequent review and extension.

## Academic and Research Orientation

The projects assembled in this repository are designed not merely as skill exercises but as contributions toward cultivating research-oriented database professionals. By integrating foundational theory with emerging system architectures, the body of work herein aims to prepare practitioners for critical inquiry, system innovation, and scholarly advancement in the field of relational database engineering and large-scale data management.

## Author

**Project Author**: Dich21
