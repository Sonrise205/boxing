# Boxing Game - Data Structure & Remote Interactions Analysis

## Executive Summary

This document provides a detailed analysis of the data structure implementation found in the decompiled scripts and identifies which remote systems interact most heavily with it.

---

## 1. Primary Data Structure: Vapor Framework

### Overview

The game utilizes a custom state management framework called **Vapor** located in the ReplicatedFirst service. Vapor is a modular data replication system composed of four core components:

```
Vapor/
├── InstanceReplication  - Handles client-server state synchronization
├── ReplicatedStore      - Remote-aware store with automatic replication
├── StoreInterface       - Chainable path-based accessor for store values
└── GeneralStore         - Core reactive state container (local-only)
```

### Data Type Category: **Hierarchical Observable State Tree**

The data structure fits within the category of a **Reactive Nested Dictionary/Map with Path-Based Subscriptions**. More specifically, it can be classified as:

| Category | Description |
|----------|-------------|
| **Primary Type** | Nested Dictionary (Lua Table) |
| **Pattern** | Observer/Observable Pattern with Event-Driven Updates |
| **Structure** | Hierarchical Tree with Path-Based Addressing |
| **Access Pattern** | Path Arrays (e.g., `{"PlayerData", "Cash", "Value"}`) |
| **Replication Model** | Server-Authoritative with Client Sync via RemoteEvents |

---

## 2. Core Data Structure Implementation

### 2.1 GeneralStore (Base Layer)

The `GeneralStore` is the foundational reactive state container. Key characteristics:

**Data Storage:**
```lua
-- Internal structure is a nested Lua table
local v34 = {};  -- Root state container

-- Path delimiter for flattened event keys
_FlatPathDelimiter = "^"  -- Used for signal lookups
```

**Key Methods:**
| Method | Purpose |
|--------|---------|
| `Get(path, default)` | Retrieve value at path with optional default |
| `Set(path, value)` | Set value at path, triggers change events |
| `Merge(data)` | Deep merge data into store |
| `Await(path, timeout)` | Wait for value to exist at path |
| `GetValueChangedSignal(path)` | Get signal for path value changes |
| `GetSubValueChangedSignal(path)` | Get signal for any child value changes |

**Special Sentinel Value:**
```lua
local REMOVE_NODE = { REMOVE_NODE = true }  -- Used to mark deletions in merges
```

### 2.2 ReplicatedStore (Network Layer)

The `ReplicatedStore` wraps GeneralStore with network replication capabilities:

**Server-Side:**
- Manages player-specific data synchronization
- Supports exclusive sync (data visible only to specific players)
- Batches updates before transmission using deferred processing

**Client-Side:**
- Connects to `RemoteEvent.OnClientEvent` for incoming data
- Parses incoming data with `ConvertIncomingData()` to handle numeric key conversion
- Waits for `InitialSync` flag before processing updates

**Wire Protocol:**
```lua
{
    InitialSync = boolean,  -- true for first full sync
    Data = table            -- Nested data payload
}
```

### 2.3 StoreInterface (Access Layer)

Provides a fluent, chainable API for accessing store values:

```lua
-- Creates path chains dynamically
Store.PlayerData.Cash:Get()
Store.PlayerData.Style:Set("Basic")
Store.PlayerData.Gloves:Increment(1)

-- Type checking methods
:IsContainer()  -- Is the value a table?
:IsArray()      -- Is it an array (has [1])?
:IsMap()        -- Is it a dictionary?
:IsLeaf()       -- Is it a primitive value?
:IsEmpty()      -- Is it an empty table?
```

---

## 3. State Organization

### 3.1 Player State Hierarchy

Based on the scripts, the game organizes player state in `Workspace.States`:

```
Workspace/
└── States/
    └── [PlayerName]/
        ├── PlayerData/
        │   ├── Style (StringValue)
        │   ├── Cash (NumberValue)
        │   ├── KnockdownSet (StringValue)
        │   ├── Disable (BoolValue)
        │   └── ... (more attributes)
        ├── CharacterData/
        │   ├── Stamina (NumberValue)
        │   ├── MaxStamina (NumberValue)
        │   ├── BlockEnergy (NumberValue)
        │   ├── UltimateEnergy (NumberValue)
        │   ├── Stunned (BoolValue)
        │   ├── Cutscene (BoolValue)
        │   ├── Opponent (ObjectValue)
        │   ├── Centre (ObjectValue)
        │   └── ... (more attributes)
        └── Occupied/
            ├── Equipped (BoolValue)
            ├── LockedOn (ObjectValue)
            └── ... (more state)
```

### 3.2 Event Store Structure

Events use the Vapor InstanceReplication system:

```lua
_EventsStore = Vapor.InstanceReplication(Workspace, "Events")

-- Event data structure:
EventStore[EventName] = {
    Source = string,           -- "Player/UserId" or "External/Name"
    StartTimestamp = number,
    EndTimestamp = number
}
```

---

## 4. Remote Interaction Analysis

### 4.1 Primary Remote Systems

The game uses **two primary remote communication systems**:

#### A. BridgeNet2 (High-Frequency Game Events)

BridgeNet2 is an optimized networking library that batches and compresses remote calls:

| Bridge Name | Category | Traffic Level |
|-------------|----------|---------------|
| `TryAttack` | Combat | **Very High** |
| `ReplicateTryAttack` | Combat | **Very High** |
| `ReplicateLanded` | Combat | **Very High** |
| `TryAbility` | Combat | High |
| `CreateEffect` | VFX | **Very High** |
| `HandleBlock` | Combat | High |
| `UsedDash` | Movement | High |
| `SimulateKnockback` | Physics | High |
| `PingBridge` | Network | High |
| `SettledPing` | Network | Medium |

#### B. Vapor InstanceReplication (State Synchronization)

Used for persistent state that needs automatic replication:

| Store | Purpose | Interaction Level |
|-------|---------|-------------------|
| `Events` | Game events (2x XP, etc.) | Medium |
| Player State | Via ValueObjects in Workspace.States | **Very High** |

### 4.2 Remote Categories by Interaction Volume

#### **Tier 1: Highest Interaction (Combat Core)**

These remotes are fired every frame or every combat action:

1. **`CreateEffect`** (UnreliableRemoteEvent)
   - Purpose: Visual effect replication
   - Frequency: Every hit, dash, ability, animation
   - Data: Effect arrays with parameters
   
2. **`TryAttack`** / **`ReplicateTryAttack`**
   - Purpose: Attack initiation and replication
   - Frequency: Every punch, heavy, ultimate
   - Interacts with: `CharacterData.Stamina`, `PlayerData.Style`

3. **`ReplicateLanded`**
   - Purpose: Hit confirmation
   - Frequency: Every successful hit
   - Interacts with: Damage calculations, knockdowns

#### **Tier 2: High Interaction (Gameplay)**

4. **`HandleBlock`**
   - Purpose: Block state management
   - Interacts with: `CharacterData.BlockEnergy`

5. **`UsedDash`** / **`SimulateKnockback`**
   - Purpose: Movement synchronization
   - Interacts with: `CharacterData.Stamina`, position state

6. **`HandleEquip`**
   - Purpose: Glove/style equipment
   - Interacts with: `PlayerData.Style`, inventory data

#### **Tier 3: Medium Interaction (Economy/Progression)**

7. **`PurchaseGloves`** / **`EquipMap`**
   - Purpose: Shop transactions
   - Interacts with: `PlayerData.Cash`, inventory

8. **`UseToken`** / **`UseShards`**
   - Purpose: Currency usage
   - Interacts with: Player currency data

9. **`UpdateSettings`** / **`GetSettings`**
   - Purpose: Player preferences
   - Interacts with: Settings store

#### **Tier 4: Lower Interaction (Utility)**

10. **`BasicMessage`** / **`SystemChatMessage`**
    - Purpose: UI notifications
    
11. **`NPCChat`**
    - Purpose: NPC dialogue bubbles

12. **`UpdateLeaderboard`** / **`SyncEventProgress`**
    - Purpose: Leaderboard and progression sync

---

## 5. Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         SERVER                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                    GeneralStore                          │   │
│  │  (Reactive State Container - Nested Dictionary)          │   │
│  └──────────────────────────┬──────────────────────────────┘   │
│                              │                                   │
│  ┌──────────────────────────▼──────────────────────────────┐   │
│  │                  ReplicatedStore                         │   │
│  │  (Network-Aware Wrapper with Deferred Batching)          │   │
│  │                                                          │   │
│  │  • Merge() → Queues changes per player                   │   │
│  │  • Set() → Builds path, queues change                    │   │
│  │  • ExclusiveSync() → Player-specific data                │   │
│  └──────────────────────────┬──────────────────────────────┘   │
│                              │                                   │
│  ┌──────────────────────────▼──────────────────────────────┐   │
│  │              RemoteEvent (Partition)                     │   │
│  │  • FireClient() with batched { InitialSync, Data }       │   │
│  └──────────────────────────┬──────────────────────────────┘   │
└──────────────────────────────┼──────────────────────────────────┘
                               │
                    ═══════════╪═══════════ NETWORK
                               │
┌──────────────────────────────┼──────────────────────────────────┐
│                         CLIENT                                   │
│  ┌──────────────────────────▼──────────────────────────────┐   │
│  │              RemoteEvent.OnClientEvent                   │   │
│  │  • Receives { InitialSync, Data }                        │   │
│  │  • ConvertIncomingData() - Numeric key handling          │   │
│  └──────────────────────────┬──────────────────────────────┘   │
│                              │                                   │
│  ┌──────────────────────────▼──────────────────────────────┐   │
│  │                  ReplicatedStore                         │   │
│  │  (Client-side, receives merges only)                     │   │
│  └──────────────────────────┬──────────────────────────────┘   │
│                              │                                   │
│  ┌──────────────────────────▼──────────────────────────────┐   │
│  │                  StoreInterface                          │   │
│  │  (Chainable accessors + value change signals)            │   │
│  │                                                          │   │
│  │  Store.Events.DoubleXP:GetValueChangedSignal()           │   │
│  │  Store.Events.DoubleXP.EndTimestamp:Await()              │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

---

## 6. Key Findings

### 6.1 Data Structure Classification

| Aspect | Classification |
|--------|----------------|
| **Category** | Nested Dictionary / Hierarchical State Tree |
| **Pattern** | Observer Pattern with Path-Based Subscriptions |
| **Paradigm** | Reactive / Event-Driven |
| **Mutability** | Mutable with Change Tracking |
| **Serialization** | JSON-compatible (via HttpService) |

### 6.2 Most Interactive Remotes with Data Structure

**Top 5 by Data Structure Interaction:**

1. **BridgeNet2 Combat Remotes** (`TryAttack`, `ReplicateLanded`, etc.)
   - Read: `PlayerData.Style`, `CharacterData.Stamina/BlockEnergy/UltimateEnergy`
   - Write: Character attributes, combat state
   
2. **Vapor InstanceReplication** (State partition remotes)
   - Read/Write: Entire player state hierarchy
   - Sync: Full state tree on join, deltas during gameplay

3. **`CreateEffect`** (Unreliable Remote)
   - Read: Character transforms, style data
   - No direct data write, but highest call frequency

4. **Equipment Remotes** (`EquipMap`, `PurchaseGloves`, `HandleEquip`)
   - Read: `PlayerData.Cash`, inventory
   - Write: `PlayerData.Style`, equipped items

5. **Event Remotes** (`BasicMessage`, `UpdateLeaderboard`)
   - Read: Event store
   - Write: Event state via ServerEvents component

---

## 7. Technical Recommendations

For any modifications or extensions to this system:

1. **Path-Based Access**: Always use path arrays for store access to maintain consistency
2. **Batching**: Leverage the deferred processing to batch multiple changes
3. **Exclusive Sync**: Use `ExclusiveSync()` for player-sensitive data
4. **Signal Cleanup**: Always disconnect `GetValueChangedSignal` connections on cleanup
5. **Type Safety**: Use `IsContainer()`, `IsArray()`, etc. before operations

---

*Analysis completed on: January 16, 2026*  
*Scripts analyzed: 1620 decompiled Luau files*
