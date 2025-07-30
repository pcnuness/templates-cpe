## 🔄 Atualização de Addons GitOps

**Operação:** {{ values.operationText }} de addons
**Prioridade:** {{ values.priority }}
**Solicitado via:** Backstage Scaffolder
**Repositório:** {{ values.repoOwner }}/{{ values.repoName }}

### 📦 Addons Selecionados:
{% if values.enableAwsAlbController %}
- ✅ AWS Load Balancer Controller
{% endif %}
{% if values.enableIngressNginx %}
- ✅ Ingress NGINX
{% endif %}
{% if values.enableArgoCdIngress %}
- ✅ ArgoCD Ingress
{% endif %}
{% if values.enableCrossplane %}
- ✅ Crossplane
{% endif %}
{% if values.enableKarpenter %}
- ✅ Karpenter
{% endif %}
{% if values.enableKubePrometheusStack %}
- ✅ Kube Prometheus Stack
{% endif %}
{% if values.enableMetricsServer %}
- ✅ Metrics Server
{% endif %}

### 🔍 Checklist de Revisão:
- [ ] Validar sintaxe YAML dos arquivos
- [ ] Verificar compatibilidade com cluster existente
- [ ] Confirmar configurações de recursos (CPU/Memory)
- [ ] Validar dependências entre addons
- [ ] Testar em ambiente de desenvolvimento (se aplicável)

### 🚀 Próximos Passos Pós-Merge:
1. ArgoCD detectará automaticamente as mudanças
2. Monitorar logs de sincronização no ArgoCD
3. Validar saúde dos addons no cluster
4. Executar testes de conectividade (se aplicável)

### 🔄 Rollback:
Em caso de problemas, reverter este PR ou aplicar:
```bash
kubectl delete -f <arquivo-addon-problemático>