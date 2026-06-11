/*
 * Copyright (c) 2026 Technovative Solutions
 * Copyright (c) 2026 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Apache License, Version 2.0 which is available at
 * https://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

-- EDC 0.17.0: credential_definitions schema change (IH PR #941, "additional JSON-LD
-- context on issuance"):
--   - Added column: additional_context (JSON NOT NULL DEFAULT '[]')
--     Holds extra JSON-LD @context entries to embed in credentials issued from this
--     definition. The new CredentialDefinition.additionalContext field is mapped by
--     SqlCredentialDefinitionStore; without this column any credential-definition
--     create/read fails on a database created by V0_0_1.
-- Idempotent (IF NOT EXISTS); a no-op on fresh databases already provisioned by 0.17.0.

ALTER TABLE credential_definitions ADD COLUMN IF NOT EXISTS additional_context JSON NOT NULL DEFAULT '[]';
