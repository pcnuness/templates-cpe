# Provisionamento de CloudFront com S3

Este repositório foi criado pelo Backstage Scaffolder para provisionar:
- **Nome do Bucket**: ${{ values.bucketName | dump}}
- **ARN do Certificado ACM**: ${{ values.acmCertificateArn | dump}}
- **Domínio CloudFront**: ${{values.cloudFrontAlias | dump}}

## Detalhes do Repositório
- **Nome do repositório**: ${{ values.repoName | dump}}
- **Dono do projeto**: ${{ values.projectOwner | dump}}
