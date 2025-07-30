## 🔄 Atualização de Addons GitOps

**Operação:** ${{ values.operation === 'add' ? 'Adição' : 'Remoção' }} de addons
**Prioridade:** ${{ values.priority }}
**Solicitado via:** Backstage Scaffolder

### 📦 Addons Afetados:
{% if values.enableAwsAlbController %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: AWS Load Balancer Controller
{% endif %}
{% if values.enableIngressNginx %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: Ingress NGINX
{% endif %}
{% if values.enableArgoCdIngress %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: ArgoCD Ingress
{% endif %}
{% if values.enableCrossplane %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: Crossplane
{% endif %}
{% if values.enableKarpenter %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: Karpenter
{% endif %}
{% if values.enableKubePrometheusStack %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: Kube Prometheus Stack
{% endif %}
{% if values.enableMetricsServer %}
- ${{ values.operation === 'add' ? '✅ Adicionado' : '❌ Removido' }}: Metrics Server
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