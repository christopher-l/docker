# Personal Self-hosting Config

## Backup

Relevant files and folders for backup in each project:

| Name      | Type | Description                                                                                                   |
| --------- | ---- | ------------------------------------------------------------------------------------------------------------- |
| data      | Dir  | Contains data that needs processing to be safely backed up while the service is running, e.g., database files |
| backup.sh | File | Script for backing up and restoring `data` (see below)                                                        |

Everything except `data` will be included in the backup.

### `backup.sh`

The script `backup.sh` is expected to implement three commands:
| Command | Description |
| ---------- | ------------------------------------------------------------------------------------------------------------- |
| backup | Backs up the contents of `data` to some other location within the project folder while the service is running |
| restore | Restores the contents of `data` to an empty `data` directory |
| restore_online | Indicates if a service needs to be running to restore the backup (see below) |

### `restore_online`

The command `restore_online` has to exit in one of the following ways

| Exit code | Output           | Description                                                                     |
| --------- | ---------------- | ------------------------------------------------------------------------------- |
| 0         | _no output_      | All services have to be up and running when restoring the backup                |
| 0         | `<service name>` | The service `<service name>` has to be up and running when restoring the backup |
| 1         | _no output_      | All services have to be stopped when restoring the backup                       |
