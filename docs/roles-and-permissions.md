# Roles and Permissions (Strapi)

## PortalUser
Create a custom role in Strapi Admin:
- Can create/update only their own entries for `News`, `Material`, `Schedule`.
- Can read their own entries + `submissionStatus` + `moderatorComment`.
- Cannot publish content.
- Should have permissions on custom portal routes from `docs/portal-api.md`.
- If users upload files from portal UI, enable `plugin::upload.content-api.upload`.

## Moderator
- Access to Strapi admin panel.
- Can read entries with `submissionStatus = submitted`.
- Can edit entries, change `submissionStatus`, and publish.

## Notes
- Ownership enforcement is implemented at API layer in Stage 3 (portal endpoints + policies).
- Strapi admin access should be restricted to moderators (later: VPN/IP allowlist).
