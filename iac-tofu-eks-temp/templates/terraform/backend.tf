https://github.com/${{ parameters.repoUrl | parseRepoUrl | pick('owner') }}/${{ values.projectName }}

